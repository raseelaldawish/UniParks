import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';

class ParkingHistoryRecord extends FirestoreRecord {
  ParkingHistoryRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "ReservationID" field.
  DocumentReference? _reservationID;
  DocumentReference? get reservationID => _reservationID;
  bool hasReservationID() => _reservationID != null;

  // "CheckInTime" field.
  DateTime? _checkInTime;
  DateTime? get checkInTime => _checkInTime;
  bool hasCheckInTime() => _checkInTime != null;

  // "CheckOutTime" field.
  DateTime? _checkOutTime;
  DateTime? get checkOutTime => _checkOutTime;
  bool hasCheckOutTime() => _checkOutTime != null;

  // "Situation" field.
  Situation? _situation;
  Situation? get situation => _situation;
  bool hasSituation() => _situation != null;

  void _initializeFields() {
    _reservationID = snapshotData['ReservationID'] as DocumentReference?;
    _checkInTime = snapshotData['CheckInTime'] as DateTime?;
    _checkOutTime = snapshotData['CheckOutTime'] as DateTime?;
    _situation = deserializeEnum<Situation>(snapshotData['Situation']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ParkingHistory');

  static Stream<ParkingHistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ParkingHistoryRecord.fromSnapshot(s));

  static Future<ParkingHistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ParkingHistoryRecord.fromSnapshot(s));

  static ParkingHistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ParkingHistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ParkingHistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ParkingHistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ParkingHistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ParkingHistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createParkingHistoryRecordData({
  DocumentReference? reservationID,
  DateTime? checkInTime,
  DateTime? checkOutTime,
  Situation? situation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ReservationID': reservationID,
      'CheckInTime': checkInTime,
      'CheckOutTime': checkOutTime,
      'Situation': situation,
    }.withoutNulls,
  );

  return firestoreData;
}

class ParkingHistoryRecordDocumentEquality
    implements Equality<ParkingHistoryRecord> {
  const ParkingHistoryRecordDocumentEquality();

  @override
  bool equals(ParkingHistoryRecord? e1, ParkingHistoryRecord? e2) {
    return e1?.reservationID == e2?.reservationID &&
        e1?.checkInTime == e2?.checkInTime &&
        e1?.checkOutTime == e2?.checkOutTime &&
        e1?.situation == e2?.situation;
  }

  @override
  int hash(ParkingHistoryRecord? e) => const ListEquality()
      .hash([e?.reservationID, e?.checkInTime, e?.checkOutTime, e?.situation]);

  @override
  bool isValidKey(Object? o) => o is ParkingHistoryRecord;
}
