import 'package:comics_db_app/app_colors.dart';
import 'package:flutter/material.dart';

class HeadingPersonalCardWidget extends StatelessWidget {
  const HeadingPersonalCardWidget({Key? key, required this.headingText}) : super(key: key);
  final String headingText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            color: AppColors.bottomBarBackgroundColor,
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  headingText,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
