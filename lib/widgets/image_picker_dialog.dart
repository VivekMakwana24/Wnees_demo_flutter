// @dart=2.9

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wnees_demo/values/colors.dart';
import 'package:wnees_demo/values/string_constants.dart';
import 'package:wnees_demo/values/styles.dart';

class ImagePickerDialog extends StatelessWidget {
  final ImagePickerHandler _listener;
  final AnimationController _controller;
  BuildContext context;

  ImagePickerDialog(this._listener, this._controller, {Key key})
      : super(key: key);

  Animation<double> _drawerContentsOpacity;
  Animation<Offset> _drawerDetailsPosition;

  void initState() {
    _drawerContentsOpacity = CurvedAnimation(
      parent: ReverseAnimation(_controller),
      curve: Curves.fastOutSlowIn,
    );
    _drawerDetailsPosition = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ));
  }

  getImage(BuildContext context) {
    if (_controller == null ||
        _drawerDetailsPosition == null ||
        _drawerContentsOpacity == null) {
      return;
    }
    _controller.forward();
    showDialog(
      context: context,
      builder: (BuildContext context) => SlideTransition(
        position: _drawerDetailsPosition,
        child: FadeTransition(
          opacity: ReverseAnimation(_drawerContentsOpacity),
          child: this,
        ),
      ),
    );
  }

  void dispose() {
    _controller.dispose();
  }

  startTime() async {
    var _duration = const Duration(milliseconds: 200);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pop(context);
  }

  dismissDialog() {
    _controller.reverse();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Material(
        type: MaterialType.transparency,
        child: Opacity(
          opacity: 1.0,
          child: Container(
            padding: const EdgeInsets.only(
                left: 30, top: 0.0, right: 30, bottom: 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () => _listener.openCamera(),
                  child: roundedButton(
                      StringConstants.camera,
                      const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                      primaryColor,
                      whiteColor),
                ),
                GestureDetector(
                  onTap: () => _listener.openGallery(),
                  child: roundedButton(
                      StringConstants.gallery,
                      const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                      primaryColor,
                      whiteColor),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () => dismissDialog(),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 30, top: 0.0, right: 30, bottom: 20),
                    child: roundedButton(
                        StringConstants.cancel,
                        const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                        primaryColor,
                        whiteColor),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget roundedButton(
      String buttonLabel, EdgeInsets margin, Color bgColor, Color textColor) {
    var loginBtn = Container(
      width: MediaQuery.of(context).size.width,
      margin: margin,
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(const Radius.circular(100.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: primaryColor.withOpacity(0.5),
            offset: const Offset(0.5, 2.0),
            blurRadius: 0.001,
          ),
        ],
      ),
      child: Text(
        buttonLabel,
        style: textBold.copyWith(color: textColor),
      ),
    );
    return loginBtn;
  }
}

class ImagePickerHandler {
  ImagePickerDialog imagePicker;
  AnimationController _controller;
  ImagePickerListener _listener;

  ImagePickerHandler(this._listener, this._controller);

  openCamera() async {
    imagePicker.dismissDialog();
    var image = await ImagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 800, maxWidth: 600);
    _listener.userImage(image);
  }

  openGallery() async {
    imagePicker.dismissDialog();
    var image = await ImagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 800, maxWidth: 600);
    _listener.userImage(image);
  }

  void init() {
    imagePicker = ImagePickerDialog(this, _controller);
    imagePicker.initState();
  }

  showDialog(BuildContext context) {
    imagePicker.getImage(context);
  }
}

abstract class ImagePickerListener {
  userImage(File _image);
}
