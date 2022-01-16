import 'package:fancy_weather/models/models.dart';
import 'package:flutter/material.dart';

@immutable
class APICondition extends Entity<APICondition> {
  final String text, icon;
  final int code;

  APICondition({
    @required this.text,
    @required this.icon,
    @required this.code,
  });

  @override
  factory APICondition.createEmpty() => APICondition(
        text: null,
        icon: null,
        code: null,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is APICondition &&
          other.text == text &&
          other.icon == icon &&
          other.code == code;

  @override
  int get hashCode => text.hashCode ^ icon.hashCode ^ code.hashCode;

  @override
  APICondition copyWith({
    String text,
    String icon,
    int code,
  }) =>
      APICondition(
        text: text ?? this.text,
        icon: icon ?? this.icon,
        code: code ?? this.code,
      );

  @override
  Map<String, dynamic> toJson() => {
        'text': text,
        'icon': icon,
        'code': code,
      };

  @override
  APICondition.fromJson(json)
      : text = json['text'],
        icon = json['icon'],
        code = Entity.parseJsonInt(json['code']);

  @override
  bool get isNotValid => !isValid;

  @override
  bool get isValid => text != null && icon != null && code != null;
}
