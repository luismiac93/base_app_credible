import 'package:freezed_annotation/freezed_annotation.dart';

import '/core/domain/user.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

/// Data Transfer Object of User
@freezed
class UserDTO with _$UserDTO {
  /// Empty constructor
  const UserDTO._();

  /// Named constructor of User properties
  const factory UserDTO({
    ///Name
    @JsonKey(name: 'name') required String name,

    ///Name
    @JsonKey(name: 'email') required String email,

    ///Name
    @JsonKey(name: 'password') required String password,
  }) = _UserDTO;

  /// Generates fromJson and toJson methods
  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  /// Converts fromDomain
  factory UserDTO.fromDomain(User _) => UserDTO(
        name: _.name,
        email: _.email,
        password: _.password,
      );

  /// Converts to User Entity
  User toDomain() => User(
        name: name,
        email: email,
        password: password,
      );
}
