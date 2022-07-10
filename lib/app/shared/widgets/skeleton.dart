import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({
    Key? key,
    required this.height,
    required this.width,
    this.padding,
    this.radius = 10,
    this.length = 1,
  }) : super(key: key);

  final int length;
  final double height, width, radius;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        length,
        (index) => Padding(
          padding: padding ?? const EdgeInsets.only(bottom: 10),
          child: SizedBox(
            height: height,
            width: width,
            child: Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.4),
              highlightColor: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(radius),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
