import 'dart:convert';

extension JsonExtension on Object? {
  Map<String, dynamic> toMap(int precision) {
    return json.decode(json.encode(this)) as Map<String, dynamic>;
  }
}
