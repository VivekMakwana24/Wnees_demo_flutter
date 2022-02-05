import 'package:flutter/material.dart';
import 'package:wnees_demo/values/colors.dart' as colors;

import 'omi_extensions.dart';

String fontName = "Poppins";

final textLight = TextStyle(
  decoration: TextDecoration.none,
  fontFamily: fontName,
  fontWeight: FontWeight.w300,
  fontSize: 16,
  color: Colors.black,
);

TextStyle textLight12(BuildContext context) {
  return TextStyle(
    decoration: TextDecoration.none,
    fontFamily: fontName,
    fontWeight: FontWeight.w300,
    fontSize: height(context) * .016,
    color: Colors.black,
  );
}

TextStyle textMediumBlack(BuildContext context, {double number = .018}) {
  return TextStyle(
    decoration: TextDecoration.none,
    fontFamily: fontName,
    fontWeight: FontWeight.w500,
    fontSize: height(context) * number,
    color: colors.primaryTextColor,
  );
}

TextStyle textMediumSecondary(BuildContext context, {double number = .018}) {
  return TextStyle(
    decoration: TextDecoration.none,
    fontFamily: fontName,
    fontWeight: FontWeight.w500,
    fontSize: height(context) * number,
    color: colors.secondaryTextColor,
  );
}

TextStyle textMedium2(BuildContext context,
    {double number = .018, Color color = colors.primaryTextColor}) {
  return TextStyle(
    decoration: TextDecoration.none,
    fontFamily: fontName,
    fontWeight: FontWeight.w500,
    fontSize: height(context) * number,
    color: color,
  );
}

TextStyle textLightBlack(BuildContext context, {double number = .018}) {
  return TextStyle(
    decoration: TextDecoration.none,
    fontFamily: fontName,
    fontWeight: FontWeight.w300,
    fontSize: height(context) * number,
    color: colors.primaryTextColor,
  );
}

TextStyle textMediumBlue(BuildContext context) {
  return TextStyle(
    decoration: TextDecoration.none,
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: height(context) * .018,
    color: colors.pollTextBlue,
  );
}
/*final textLight12 = TextStyle(
  decoration: TextDecoration.none,
  fontFamily: fontName,
  fontWeight: FontWeight.w300,
  fontSize: height(context) * .016,
  color: Colors.black,
);*/

final textMedium = TextStyle(
  decoration: TextDecoration.none,
  fontFamily: fontName,
  fontWeight: FontWeight.w500,
  fontSize: 16,
  color: Colors.black,
);

final textMedium14 = TextStyle(
  decoration: TextDecoration.none,
  fontFamily: fontName,
  fontWeight: FontWeight.w500,
  fontSize: 14,
  color: Colors.black,
);
final textMedium14White = TextStyle(
  decoration: TextDecoration.none,
  fontFamily: fontName,
  fontWeight: FontWeight.w500,
  fontSize: 14,
  color: Colors.white,
);

final textBold = TextStyle(
  decoration: TextDecoration.none,
  fontFamily: fontName,
  fontWeight: FontWeight.w700,
  fontSize: 16,
  color: Colors.black,
);

final textBold14 = TextStyle(
  decoration: TextDecoration.none,
  fontFamily: fontName,
  fontWeight: FontWeight.w700,
  fontSize: 14,
  color: Colors.black,
);

final textRegular16 = TextStyle(
  decoration: TextDecoration.none,
  fontFamily: fontName,
  fontWeight: FontWeight.w300,
  fontSize: 16,
  color: Colors.white,
);

final textBold14White = TextStyle(
  decoration: TextDecoration.none,
  fontFamily: fontName,
  fontWeight: FontWeight.w700,
  fontSize: 14,
  color: Colors.white,
);

TextStyle textBoldBlue(BuildContext context, double number) {
  return TextStyle(
    decoration: TextDecoration.none,
    fontFamily: fontName,
    fontWeight: FontWeight.w700,
    fontSize: height(context) * number,
    color: colors.pollTextBlue,
  );
}

TextStyle textBoldBlack(BuildContext context, double number) {
  return TextStyle(
    decoration: TextDecoration.none,
    fontFamily: fontName,
    fontWeight: FontWeight.w700,
    fontSize: height(context) * number,
    color: colors.primaryTextColor,
  );
}

TextStyle textSemiBoldBlack(BuildContext context, double number) {
  return TextStyle(
    decoration: TextDecoration.none,
    fontFamily: fontName,
    fontWeight: FontWeight.w500,
    fontSize: height(context) * number,
    color: colors.primaryTextColor,
  );
}

TextStyle textRegularBlack(BuildContext context, double number,
    {Color? color}) {
  return TextStyle(
    decoration: TextDecoration.none,
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: height(context) * number,
    color: color,
  );
}

TextStyle textRegularSecondary(BuildContext context, double number) {
  return TextStyle(
    decoration: TextDecoration.none,
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: height(context) * number,
    color: colors.secondaryTextColor,
  );
}

final textBold22 = TextStyle(
  decoration: TextDecoration.none,
  fontFamily: fontName,
  fontWeight: FontWeight.w900,
  fontSize: 22,
  color: Colors.black,
);
