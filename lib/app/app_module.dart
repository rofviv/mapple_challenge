import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'domain/repositories/preferences_repository.dart';
import 'guards/app_guard.dart';
import 'modules/modules.dart';

const baseUrl = "https://api.mercadolibre.com";

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    AsyncBind<SharedPreferences>((i) => SharedPreferences.getInstance()),
    Bind.lazySingleton((i) => PreferencesRepositoryImpl(i())),
    Bind.lazySingleton((i) => Dio(BaseOptions(baseUrl: baseUrl))),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      SplashModule.route,
      module: SplashModule(),
      guards: [AppGuard()],
    ),
    ModuleRoute(RootModule.route, module: RootModule()),
    ModuleRoute(DetailModule.route, module: DetailModule()),
  ];
}
