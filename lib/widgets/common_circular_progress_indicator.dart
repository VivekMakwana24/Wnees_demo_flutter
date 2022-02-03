import 'package:flutter/material.dart';
import 'package:wnees_demo/values/colors.dart' as colors;

class CommonCircularProgressIndicator extends StatelessWidget {
  const CommonCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Align(
          alignment: Alignment.center,
          child: CircularProgressIndicator(
            color: colors.accentColor,
          )),
    );
  }
}
