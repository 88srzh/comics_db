// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:comics_db_app/ui/components/hhtp_overrides.dart';
import 'package:comics_db_app/ui/widgets/app/my_app.dart';

//


void main() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  const app = MyApp();
  // HttpOverrides.global = MyHttpOverrides();
  runApp(app);
}
