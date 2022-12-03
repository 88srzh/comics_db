import 'package:flutter/material.dart';

class CustomMovieListTextWidget extends StatelessWidget {
  final String text;
  final int maxLines;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;

  const CustomMovieListTextWidget({Key? key, required this.text, required this.maxLines, required this.fontSize, required this.color, required this.fontWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
