

import '../../domain/entities/entities.dart';

class Condition {
  final String? text;
  final String? icon;
  final int? code;

  Condition({this.text, this.icon, this.code});

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(text: json['text'], icon: json['icon'], code: json['code']);
  }
}

extension ConditionMapper on Condition {
  ConditionData toDomain() {
    return ConditionData(
      text: text,
      icon: icon,
      code: code,
    );
  }
}