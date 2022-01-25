import 'package:comics_db_app/ui/components/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LoadingIndicatorWidget(),
      ),
    );
  }

  static Widget create() {
    return Provider(
      create: (context),
      child: const LoaderWidget());
  }
}
