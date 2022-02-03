// @dart=2.9

// Widget

import 'package:flutter/material.dart';
import 'package:wnees_demo/widgets/scroll_behavior.dart';

extension WidgetX on Widget {
  Widget wrapContainer({
    EdgeInsets padding,
    EdgeInsets margin,
    Color color = Colors.transparent,
  }) {
    return Container(
      padding: padding,
      margin: margin,
      color: color,
      child: this,
    );
  }

  Widget wrapPadding({EdgeInsets padding = const EdgeInsets.all(0)}) {
    return Padding(
      padding: padding,
      child: this,
    );
  }

  Widget addGestureTap(Function onTap) {
    return GestureDetector(
      child: this,
      onTap: onTap(),
    );
  }

  Widget removeScrollEffect() {
    return ScrollConfiguration(behavior: MyBehavior(), child: this);
  }

  Widget wrapPaddingAll(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }

  Widget wrapPaddingHorizontal(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: this,
    );
  }

  Widget wrapPaddingVertical(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: this,
    );
  }

  Widget clipRectAll(double radius) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: this,
    );
  }

  Widget clipRect(BorderRadius radius) {
    return ClipRRect(
      borderRadius: radius,
      child: this,
    );
  }

  addMarginBottom(double margin) {
    return Column(children: [
      this,
      SizedBox(
        height: margin,
      )
    ]);
  }

  addMarginTop(double margin) {
    return Column(children: [
      SizedBox(
        height: margin,
      ),
    ]);
  }

  addMargin(double margin) {
    return Row(
      children: [
        SizedBox(
          height: margin,
        ),
        Column(children: [
          SizedBox(
            height: margin,
          ),
          this,
          SizedBox(
            height: margin,
          )
        ]),
        SizedBox(
          height: margin,
        ),
      ],
    );
  }

  addMarginRight(double margin) {
    return Padding(
      padding: margin.paddingRight(),
      child: this,
    );
  }

  addMarginLeft(double margin) {
    return Padding(
      padding: margin.paddingLeft(),
      child: this,
    );
  }

  addMarginVertial(double margin) {
    return Padding(
      padding: margin.paddingVertical(),
      child: this,
    );
  }

  addMarginHorizontal(double margin) {
    return Container(
      padding: margin.paddingHorizontal(),
      child: this,
    );
  }

  Widget expand(int flex) {
    return Expanded(
      flex: flex,
      child: this,
    );
  }

  Widget flexible(int flex, FlexFit flexFit) {
    return Flexible(
      flex: flex,
      fit: flexFit,
      child: this,
    );
  }

  Widget visiblity(bool visible) {
    return Visibility(
      visible: visible,
      child: this,
    );
  }

  Widget offstage(bool visible) {
    return Offstage(
      offstage: visible,
      child: this,
    );
  }

  ///Hides a widget
  Widget setVisibility(
      {Key key, bool isVisible = false, bool maintainSize = false}) =>
      Visibility(
        key: key,
        child: this,
        visible: isVisible,
        maintainSize: maintainSize,
        maintainAnimation: maintainSize,
        maintainState: maintainSize,
      );

  Widget hide({Key key, bool maintainSize = false}) =>
      Visibility(
        key: key,
        child: this,
        visible: false,
        maintainSize: maintainSize,
        maintainAnimation: maintainSize,
        maintainState: maintainSize,
      );

  Widget show({Key key, bool maintainSize = false}) =>
      Visibility(
        key: key,
        child: this,
        visible: true,
      );

  /// Widget to show exception
  Widget errorWidget(Object ex) => ErrorWidget(ex);
}

extension TextX on Text {}

extension NumX on double {
  // margin EdgeInsets
  EdgeInsets marginLeft() => EdgeInsets.only(left: this);

  EdgeInsets marginRight() => EdgeInsets.only(right: this);

  EdgeInsets marginTop() => EdgeInsets.only(top: this);

  EdgeInsets marginBottom() => EdgeInsets.only(bottom: this);

  EdgeInsets marginAll() => EdgeInsets.all(this);

  EdgeInsets marginVertical() => EdgeInsets.symmetric(vertical: this);

  EdgeInsets marginHorizontal() => EdgeInsets.symmetric(horizontal: this);

  // margin EdgeInsets
  EdgeInsets paddingLeft() => EdgeInsets.only(left: this);

  EdgeInsets paddingRight() => EdgeInsets.only(right: this);

  EdgeInsets paddingTop() => EdgeInsets.only(top: this);

  EdgeInsets paddingBottom() => EdgeInsets.only(bottom: this);

  EdgeInsets paddingAll() => EdgeInsets.all(this);

  EdgeInsets paddingVertical() => EdgeInsets.symmetric(vertical: this);

  EdgeInsets paddingHorizontal() => EdgeInsets.symmetric(horizontal: this);

  // Border
  BorderRadius circulrBorder() => BorderRadius.circular(this);

  Widget dividerH({color: const Color(0xFFc9c9c9)}) {
    return Container(
      height: this.toDouble(),
      color: color,
      width: double.infinity,
    );
  }

  Widget dividerV({color: Colors.grey}) {
    return Container(
      height: this.toDouble(),
      color: color,
      width: double.infinity,
    );
  }

  Widget divider({
    color: Colors.grey,
    width: double.infinity,
    height: double.infinity,
  }) {
    return Container(
      color: color,
      width: width,
      height: height,
    );
  }

  Widget get VBox {
    return SizedBox(
      height: this.toDouble(),
    );
  }

  Widget get HBox {
    return SizedBox(
      width: this,
    );
  }
}

extension IntX on int {
  /// Returns an iterable from `0` up to but not including [this].
  /// Example:
  /// ```dart
  /// 5.range; // (0, 1, 2, 3, 4)
  /// ```
  Iterable<int> get range => Iterable<int>.generate(this);

