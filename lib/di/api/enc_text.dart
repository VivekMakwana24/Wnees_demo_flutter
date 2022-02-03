import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart' hide Key;
import 'package:wnees_demo/core/locator.dart';

class EncText {
  final String aesKey = "81065541349090584049954603258839";

  late Key key; //32 chars
  late IV iv; //16 chars

  EncText() {
    // data being hashed
    var bytes = utf8.encode(aesKey);

    // Generate Key Hash using generateSHA256 Algorithm
    var hashKey = sha256.convert(bytes);

    debugPrint("Digest as bytes: ${hashKey.bytes}");
    debugPrint("Digest as hex string: $hashKey");

    // copy first 32 bits of hash key to key
    key = Key.fromUtf8("$hashKey".substring(0, 32));

    // copy first 16 bits of plain key to iv
    iv = IV.fromUtf8("$aesKey".substring(0, 16));

    //testEnc();
  }

  testEnc() {
    Uint8List keyToBytes = Uint8List.fromList(this.key.bytes);
    String keyInString = String.fromCharCodes(keyToBytes);
    Uint8List ivToBytes = Uint8List.fromList(this.iv.bytes);
    String ivToString = String.fromCharCodes(ivToBytes);
    debugPrint("key in string $keyInString");
    debugPrint("iv in string $ivToString");

    debugPrint("key ${this.key.bytes}");
    debugPrint("iv ${this.iv.bytes}");
    var en = encrypt("text");
    var dn = decrypt(en);

    debugPrint("Encrypted text= $en  Decrypted text=$dn");
  }

  /// encrypt API parameters
  /// [text] takes api parameters
  String encrypt(String text) {
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(text, iv: iv);

    debugPrint('text : $text');
    debugPrint('encrypted : ${encrypted.base64}');
    return encrypted.base64;
  }

  /// decrypt response
  /// [text] takes
  String decrypt(String text) {
    text = text.replaceAll("\"", "");
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final decrypted = encrypter.decrypt(Encrypted.fromBase64(text), iv: iv);
    return decrypted;
  }
}

final enc = locator<EncText>();
