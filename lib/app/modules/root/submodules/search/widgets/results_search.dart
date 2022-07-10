import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../shared/shared.dart';
import '../../../../modules.dart';
import '../../../models/models.dart';
import '../../../widgets/widgets.dart';
import '../bloc/search_bloc.dart';

class ResultsSearch extends StatelessWidget {
  const ResultsSearch({
    Key? key,
    required this.searchBloc,
    required this.state,
  }) : super(key: key);

  final SearchBloc searchBloc;
  final SearchState state;

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (t) {
        if (t is ScrollEndNotification) {
          final offset = searchBloc.scrollController.position.pixels;
          final maxScrollExtend =
              searchBloc.scrollController.position.maxScrollExtent;
          if (offset >= maxScrollExtend) {
            searchBloc.getNextPage(searchBloc.page + 1);
          }
        }
        return true;
      },
      child: Stack(
        children: [
          ListView.builder(
            controller: searchBloc.scrollController,
            itemCount: state.results.length,
            itemBuilder: (_, index) {
              final product = state.results[index];
              return ItemProduct(
                product: ProductSearch(
                  id: product.id,
                  siteId: product.siteId,
                  title: product.title,
                  price: product.price,
                  currencyId: product.currencyId,
                  thumbnail: product.thumbnail,
                ),
                onPress: () {
                  Modular.to.pushNamed(
                    DetailModule.route,
                    arguments: {"productId": product.id},
                  );
                  searchBloc.saveItemHistory(product);
                },
              );
            },
          ),
          if (state.gettingNextPage)
            const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    strokeWidth: 4,
                    color: primaryColor,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
