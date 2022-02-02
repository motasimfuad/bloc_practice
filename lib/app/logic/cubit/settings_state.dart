import 'dart:convert';
import 'package:equatable/equatable.dart';

class SettingsState extends Equatable {
  final bool appNotifications;
  final bool emailNotifications;

  const SettingsState({
    required this.appNotifications,
    required this.emailNotifications,
  });

  SettingsState copyWith({
    bool? appNotifications,
    bool? emailNotifications,
  }) {
    return SettingsState(
      appNotifications: appNotifications ?? this.appNotifications,
      emailNotifications: emailNotifications ?? this.emailNotifications,
    );
  }

  @override
  List<Object> get props => [
        appNotifications,
        emailNotifications,
      ];

  Map<String, dynamic> toMap() {
    return {
      'appNotifications': appNotifications,
      'emailNotifications': emailNotifications,
    };
  }

  factory SettingsState.fromMap(Map<String, dynamic> map) {
    return SettingsState(
      appNotifications: map['appNotifications'] ?? false,
      emailNotifications: map['emailNotifications'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory SettingsState.fromJson(String source) =>
      SettingsState.fromMap(json.decode(source));
}
