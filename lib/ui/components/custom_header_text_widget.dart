// Flutter imports:
import 'package:flutter/material.dart';

class CustomHeaderTextWidget extends StatelessWidget {
  final String text;

  const CustomHeaderTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
