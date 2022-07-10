import 'package:flutter_modular/flutter_modular.dart';
import 'package:mapple_challenge/app/modules/root/submodules/history/bloc/history_bloc.dart';

import 'history_widget.dart';

class HistoryModule extends Module {
  static String route = '/history';

  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => HistoryBloc(
        preferencesRepository: i(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(HistoryWidget.route, child: (_, __) => const HistoryWidget()),
  ];
}
