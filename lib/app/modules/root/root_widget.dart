import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/shared.dart';
import 'bloc/root_bloc.dart';

class RootWidget extends StatelessWidget {
  static String route = '/';

  const RootWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    RootBloc rootBloc = Modular.get();
    return Scaffold(
      body: const RouterOutlet(),
      bottomNavigationBar: BlocBuilder<RootBloc, RootState>(
        bloc: rootBloc,
        builder: (context, state) {
          return BottomNavigationBar(
            selectedItemColor: primaryColor,
            currentIndex: state.currentIndex,
            onTap: (index) {
              rootBloc.add(OnChangeIndex(index));
            },
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                label: "Buscar",
                icon: Icon(Icons.search),
              ),
              BottomNavigationBarItem(
                label: "Historial",
                icon: Icon(Icons.history),
              ),
            ],
          );
        },
      ),
    );
  }
}
