// Flutter imports:
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//

// Project imports:
import 'package:comics_db_app/ui/widgets/app/my_app.dart';

void main() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  const app = MyApp();
  runApp(app);
}
