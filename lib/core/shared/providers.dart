import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/login/application/login_notifier.dart';
import '/login/application/login_state.dart';
import '/main.dart';
import '/register/application/register_notifier.dart';
import '/register/application/register_state.dart';
import '/core/infrastructure/core_repository.dart';
import '/core/infrastructure/remote_service/core_service.dart';

/// Dio Service Dependency Injection
final dioProvider = Provider((ref) => Dio());

/// Service of core Service
final coreServiceProvider = Provider(
  (ref) => CoreService(
    ref.watch(dioProvider),
    ref.watch(appConfigProvider),
  ),
);

/// Repository of core Repository
final coreRepositoryProvider = Provider(
  (ref) => CoreRepository(ref.watch(coreServiceProvider)),
);

///register notifier provider
final registerNotifierProvider =
    StateNotifierProvider<RegisterNotifier, RegisterState>(
  (ref) => RegisterNotifier(
    coreRepository: ref.watch(coreRepositoryProvider),
  ),
);

///login notifier provider
final loginNotifierProvider = StateNotifierProvider<LoginNotifier, LoginState>(
  (ref) => LoginNotifier(
    coreRepository: ref.watch(coreRepositoryProvider),
  ),
);
