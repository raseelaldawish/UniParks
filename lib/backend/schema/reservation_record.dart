import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';

class ReservationRecord extends FirestoreRecord {
  ReservationRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "UserID" field.
  DocumentReference? _userID;
  DocumentReference? get userID => _userID;
  bool hasUserID() => _userID != null;

  // "SpaceID" field.
  DocumentReference? _spaceID;
  DocumentReference? get spaceID => _spaceID;
  bool hasSpaceID() => _spaceID != null;

  // "StartTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "EndTime" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  // "Status" field.
  Status? _status;
  Status? get status => _status;
  bool hasStatus() => _status != null;

  // "Deleted" field.
  bool? _deleted;
  bool get deleted => _deleted ?? false;
  bool hasDeleted() => _deleted != null;

  void _initializeFields() {
    _userID = snapshotData['UserID'] as DocumentReference?;
    _spaceID = snapshotData['SpaceID'] as DocumentReference?;
    _startTime = snapshotData['StartTime'] as DateTime?;
    _endTime = snapshotData['EndTime'] as DateTime?;
    _status = deserializeEnum<Status>(snapshotData['Status']);
    _deleted = snapshotData['Deleted'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Reservation');

  static Stream<ReservationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReservationRecord.fromSnapshot(s));

  static Future<ReservationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReservationRecord.fromSnapshot(s));

  static ReservationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReservationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReservationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReservationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReservationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReservationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReservationRecordData({
  DocumentReference? userID,
  DocumentReference? spaceID,
  DateTime? startTime,
  DateTime? endTime,
  Status? status,
  bool? deleted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'UserID': userID,
      'SpaceID': spaceID,
      'StartTime': startTime,
      'EndTime': endTime,
      'Status': status,
      'Deleted': deleted,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReservationRecordDocumentEquality implements Equality<ReservationRecord> {
  const ReservationRecordDocumentEquality();

  @override
  bool equals(ReservationRecord? e1, ReservationRecord? e2) {
    return e1?.userID == e2?.userID &&
        e1?.spaceID == e2?.spaceID &&
        e1?.startTime == e2?.startTime &&
        e1?.endTime == e2?.endTime &&
        e1?.status == e2?.status &&
        e1?.deleted == e2?.deleted;
  }

  @override
  int hash(ReservationRecord? e) => const ListEquality().hash(
      [e?.userID, e?.spaceID, e?.startTime, e?.endTime, e?.status, e?.deleted]);

  @override
  bool isValidKey(Object? o) => o is ReservationRecord;
}
