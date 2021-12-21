import 'package:flutter/foundation.dart' show kIsWeb;

const String MOBILE_URI = 'http:/147.83.7.156:4545/api';
const String WEB_URI = 'http:/147.83.7.156:4545/api';

const String DEV_URI = 'http://localhost:8080/api';

String getUri() {
  if (kIsWeb) return DEV_URI;
  return DEV_URI;
}
