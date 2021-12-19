// @dart=2.9

abstract class Entity<T> {
  Entity();
  Entity<T> copyWith();
  bool get isValid;
  bool get isNotValid;
  Entity.fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
  Entity.createEmpty();

  // Entity.fromJsonEncrypted(Map<String, dynamic> json, EncryptionKey key);
  // Map<String, dynamic> toJsonEncrypted(EncryptionKey encryptionKey);

  static bool parseJsonBool(dynamic value) {
    if (value is bool) return value;
    if (value is num) return value == 1;
    if (value is String) return value.toLowerCase() == 'true';
    return null;
  }

  static DateTime parseJsonDate(dynamic value) {
    if (value is DateTime) return value;
    if (value is num) return DateTime.fromMillisecondsSinceEpoch(value);
    if (value is String) return DateTime.parse(value);
    return null;
  }

  static num parseJsonNum(dynamic value) {
    if (value is num) return value;
    if (value is String) return num.parse(value);
    if (value is bool) return value ? 1 : 0;
    return null;
  }

  static double parseJsonDouble(dynamic value) {
    if (value is num) return value.toDouble();
    if (value is String) return double.parse(value);
    if (value is bool) return (value ? 1.0 : 0.0).toDouble();
    return null;
  }

  static int parseJsonInt(dynamic value) {
    if (value is num) return value.toInt();
    if (value is String) return int.parse(value);
    if (value is bool) return (value ? 1 : 0).toInt();
    return null;
  }

  static String asString(dynamic value) {
    return value != null ? value.toString() : null;
  }
}
