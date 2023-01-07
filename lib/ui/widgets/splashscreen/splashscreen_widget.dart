// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:comics_db_app/ui/widgets/splashscreen/components/splashscreen_body_widget.dart';

class SplashscreenWidget extends StatelessWidget {
  const SplashscreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashScreenBodyWidget(),
    );
  }
}
