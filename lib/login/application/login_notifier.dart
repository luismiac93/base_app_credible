import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/core/domain/user.dart';
import '/core/infrastructure/core_repository.dart';
import '/login/application/login_state.dart';

///Login notifier
class LoginNotifier extends StateNotifier<LoginState> {
  /// Constructor
  LoginNotifier({required this.coreRepository})
      : super(const LoginState.initial());

  ///Repository core
  final CoreRepository coreRepository;

  ///Login process
  Future<void> login(User user) async {
    state = const LoginState.loading();

    ///Get user
    final result = await coreRepository.login(user);

    state = result.fold(
      (error) => LoginState.error(error),
      (user) => LoginState.data(user: user),
    );
  }
}
