import 'package:base_app/config/theme/app_theme.dart';
import 'package:base_app/core/presentation/routes/app_router.dart';
import 'package:base_app/core/shared/app_config.dart';
import 'package:base_app/core/shared/constanst/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// App Config Provider
late StateProvider<AppConfig> appConfigProvider;

void main() {
  appConfigProvider =
      StateProvider<AppConfig>((ref) => AppConfig(dev, devBaseUrl));
  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Base App',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}
