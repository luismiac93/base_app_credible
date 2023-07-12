import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:base_app/example/presentation/screens/screens.dart';
import 'package:base_app/home/presentation/screens/screens.dart';
import 'package:base_app/register/presentation/screens/screens.dart';
import 'package:base_app/login/presentation/screens/screens.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        //HomeScreen is generated as HomeRoute because
        AutoRoute(page: LoginRoute.page, initial: true),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: WebsiteRoute.page),
      ];
}
