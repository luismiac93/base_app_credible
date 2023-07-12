import 'package:freezed_annotation/freezed_annotation.dart';

import '/core/domain/user.dart';
import '/example/domain/common_failure.dart';

part 'register_state.freezed.dart';

///Register data state
@freezed
class RegisterState with _$RegisterState {
  const RegisterState._();

  ///Initial: state of Register empty
  const factory RegisterState.initial() = _RegisterStateInitial;

  ///Loading: state of Register while waiting for information
  const factory RegisterState.loading() = _RegisterStateLoading;

  ///Data: state of notification when the information arrives
  const factory RegisterState.data({required User user}) = _RegisterStateData;

  ///Error: state of Register when an error occurs
  const factory RegisterState.error(CommonFailure failure) =
      _RegisterStateError;
}
