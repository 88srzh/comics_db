// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:comics_db_app/resources/resources.dart';

class SplashScreenBodyWidget extends StatelessWidget {
  const SplashScreenBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(AppImages.splashScreen),
              fit: BoxFit.cover,
            )),
          ),
          Container(
            // color: Colors.black,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.splashScreenBackground),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: ClipRRect(
              child: Image.asset(AppImages.splashScreenLogo),
            ),
          ),
        ],
      ),
    );
  }
}
