import 'dart:async';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class Validator {
  BuildContext context;

  Validator(this.context);


  validateEmptyField(String message) {
    return StreamTransformer<String, String>.fromHandlers(
        handleData: (value, sink) {
      if ((value?.trim() ?? "").isEmpty) {
        sink.addError(message);
      } else {
        sink.add(value);
      }
    });
  }

  validateEmptyFieldWithLength(
      int length, String emptyMessage, String lengthMessage) {
    return StreamTransformer<String, String>.fromHandlers(
        handleData: (value, sink) {
      if (value.trim().isEmpty) {
        sink.addError(emptyMessage);
      } else if (value.trim().length < length) {
        sink.addError(lengthMessage);
      } else {
        sink.add(value);
      }
    });
  }

  // final validateFirstName = StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
  //   if (value.trim().isEmpty) {
  //     sink.addError(languages.enterFirstName);
  //   } else {
  //     sink.add(value);
  //   }
  // });
  //
  // final validateLastName = StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
  //   if (value.trim().isEmpty) {
  //     sink.addError(languages.enterLastName);
  //   } else {
  //     sink.add(value);
  //   }
  // });
  //
  // final validatePassword = StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
  //   if (value.trim().isEmpty) {
  //     sink.addError(languages.enterPass);
  //   } else if (value.trim().length < 6) {
  //     sink.addError(languages.passShortMsg);
  //   } else {
  //     sink.add(value);
  //   }
  // });
  //
  // //
  // final validateMobileNumber = StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
  //   if (value.trim().isEmpty) {
  //     sink.addError(languages.enterMobileNumber);
  //   } else {
  //     sink.add(value);
  //   }
  // });
  //
  // final validateOldPassword = StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
  //   print(value);
  //   if ((value?.trim() ?? "").isEmpty) {
  //     sink.addError(languages.enterOldPass);
  //   } else if ((value?.trim() ?? "").length < 6) {
  //     sink.addError(languages.passShortMsg);
  //   } else {
  //     sink.add(value);
  //   }
  // });
  //
  // final validateNewPassword = StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
  //   if (value.trim().isEmpty) {
  //     sink.addError(languages.enterNewPass);
  //   } else if (value.trim().length < 6) {
  //     sink.addError(languages.passShortMsg);
  //   } else {
  //     sink.add(value);
  //   }
  // });

  validateWithFixLength(int length, String emptyMsg, String invalidMsg) {
    return StreamTransformer<String, String>.fromHandlers(
        handleData: (value, sink) {
      if (value.trim().isEmpty) {
        sink.addError(emptyMsg);
      } else if (value.trim().length != length) {
        sink.addError(invalidMsg);
      } else {
        sink.add(value);
      }
    });
  }

  validateEmail(String emptyMsg, String invalidMsg) {
    return StreamTransformer<String, String>.fromHandlers(
        handleData: (value, sink) {
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      if (value.trim().isEmpty) {
        sink.addError(emptyMsg);
      } else if (!RegExp(pattern.toString()).hasMatch(value)) {
        sink.addError(invalidMsg);
      } else {
        sink.add(value);
      }
    });
  }

  validateCourierGoods(double goodsItem, String emptyMsg, String invalidMsg) {
    return StreamTransformer<String, String>.fromHandlers(
        handleData: (value, sink) {
      if (value.trim().isEmpty) {
        sink.addError(emptyMsg);
      } else if (value.trim().isNotEmpty &&
          double.parse(value.trim()) > goodsItem) {
        sink.addError(invalidMsg);
      } else {
        sink.add(value);
      }
    });
  }
}
