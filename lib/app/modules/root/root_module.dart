import 'package:flutter_modular/flutter_modular.dart';

import 'bloc/root_bloc.dart';
import 'root_widget.dart';
import 'submodules/submodules.dart';

class RootModule extends Module {
  static String route = '/root';
  static String initialRoute = route + SearchModule.route;
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RootBloc())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      RootWidget.route,
      child: (_, __) => const RootWidget(),
      children: [
        ModuleRoute(
          SearchModule.route,
          module: SearchModule(),
          transition: TransitionType.noTransition,
        ),
        ModuleRoute(
          HistoryModule.route,
          module: HistoryModule(),
          transition: TransitionType.noTransition,
        ),
      ],
    ),
  ];
}
