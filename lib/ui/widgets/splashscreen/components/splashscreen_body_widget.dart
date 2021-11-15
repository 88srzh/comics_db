import 'package:comics_db_app/resources/resources.dart';
import 'package:flutter/material.dart';

class SplashScreenBodyWidget extends StatelessWidget {
  const SplashScreenBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppImages.noImage),
                fit: BoxFit.cover,
                )
              ),
            ),
        ],
      ),
    );
  }
}
