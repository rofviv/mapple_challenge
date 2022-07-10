import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../shared/colors.dart';

class SplashWidget extends StatelessWidget {
  static String route = '/';

  const SplashWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset('assets/lottie/search_lottie.json', width: 300),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Mapple Challenge",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
