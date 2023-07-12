import 'package:freezed_annotation/freezed_annotation.dart';

import '/example/domain/common_failure.dart';
import '/example/domain/character.dart';

part 'example_state.freezed.dart';

///Example data state
@freezed
class ExampleState with _$ExampleState {
  const ExampleState._();

  ///Initial: state of Example empty
  const factory ExampleState.initial() = _ExampleStateInitial;

  ///Loading: state of Example while waiting for information
  const factory ExampleState.loading() = _ExampleStateLoading;

  ///Data: state of notification when the information arrives
  const factory ExampleState.data({required List<Character> characters}) =
      _ExampleStateData;

  ///Error: state of Example when an error occurs
  const factory ExampleState.error(CommonFailure failure) = _ExampleStateError;
}
