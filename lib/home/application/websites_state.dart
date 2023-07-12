import 'package:freezed_annotation/freezed_annotation.dart';

import '/example/domain/common_failure.dart';

part 'websites_state.freezed.dart';

///Website data state
@freezed
class WebsiteState with _$WebsiteState {
  const WebsiteState._();

  ///Initial: state of Website empty
  const factory WebsiteState.initial() = _WebsiteStateInitial;

  ///Loading: state of Website while waiting for information
  const factory WebsiteState.loading() = _WebsiteStateLoading;

  ///Data: state of notification when the information arrives
  const factory WebsiteState.data({required List<String> websites}) =
      _WebsiteStateData;

  ///Error: state of Website when an error occurs
  const factory WebsiteState.error(CommonFailure failure) = _WebsiteStateError;
}
