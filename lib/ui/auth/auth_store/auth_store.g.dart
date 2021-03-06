// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStoreBase, Store {
  final _$errorMessageAtom = Atom(name: '_AuthStoreBase.errorMessage');

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$unauthorisedExceptionAtom =
      Atom(name: '_AuthStoreBase.unauthorisedException');

  @override
  UnauthorisedException? get unauthorisedException {
    _$unauthorisedExceptionAtom.reportRead();
    return super.unauthorisedException;
  }

  @override
  set unauthorisedException(UnauthorisedException? value) {
    _$unauthorisedExceptionAtom.reportWrite(value, super.unauthorisedException,
        () {
      super.unauthorisedException = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_AuthStoreBase.login');

  @override
  Future<dynamic> login(String countryCode, String mobileNumber) {
    return _$loginAsyncAction.run(() => super.login(countryCode, mobileNumber));
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
unauthorisedException: ${unauthorisedException}
    ''';
  }
}
