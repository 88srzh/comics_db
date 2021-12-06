// @dart=2.9
import 'package:comics_db_app/library/widgets/inherited/notifier_provider.dart';
import 'package:comics_db_app/ui/widgets/app/my_app.dart';
import 'package:comics_db_app/ui/widgets/app/my_app_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final model = MyAppModel();
  await model.checkAuth();
  const app = MyApp();
  final widget = ProviderCustom(model: model,child: app);
  runApp(widget);
}
