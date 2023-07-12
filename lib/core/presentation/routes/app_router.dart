import 'package:auto_route/auto_route.dart';
import 'package:base_app/example/presentation/screens/screens.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        //HomeScreen is generated as HomeRoute because
        AutoRoute(page: ExampleRoute.page, initial: true),
      ];
}
