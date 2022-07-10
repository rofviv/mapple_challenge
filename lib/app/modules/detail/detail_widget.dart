import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mapple_challenge/app/modules/detail/widgets/product_loading.dart';
import 'package:mapple_challenge/app/modules/detail/widgets/product_slider.dart';

import 'bloc/detail_bloc.dart';

class DetailWidget extends StatefulWidget {
  static String route = '/';
  final String productId;

  const DetailWidget({Key? key, required this.productId}) : super(key: key);

  @override
  State<DetailWidget> createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  DetailBloc detailBloc = Modular.get();

  @override
  void initState() {
    detailBloc.loadDetailProduct(widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DetailBloc detailBloc = Modular.get();
    return Scaffold(
      body: BlocBuilder<DetailBloc, DetailState>(
        bloc: detailBloc,
        builder: (context, state) {
          if (state.loading) {
            return const ProductLoading();
          }
          final product = state.itemProduct!;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ProductSlider(
                      items: [...product.pictures.map((e) => e.url).toList()],
                    ),
                    SafeArea(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10, right: 10),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              product.condition,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Precio"),
                      Text(
                        "${product.currencyId} ${product.price}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(product.warranty),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Características",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ...product.attributes.map(
                        (e) => Text("${e.name} ${e.valueName}"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
