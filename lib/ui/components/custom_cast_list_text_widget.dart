// Flutter imports:
import 'package:flutter/material.dart';

class CustomCastListTextWidget extends StatelessWidget {
  final String? text;
  final int maxLines;

  const CustomCastListTextWidget(
      {Key? key, required this.text, required this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
