import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

GlobalKey get _appUtilKey => GlobalKey<State>();

enum MessageType { INFO, ERROR, WARNING }

late ToastFuture? _toastFuture;

showMessage(String message,
    {MessageType type = MessageType.INFO, BuildContext? context}) {
  print("ShowMessage: $message");

  try {
    /*_flushBar = Flushbar(
      messageText: Text(
        message,
        style: textBold.copyWith(color: whiteColor),
      ),
      animationDuration: Duration.zero,
      backgroundColor: primaryColor,
      duration: Duration(seconds: 3),
      boxShadows: const [
        BoxShadow(
          color: Colors.black,
          offset: Offset(0.0, 2.0),
          blurRadius: 3.0,
        )
      ],
    )..show(NavigationService.navigatorKey.currentContext);*/
   /* if(_toastFuture!=null) {
      _toastFuture?.dismiss(showAnim: true);
    }*/
    _toastFuture = showToastWidget(
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          color: type == MessageType.INFO ? Colors.black87 : Colors.red,
        ),
        child: Row(
          children: [
            Text(
              '$message',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      ),
      context: context,
      position: StyledToastPosition.top,
      isIgnoring: false,
      alignment: Alignment.topCenter,
      duration: Duration(seconds: 2),
    );
  } catch (onError) {
    print(onError);
  }
}
