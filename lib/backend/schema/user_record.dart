import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';

class UserRecord extends FirestoreRecord {
  UserRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "UserType" field.
  UserType? _userType;
  UserType? get userType => _userType;
  bool hasUserType() => _userType != null;

  // "Accessibility" field.
  bool? _accessibility;
  bool get accessibility => _accessibility ?? false;
  bool hasAccessibility() => _accessibility != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _password = snapshotData['Password'] as String?;
    _userType = deserializeEnum<UserType>(snapshotData['UserType']);
    _accessibility = snapshotData['Accessibility'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('User');

  static Stream<UserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRecord.fromSnapshot(s));

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRecord.fromSnapshot(s));

  static UserRecord fromSnapshot(DocumentSnapshot snapshot) => UserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRecordData({
  String? name,
  String? password,
  UserType? userType,
  bool? accessibility,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'Password': password,
      'UserType': userType,
      'Accessibility': accessibility,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRecordDocumentEquality implements Equality<UserRecord> {
  const UserRecordDocumentEquality();

  @override
  bool equals(UserRecord? e1, UserRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.password == e2?.password &&
        e1?.userType == e2?.userType &&
        e1?.accessibility == e2?.accessibility;
  }

  @override
  int hash(UserRecord? e) => const ListEquality()
      .hash([e?.name, e?.password, e?.userType, e?.accessibility]);

  @override
  bool isValidKey(Object? o) => o is UserRecord;
}
