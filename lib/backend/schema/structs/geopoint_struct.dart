// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GeopointStruct extends FFFirebaseStruct {
  GeopointStruct({
    LatLng? location,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _location = location,
        super(firestoreUtilData);

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  set location(LatLng? val) => _location = val;
  bool hasLocation() => _location != null;

  static GeopointStruct fromMap(Map<String, dynamic> data) => GeopointStruct(
        location: data['location'] as LatLng?,
      );

  static GeopointStruct? maybeFromMap(dynamic data) =>
      data is Map ? GeopointStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'location': _location,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'location': serializeParam(
          _location,
          ParamType.LatLng,
        ),
      }.withoutNulls;

  static GeopointStruct fromSerializableMap(Map<String, dynamic> data) =>
      GeopointStruct(
        location: deserializeParam(
          data['location'],
          ParamType.LatLng,
          false,
        ),
      );

  @override
  String toString() => 'GeopointStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GeopointStruct && location == other.location;
  }

  @override
  int get hashCode => const ListEquality().hash([location]);
}

GeopointStruct createGeopointStruct({
  LatLng? location,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GeopointStruct(
      location: location,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GeopointStruct? updateGeopointStruct(
  GeopointStruct? geopoint, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    geopoint
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGeopointStructData(
  Map<String, dynamic> firestoreData,
  GeopointStruct? geopoint,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (geopoint == null) {
    return;
  }
  if (geopoint.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && geopoint.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final geopointData = getGeopointFirestoreData(geopoint, forFieldValue);
  final nestedData = geopointData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = geopoint.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGeopointFirestoreData(
  GeopointStruct? geopoint, [
  bool forFieldValue = false,
]) {
  if (geopoint == null) {
    return {};
  }
  final firestoreData = mapToFirestore(geopoint.toMap());

  // Add any Firestore field values
  geopoint.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGeopointListFirestoreData(
  List<GeopointStruct>? geopoints,
) =>
    geopoints?.map((e) => getGeopointFirestoreData(e, true)).toList() ?? [];
