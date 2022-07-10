import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../shared/shared.dart';
import '../bloc/search_bloc.dart';
import '../utils/values.dart';
import 'widgets.dart';

class BodySearch extends StatelessWidget {
  const BodySearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchBloc searchBloc = Modular.get();
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: BlocBuilder<SearchBloc, SearchState>(
          bloc: searchBloc,
          builder: (context, state) {
            if (state.loading) {
              return const SingleChildScrollView(
                child: Skeleton(
                  height: 70,
                  width: double.infinity,
                  length: 7,
                ),
              );
            }
            if (state.results.isEmpty && state.query.length < 3) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (state.searchRecent.isNotEmpty)
                      FadeIn(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: SuggestSearch(
                            title: "Recientes",
                            list: state.searchRecent,
                            onDelete: () => searchBloc.clearSearchRecent(),
                          ),
                        ),
                      ),
                    FadeIn(
                      child: SuggestSearch(
                        title: "Sugerencias",
                        list: suggestList,
                      ),
                    ),
                  ],
                ),
              );
            }
            if (state.results.isEmpty) {
              return Center(
                child: Text(
                  "No se encontraron resultados para \"${state.query}\"",
                  style: const TextStyle(color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
              );
            }
            return ResultsSearch(
              searchBloc: searchBloc,
              state: state,
            );
          },
        ),
      ),
    );
  }
}

