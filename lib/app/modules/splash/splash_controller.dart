import 'package:flutter_modular/flutter_modular.dart';

import '../modules.dart';

class SplashController {
  SplashController() {
    _init();
  }

  void _init() async {
    await Future.delayed(const Duration(seconds: 3));
    Modular.to.navigate(RootModule.initialRoute);
  }
}
