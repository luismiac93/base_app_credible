import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/config/theme/app_theme.dart';
import '/core/infrastructure/core_repository.dart';
import '/core/infrastructure/remote_service/core_service.dart';
import '/home/application/websites_notifier.dart';
import '/home/application/websites_state.dart';
import '/login/application/login_notifier.dart';
import '/login/application/login_state.dart';
import '/main.dart';
import '/register/application/register_notifier.dart';
import '/register/application/register_state.dart';

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

//An Object of ThemeData type custom.
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

// Coommon use like controller or notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  //state is new instance of AppTheme
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int index) {
    state = state.copyWith(selectedColor: index);
  }
}

///login notifier provider
final websitiesNotifierProvider =
    StateNotifierProvider<WebsitiesNotifier, WebsiteState>(
  (ref) => WebsitiesNotifier(
    coreRepository: ref.watch(coreRepositoryProvider),
  ),
);
