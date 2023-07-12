import 'dart:core';

import '/example/domain/character.dart';
import '/example/infrastructure/dtos/character_dto.dart';

/// Convert List of DTO to characterDTO Entity List
extension CharacterDTOListToDomainList on List<CharacterDTO> {
  /// Return List of character
  List<Character> characterListToDomain() {
    return map((e) => e.toDomain()).toList();
  }
}
