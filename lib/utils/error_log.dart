import 'package:flutter/foundation.dart';

void errorLog(String identifier, dynamic error) {
  if (kDebugMode) {
    print("ERROR LOG [$identifier]: $error");
  }
}
