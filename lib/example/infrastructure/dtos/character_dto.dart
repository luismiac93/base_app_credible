import 'package:freezed_annotation/freezed_annotation.dart';

import '/example/domain/character.dart';

part 'character_dto.freezed.dart';
part 'character_dto.g.dart';

/// Data Transfer Object of Character
@freezed
class CharacterDTO with _$CharacterDTO {
  /// Empty constructor
  const CharacterDTO._();

  /// Named constructor of Character properties
  const factory CharacterDTO({
    ///Id
    @JsonKey(name: 'id') required int id,

    ///Name
    @JsonKey(name: 'name') required String name,

    ///Status
    @JsonKey(name: 'status') required String status,

    ///Species
    @JsonKey(name: 'species') required String species,

    ///Gender
    @JsonKey(name: 'gender') required String gender,

    ///Url
    @JsonKey(name: 'url') required String url,

    ///Image
    @JsonKey(name: 'image') required String image,

    ///Created
    @JsonKey(name: 'created') required String created,
  }) = _CharacterDTO;

  /// Generates fromJson and toJson methods
  factory CharacterDTO.fromJson(Map<String, dynamic> json) =>
      _$CharacterDTOFromJson(json);

  /// Converts fromDomain
  factory CharacterDTO.fromDomain(Character _) => CharacterDTO(
        id: _.id,
        name: _.name,
        status: _.status,
        species: _.species,
        gender: _.gender,
        url: _.url,
        image: _.image,
        created: _.created,
      );

  /// Converts to Character Entity
  Character toDomain() => Character(
        id: id,
        name: name,
        status: status,
        species: species,
        gender: gender,
        url: url,
        image: image,
        created: created,
      );
}
