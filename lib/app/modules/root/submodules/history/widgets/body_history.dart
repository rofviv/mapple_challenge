
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../modules.dart';
import '../../../models/models.dart';
import '../../../widgets/widgets.dart';
import '../bloc/history_bloc.dart';

class BodyHistory extends StatelessWidget {
  const BodyHistory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HistoryBloc historyBloc = Modular.get();
    return Expanded(
      child: BlocBuilder<HistoryBloc, HistoryState>(
        bloc: historyBloc,
        builder: (context, state) {
          if (state.loading) {
            return const SizedBox();
          }
          if (state.listItems.isEmpty) {
            return const Center(
              child: Text(
                "No hay datos",
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            );
          }
          return ListView.builder(
            itemCount: state.listItems.length,
            itemBuilder: (_, index) {
              final product = state.listItems[index];
              return FadeInRight(
                delay: Duration(milliseconds: 100 + (index * 100)),
                child: ItemProduct(
                  product: ProductSearch(
                    id: product.id,
                    siteId: product.siteId,
                    title: product.title,
                    price: product.price,
                    currencyId: product.currencyId,
                    thumbnail: product.thumbnail,
                  ),
                  onPress: () => Modular.to.pushNamed(
                    DetailModule.route,
                    arguments: {"productId": product.id},
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
