import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class SearchWidget extends StatelessWidget {
  static String route = '/';

  const SearchWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            HeaderSearch(),
            BodySearch(),
          ],
        ),
      ),
    );
  }
}
