import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

final mobileValidator = MultiValidator([
  RequiredValidator(errorText: kEnterMobileNumber),
  MinLengthValidator(8, errorText: kEnterValidMobileNumber),
]);
final mobileCodeValidator = MultiValidator([
  RequiredValidator(errorText: kEnterCountryCode),
]);
final passwordValidator = MultiValidator([
  RequiredValidator(errorText: kEnterPassword),
  MinLengthValidator(6, errorText: kEnterValidPassword),
]);
final userNameValidator = MultiValidator([
  RequiredValidator(errorText: kEnterUserName),
  UsernameValidator(errorText: kRecheckUserName),
  MinLengthValidator(3, errorText: kEnterValidUserName),
]);
final firstNameValidator = MultiValidator([
  RequiredValidator(errorText: kEnterFirstName),
  MinLengthValidator(3, errorText: kEnterValidFirstName),
]);
final lastNameValidator = MultiValidator([
  RequiredValidator(errorText: kEnterLastName),
  MinLengthValidator(3, errorText: kEnterValidLastName),
]);

final emailValidator = MultiValidator([
  RequiredValidator(errorText: kEnterEmailAddress),
  EmailValidator(errorText: kEnterValidEmailAddress),
]);

final discriptionIssueValidator = MultiValidator([
  RequiredValidator(errorText: kEnterDescription),
]);

const kEmptyField = 'Please enter email address or mobile number';

const kEnterCountryCode = 'Please enter country code';

const kEnterMobileNumber = 'Please enter mobile number';
const kEnterValidMobileNumber = 'Please enter valid mobile number';

const kEnterValidEmailAddress = 'Please enter valid email address';
const kEnterEmailAddress = 'Please enter email address';

const kEnterUserName = 'Please enter user name';
const kEnterValidUserName = 'Please enter at least 3 characters for user name';
const kRecheckUserName = '\'Knowello\' should not be used in username';

const kEnterFirstName = 'Please enter first name';
const kEnterValidFirstName =
    'Please enter at least 3 characters for first name';

const kEnterLastName = 'Please enter last name';
const kEnterValidLastName = 'Please enter at least 3 characters for last name';

const kEnterPassword = 'Please enter password';
const kEnterValidPassword = 'Password should be 6 or more characters';

const kPleaseEnterOtp = 'Please enter OTP';
const kPleaseEnterValidOtp = 'Please enter valid OTP';

const kOk = "Ok";
const kCancel = "Cancel";
const kConfirm = "Confirm";
const kSave = "Save";
const kExit = "Exit";
const kLogoutMsg = "Are you sure \n\nYou want to logout?";
const kDeleteAccount = "Are you sure \n\nYou want to delete account?";
const kIgnoreProfileUpdate = "Are you sure \n\nYour changes are not saved";

const kEnterDescription = 'Please enter description';

class UsernameValidator extends TextFieldValidator {
  /// regex pattern to check if it contain knowello.
  final Pattern _emailPattern = "knowello";

  UsernameValidator({@required String? errorText}) : super(errorText!);

  @override
  bool isValid(String? value) => !RegExp(_emailPattern.toString(), caseSensitive: false)
      .hasMatch(value!.replaceAll("0", "o"));

//!hasMatch(_emailPattern, value);
}
