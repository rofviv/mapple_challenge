import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../bloc/history_bloc.dart';

class HeaderHistory extends StatelessWidget {
  const HeaderHistory({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    HistoryBloc historyBloc = Modular.get();
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Historial",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          BlocBuilder<HistoryBloc, HistoryState>(
            bloc: historyBloc,
            builder: (context, state) {
              if (state.listItems.isNotEmpty) {
                return TextButton(
                  child: const Text(
                    "Borrar historial",
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () => historyBloc.clearItemList(),
                );
              }
              return const SizedBox();
            },
          )
        ],
      ),
    );
  }
}
