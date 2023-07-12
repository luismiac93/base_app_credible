import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';

/// Character Entity
@freezed
class Character with _$Character {
  /// Empty constructor
  const Character._();

  /// Named constructor of Register User properties
  const factory Character({
    ///Id
    required int id,

    ///Name
    required String name,

    ///Status
    required String status,

    ///Species
    required String species,

    ///Gender
    required String gender,

    ///Url
    required String url,

    ///Image
    required String image,

    ///Created
    required String created,
  }) = _Character;
}
