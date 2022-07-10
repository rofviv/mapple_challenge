import 'package:flutter_modular/flutter_modular.dart';

import 'bloc/search_bloc.dart';
import 'domain/repositories/search_repository.dart';
import 'search_widget.dart';

class SearchModule extends Module {
  static String route = '/search';

  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => SearchBloc(
        preferencesRepository: i(),
        searchRepository: SearchRepositoryImpl(dio: i()),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(SearchWidget.route, child: (_, __) => const SearchWidget()),
  ];
}
