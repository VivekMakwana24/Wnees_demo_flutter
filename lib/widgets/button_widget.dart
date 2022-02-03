
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wnees_demo/values/colors.dart';
import 'package:wnees_demo/values/styles.dart';

class AppButton extends StatelessWidget {
  String? label;
  Function()? callback;
  double? elevation;
  double? height;
  double? radius;
  double? padding;
  bool? buttonColor;

  AppButton(this.label, this.callback,
      {double elevation = 0.0,
      this.height,
      this.radius,
      this.padding,
      this.buttonColor = false}) {
    this.elevation = elevation;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60.h,
      child: MaterialButton(
        elevation: this.elevation,
        padding: padding != null
            ? EdgeInsets.only(top: padding!, bottom: padding!,right: padding!,left: padding!)
            : const EdgeInsets.only(top: 15.0, bottom: 15.0),
        onPressed: callback,
        child: Text(
          label!,
          style: textBold14White,
        ),
        color: buttonColor! ? redColor : primaryColorDark,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: buttonColor! ? redColor : primaryColorDark, width: 2.w),
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? 13),
          ),
        ),
      ),
    );
  }
}
