import 'package:collection/collection.dart';

enum UserType {
  student,
  faculty,
  staff,
}

enum Situation {
  no_show,
  show,
  late,
}

enum Status {
  pending,
  confirmed,
  cancelled,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (UserType):
      return UserType.values.deserialize(value) as T?;
    case (Situation):
      return Situation.values.deserialize(value) as T?;
    case (Status):
      return Status.values.deserialize(value) as T?;
    default:
      return null;
  }
}
