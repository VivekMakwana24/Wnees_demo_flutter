// @dart=2.9

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wnees_demo/values/colors.dart';
import 'package:wnees_demo/values/styles.dart';
import 'package:wnees_demo/widgets/screen_placeholder.dart';
//import 'package:flutter_bugfender/flutter_bugfender.dart';

class AppImage extends StatefulWidget {
  String url;
  String file;
  String assets;
  String initial;
  double radius;
  Color backgroundColor;
  Color borderColor;
  double boarderWidth;
  TextStyle textStyle;
  double height;
  double width;
  double roundedCorner;
  Widget placeHolder;
  BoxFit boxFit;
  bool isSVG;

  AppImage(
      {this.url,
      this.boxFit,
      this.file,
      this.height,
      this.width,
      this.assets,
      this.initial,
      this.radius = 0,
      this.placeHolder,
      this.roundedCorner,
      this.backgroundColor,
      this.borderColor = Colors.transparent,
      this.boarderWidth = 3.0,
      this.textStyle,
      this.isSVG = false});

  @override
  _AppImageState createState() => _AppImageState();
}

class _AppImageState extends State<AppImage> {
  @override
  Widget build(BuildContext context) {
    widget.textStyle ??= textMedium;
    if (widget.url != null) if (widget.url.isEmpty) widget.url = null;

    print("URL: ${widget.url}");

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
      // for rounded corner
      child: widget.url != null
          ? CachedNetworkImage(
              key: Key(Uri.parse(widget.url).pathSegments.last),
              // cacheKey: Uri.parse(widget.url).pathSegments.last,
              imageUrl: widget.url.replaceFirst("https", "http"),
              height: widget.height ?? widget.radius * 2,
              width: widget.width ?? widget.radius * 2,
              fit: widget.boxFit ?? BoxFit.cover,
              placeholder: (context, url) => placeholder,
              errorWidget: (context, url, error) {
                print("AppImage error: $url");
                print("AppImage error: $error");
                //sendError(error);
                return Container(
                  color: Colors.white,
                  height: widget.height,
                  width: widget.width,
                  child: ScreenPlaceOrder(
                    icon: "assets/images/img_splash_screen.jpg",
                    message: "",
                  ),
                );
              })
          : widget.file != null
              ? Image(
                  image: FileImage(File(widget.file)),
                  fit: BoxFit.cover,
                  height: widget.height,
                  width: widget.width,
                )
              : widget.assets != null && !widget.isSVG
                  ? Image.asset(
                      widget.assets,
                      fit: BoxFit.cover,
                      height: widget.height ?? widget.radius * 2,
                      width: widget.width ?? widget.radius * 2,
                    )
                  : SvgPicture.asset(
                      widget.assets,
                      fit: BoxFit.cover,
                      height: widget.height ?? widget.radius * 2,
                      width: widget.width ?? widget.radius * 2,
                    ),
    );
  }

/*
  return ClipRRect(
  borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
  // for rounded corner
  child: widget.url != null
  ? ExtendedImage.network(
  widget.url,
  height: widget.height ?? widget.radius * 2,
  width: widget.width ?? widget.radius * 2,
  fit: BoxFit.fill,
  cache: true,
  border: Border.all(color: Colors.red, width: 1.0),
  //shape: boxShape,
  borderRadius: BorderRadius.all(Radius.circular(30.0)),
  retries: 3,
  timeLimit: Duration(seconds: 30),

  //cancelToken: cancellationToken,
  )
      : widget.file != null
  ? Image(
  image: FileImage(File(widget.file)),
  fit: BoxFit.cover,
  height: widget.radius * 2,
  width: widget.radius * 2,
  )
      : widget.assets != null
  ? Image.asset(
  widget.assets,
  fit: BoxFit.scaleDown,
  height: widget.height ?? widget.radius * 2,
  width: widget.width ?? widget.radius * 2,
  )
      : initialPlaceholder,
  );*/

  // sendError(error) async{
  //   await FlutterBugfender.error("$error");
  // }

  get placeholder => widget.placeHolder != null
      ? widget.placeHolder
      : widget.initial != null
          ? initialPlaceholder
          : AspectRatio(
              aspectRatio: 1.5,
              child: Transform.scale(
                scale: 0.5,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.transparent,
                  valueColor: new AlwaysStoppedAnimation<Color>(toolbarColor),
                ),
              ),
            );

  get initialPlaceholder => Container(
      height: widget.radius * 2,
      width: widget.radius * 2,
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
          border: Border.all(
              width: widget.boarderWidth,
              color: widget.borderColor,
              style: BorderStyle.solid)),
      child: Center(child: Text(getText, style: widget.textStyle)));

  String get getText {
    if (widget.initial == null) {
      return "";
    } else if (widget.initial.isEmpty) {
      return "";
    } else {
      return widget.initial[0];
    }
  }
}
