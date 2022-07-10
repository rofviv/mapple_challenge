import 'package:flutter/material.dart';

import 'widgets/body_history.dart';
import 'widgets/header_history.dart';

class HistoryWidget extends StatelessWidget {
  static String route = '/';

  const HistoryWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            HeaderHistory(),
            BodyHistory(),
          ],
        ),
      ),
    );
  }
}
