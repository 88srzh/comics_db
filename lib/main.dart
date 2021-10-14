// @dart=2.9
import 'package:comics_db_app/library/widgets/inherited/provider.dart';
import 'package:comics_db_app/ui/widgets/app/my_app.dart';
import 'package:comics_db_app/ui/widgets/app/my_app_model.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final model = MyAppModel();
  await model.checkAuth();
  final app = MyApp(model: model);
  final widget = Provider(model: model,child: app);
  runApp(widget);
}
