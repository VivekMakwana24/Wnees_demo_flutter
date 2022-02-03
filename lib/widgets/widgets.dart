import 'package:flutter/material.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:wnees_demo/values/styles.dart';

Widget AppButtonSecondary(
    String title, Color borderColor, Color fillColor, Color textColor,
    {bool isBigButton = false}) {
  return Container(
    padding: isBigButton
        ? const EdgeInsets.symmetric(vertical: 16, horizontal: 16)
        : const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
    decoration: BoxDecoration(
        color: fillColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(8)),
    child: title
        .toUpperCase()
        .text
        .center
        .textStyle(textMedium14)
        .color(textColor)
        .make(),
  );
}
