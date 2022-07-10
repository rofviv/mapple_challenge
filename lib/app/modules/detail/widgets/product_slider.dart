import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class _ActiveDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 20,
        height: 5,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

class _InactiveDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 8,
        height: 5,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

class ProductSlider extends StatefulWidget {
  final List<String> items;

  const ProductSlider({Key? key, required this.items}) : super(key: key);

  @override
  ProductSliderState createState() => ProductSliderState();
}

class ProductSliderState extends State<ProductSlider> {
  int activeIndex = 0;
  setActiveDot(index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 30, bottom: 10),
          color: Colors.white,
          height: 350,
          width: MediaQuery.of(context).size.width,
          child: CarouselSlider(
            options: CarouselOptions(
              onPageChanged: (index, _) {
                setActiveDot(index);
              },
              autoPlayCurve: Curves.fastLinearToSlowEaseIn,
              autoPlayAnimationDuration: const Duration(seconds: 2),
              viewportFraction: 1.0,
            ),
            items: widget.items.map(
              (item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Stack(
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: item,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ).toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.items.length,
              (idx) {
                return activeIndex == idx ? _ActiveDot() : _InactiveDot();
              },
            ),
          ),
        ),
      ],
    );
  }
}
