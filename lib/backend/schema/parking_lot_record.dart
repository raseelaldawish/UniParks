import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ParkingLotRecord extends FirestoreRecord {
  ParkingLotRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Capacity" field.
  int? _capacity;
  int get capacity => _capacity ?? 0;
  bool hasCapacity() => _capacity != null;

  // "Location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "Availability" field.
  bool? _availability;
  bool get availability => _availability ?? false;
  bool hasAvailability() => _availability != null;

  // "NearBuildings" field.
  List<DocumentReference>? _nearBuildings;
  List<DocumentReference> get nearBuildings => _nearBuildings ?? const [];
  bool hasNearBuildings() => _nearBuildings != null;

  void _initializeFields() {
    _capacity = castToType<int>(snapshotData['Capacity']);
    _location = snapshotData['Location'] as LatLng?;
    _availability = snapshotData['Availability'] as bool?;
    _nearBuildings = getDataList(snapshotData['NearBuildings']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ParkingLot');

  static Stream<ParkingLotRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ParkingLotRecord.fromSnapshot(s));

  static Future<ParkingLotRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ParkingLotRecord.fromSnapshot(s));

  static ParkingLotRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ParkingLotRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ParkingLotRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ParkingLotRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ParkingLotRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ParkingLotRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createParkingLotRecordData({
  int? capacity,
  LatLng? location,
  bool? availability,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Capacity': capacity,
      'Location': location,
      'Availability': availability,
    }.withoutNulls,
  );

  return firestoreData;
}

class ParkingLotRecordDocumentEquality implements Equality<ParkingLotRecord> {
  const ParkingLotRecordDocumentEquality();

  @override
  bool equals(ParkingLotRecord? e1, ParkingLotRecord? e2) {
    const listEquality = ListEquality();
    return e1?.capacity == e2?.capacity &&
        e1?.location == e2?.location &&
        e1?.availability == e2?.availability &&
        listEquality.equals(e1?.nearBuildings, e2?.nearBuildings);
  }

  @override
  int hash(ParkingLotRecord? e) => const ListEquality()
      .hash([e?.capacity, e?.location, e?.availability, e?.nearBuildings]);

  @override
  bool isValidKey(Object? o) => o is ParkingLotRecord;
}
