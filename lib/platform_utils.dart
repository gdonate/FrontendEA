import 'package:flutter/foundation.dart' show kIsWeb;

const String MOBILE_URI = 'http://10.0.2.2:8080/api';
const String WEB_URI = 'http://localhost:8080/api';

String getUri() {
  if (kIsWeb) return WEB_URI;
  return MOBILE_URI;
}
