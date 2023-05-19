import 'dart:developer';

import 'package:flutter/foundation.dart';

class LogPrint {
  static void print(String message) {
    if (kDebugMode) {
      log(message);
    }
  }
}