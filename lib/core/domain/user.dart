import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

/// User Entity
@freezed
class User with _$User {
  /// Empty constructor
  const User._();

  /// Named constructor of Register User properties
  const factory User({
    ///name
    required String name,

    ///Email
    required String email,

    ///Password
    required String password,
  }) = _User;
}