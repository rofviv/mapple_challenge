import 'package:flutter_modular/flutter_modular.dart';

import 'splash_controller.dart';
import 'splash_widget.dart';

class SplashModule extends Module {
  static String route = '/';
  
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => SplashController())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(SplashWidget.route, child: (_, __) => const SplashWidget())
  ];

}