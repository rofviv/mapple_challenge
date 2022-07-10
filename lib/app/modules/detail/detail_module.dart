import 'package:flutter_modular/flutter_modular.dart';
import 'domain/repositories/detail_repository.dart';

import 'bloc/detail_bloc.dart';
import 'detail_widget.dart';

class DetailModule extends Module {
  static String route = '/detail';

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DetailRepositoryImpl(dio: i())),
    Bind.lazySingleton((i) => DetailBloc(detailRepository: i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(DetailWidget.route, child: (_, args) => DetailWidget(productId: args.data['productId'],), transition: TransitionType.rightToLeft),
  ];
}
