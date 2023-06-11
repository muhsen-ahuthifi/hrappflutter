
import 'dart:convert';

import 'package:flutter/foundation.dart';

const NgJson ngJson = NgJson();

class NgJson{
  const  NgJson();
dynamic _parseAndDecode(String response) {
  return jsonDecode(response) ;//as Map<String, dynamic>;
}
String _parseAndEncode(Object? object) {
  return jsonEncode(object);
}

Future<dynamic> parseAsync(String text) {
  return compute(_parseAndDecode, text);
}
Future<String> encodeAsync(Object? object) {
  return compute(_parseAndEncode, object);
  
}

dynamic parse(String text) {
  return _parseAndDecode(text);
}
String encode(Object? object) {
  return _parseAndEncode(object);
  
}
}