  /// Returns an iterable from [this] inclusive to [end] exclusive.
  ///
  /// Example:
  /// ```dart
  /// 3.to(6); // (3, 4, 5)
  /// 2.to(-2); // (2, 1, 0, -1)
  /// ```
  ///
  /// If [by] is provided, it will be used as step size for iteration. [by] is
  /// always positive, even if the direction of iteration is decreasing.
  ///
  /// Example:
  /// ```dart
  /// 8.to(3, by: 2); // (8, 6, 4)
  /// ```
  Iterable<int> to(int end, {int by = 1}) {
    if (by < 1) {
      throw ArgumentError(
          'Invalid step size: $by. Step size must be greater than 0');
    }
    final count = ((end - this).abs() / by).ceil();
    // Explicit type declaration for function argument.
    final int Function(int) generator = this >= end
        ? (index) => this - (by * index)
        : (index) => this + (by * index);
    return Iterable<int>.generate(count, generator);
  }

  /// Returns [Duration] of [this] in days.
  Duration get days => Duration(days: this);

  /// Returns [Duration] of [this] in hours.
  Duration get hours => Duration(hours: this);

  /// Returns [Duration] of [this] in minutes.
  Duration get minutes => Duration(minutes: this);

  /// Returns [Duration] of [this] in seconds.
  Duration get seconds => Duration(seconds: this);

  /// Returns [Duration] of [this] in milliseconds.
  Duration get milliseconds => Duration(milliseconds: this);

  /// Returns [Duration] of [this] in microseconds.
  Duration get microseconds => Duration(microseconds: this);
}

// String
extension StringX on String {
  ///Returns first letter of the string as Caps eg -> Flutter
  String firstLetterUpperCase() =>
      length > 1
          ? "${this[0].toUpperCase()}${substring(1).toLowerCase()}"
          : this;

  /// Return a bool if the string is null or empty
  bool get isEmptyOrNull => this == null || isEmpty;

  /// Returns the string if it is not `null`, or the empty string otherwise
  String get orEmpty => this ?? "";

  // if the string is empty perform an action
  String ifEmpty(Function action) => isEmpty ? action() : this;

  bool validateEmail() =>
      RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(this);

  String toPascalCase() {
    if (this != null) {
      if (this.length > 0) {
        return this.substring(0, 1).toUpperCase() + this.substring(1);
      } else {
        return this;
      }
    } else {
      return null;
    }
  }

  Text withStyle({TextStyle style,
    int maxline = 1,
    TextOverflow overflow = TextOverflow.clip}) {
    return Text(
      this,
      style: style,
      maxLines: maxline,
      overflow: overflow,
    );
  }

  withNormalFont(BuildContext context,
      {Color color = Colors.black, int maxline}) {
    return Text(
      this,
      style: Theme
          .of(context)
          .textTheme
          .headline6
          .copyWith(color: color),
    );
  }

  /*text(BuildContext context, {
    Color color = Colors.black,
    int maxline,
    TextStyle textStyle,
  }) {
    return Text(
      this,
      style: textStyle??
          Theme
              .of(context)
              .textTheme
              .headline6
              .copyWith(color: color),
    );
  }*/

  subText(BuildContext context, {Color color = Colors.black54, int maxline}) {
    return Text(
      this,
      style: Theme
          .of(context)
          .textTheme
          .subtitle2
          .copyWith(color: color),
    );
  }

  withSmallFont(BuildContext context,
      {Color color = Colors.black54, int maxline}) {
    return Text(
      this,
      style: Theme
          .of(context)
          .textTheme
          .subtitle2
          .copyWith(color: color),
    );
  }

/*String toUTFValue(int hex) {
    List<int> chars = List(this.length);
    for (int i = 0; i < this.length; i++) {
      if (this.codeUnitAt(i) >= 0x0030 && this.codeUnitAt(i) <= 0x0039) {
        chars[i] = hex + (this.codeUnitAt(i) - '0'.codeUnitAt(0));
      } else {
        chars[i] = this.codeUnitAt(i);
      }
    }
    return String.fromCharCodes(chars);
  }*/
}

extension ContextX on BuildContext {
  double get height =>
      MediaQuery
          .of(this)
          .size
          .height;

  double get width =>
      MediaQuery
          .of(this)
          .size
          .width;

  Orientation get orientation =>
      MediaQuery
          .of(this)
          .orientation;

  bool get isPortrait =>
      MediaQuery
          .of(this)
          .orientation == Orientation.portrait;

  bool get isLandscape =>
      MediaQuery
          .of(this)
          .orientation == Orientation.landscape;
}

Container wrapCard(List<Widget> widgets,
    {Orientation orientation = Orientation.portrait,
      color,
      shadowColor,
      elevation,
      shape,
      borderOnForeground = true,
      margin,
      clipBehavior,
      double height,
      double padding = 4}) {
  if (orientation == Orientation.portrait) {
    return Container(
      height: height,
      child: Card(
        color: color,
        // shadowColor: shadowColor,
        elevation: elevation,
        shape: shape,
        borderOnForeground: borderOnForeground,
        margin: margin,
        clipBehavior: clipBehavior,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widgets,
        ).wrapPaddingAll(4),
      ),
    );
  } else {
    return Container(
      height: height,
      child: Card(
        child: Row(
          children: widgets,
        ).wrapPaddingAll(4),
      ),
    );
  }
}

Size displaySize(BuildContext context) {
  return MediaQuery
      .of(context)
      .size;
}

double height(BuildContext context) {
  return displaySize(context).height;
}

double width(BuildContext context) {
  return displaySize(context).width;
}