import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/core/presentation/routes/app_router.dart';
import '/core/shared/app_config.dart';
import '/core/shared/constanst/constants.dart';
import 'core/shared/providers.dart';

/// App Config Provider
late StateProvider<AppConfig> appConfigProvider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  appConfigProvider =
      StateProvider<AppConfig>((ref) => AppConfig(dev, devBaseUrl));
  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  MainApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(themeNotifierProvider);
    return MaterialApp.router(
      title: 'Credible App',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(),
    );
  }
}
