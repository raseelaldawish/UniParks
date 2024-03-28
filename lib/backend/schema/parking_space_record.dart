import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ParkingSpaceRecord extends FirestoreRecord {
  ParkingSpaceRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "LotID" field.
  DocumentReference? _lotID;
  DocumentReference? get lotID => _lotID;
  bool hasLotID() => _lotID != null;

  // "SpaceNumber" field.
  int? _spaceNumber;
  int get spaceNumber => _spaceNumber ?? 0;
  bool hasSpaceNumber() => _spaceNumber != null;

  // "Availability" field.
  bool? _availability;
  bool get availability => _availability ?? false;
  bool hasAvailability() => _availability != null;

  // "Accessibility" field.
  bool? _accessibility;
  bool get accessibility => _accessibility ?? false;
  bool hasAccessibility() => _accessibility != null;

  void _initializeFields() {
    _lotID = snapshotData['LotID'] as DocumentReference?;
    _spaceNumber = castToType<int>(snapshotData['SpaceNumber']);
    _availability = snapshotData['Availability'] as bool?;
    _accessibility = snapshotData['Accessibility'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ParkingSpace');

  static Stream<ParkingSpaceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ParkingSpaceRecord.fromSnapshot(s));

  static Future<ParkingSpaceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ParkingSpaceRecord.fromSnapshot(s));

  static ParkingSpaceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ParkingSpaceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ParkingSpaceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ParkingSpaceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ParkingSpaceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ParkingSpaceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createParkingSpaceRecordData({
  DocumentReference? lotID,
  int? spaceNumber,
  bool? availability,
  bool? accessibility,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'LotID': lotID,
      'SpaceNumber': spaceNumber,
      'Availability': availability,
      'Accessibility': accessibility,
    }.withoutNulls,
  );

  return firestoreData;
}

class ParkingSpaceRecordDocumentEquality
    implements Equality<ParkingSpaceRecord> {
  const ParkingSpaceRecordDocumentEquality();

  @override
  bool equals(ParkingSpaceRecord? e1, ParkingSpaceRecord? e2) {
    return e1?.lotID == e2?.lotID &&
        e1?.spaceNumber == e2?.spaceNumber &&
        e1?.availability == e2?.availability &&
        e1?.accessibility == e2?.accessibility;
  }

  @override
  int hash(ParkingSpaceRecord? e) => const ListEquality()
      .hash([e?.lotID, e?.spaceNumber, e?.availability, e?.accessibility]);

  @override
  bool isValidKey(Object? o) => o is ParkingSpaceRecord;
}
