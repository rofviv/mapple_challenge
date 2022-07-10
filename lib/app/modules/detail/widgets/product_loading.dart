import 'package:flutter/material.dart';

import '../../../shared/shared.dart';

class ProductLoading extends StatelessWidget {
  const ProductLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Stack(
            children: [
              const Skeleton(height: 350, width: double.infinity),
              SafeArea(
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: const [
                Skeleton(
                  height: 20,
                  width: double.infinity,
                  length: 5,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
