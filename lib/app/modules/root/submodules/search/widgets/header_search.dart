import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../bloc/search_bloc.dart';

class HeaderSearch extends StatelessWidget {
  const HeaderSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchBloc searchBloc = Modular.get();
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 0, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Buscar",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchBloc.searchTextCtrl,
                    onChanged: (value) => searchBloc.add(OnChangeQuery(value)),
                    decoration: const InputDecoration(
                      isDense: true,
                      icon: Icon(Icons.search),
                      border: InputBorder.none,
                      hintText: "Buscar",
                    ),
                  ),
                ),
                BlocBuilder<SearchBloc, SearchState>(
                  bloc: searchBloc,
                  builder: (context, state) {
                    if (state.query.isNotEmpty) {
                      return GestureDetector(
                        onTap: () {
                          searchBloc.add(const OnChangeQuery(""));
                          searchBloc.searchTextCtrl.text = "";
                          searchBloc.debounce?.cancel();
                          searchBloc.add(const OnChangeResults([]));
                        },
                        child: const Icon(Icons.close),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: BlocBuilder<SearchBloc, SearchState>(
              bloc: searchBloc,
              builder: (context, state) {
                return Text(
                  state.query.isNotEmpty && state.query.length < 3
                      ? "Escribe al menos 3 carácteres"
                      : "",
                  style: const TextStyle(color: Colors.grey),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
