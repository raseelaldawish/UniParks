import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class BuildingRecord extends FirestoreRecord {
  BuildingRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Building');

  static Stream<BuildingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BuildingRecord.fromSnapshot(s));

  static Future<BuildingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BuildingRecord.fromSnapshot(s));

  static BuildingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BuildingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BuildingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BuildingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BuildingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BuildingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBuildingRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class BuildingRecordDocumentEquality implements Equality<BuildingRecord> {
  const BuildingRecordDocumentEquality();

  @override
  bool equals(BuildingRecord? e1, BuildingRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(BuildingRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is BuildingRecord;
}
