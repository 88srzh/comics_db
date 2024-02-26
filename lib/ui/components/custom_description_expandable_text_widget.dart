// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:expandable_text/expandable_text.dart';

class CustomDescriptionExpandableText extends StatelessWidget {
  final String description;
  final int maxLines;
  final String expandedText;

  const CustomDescriptionExpandableText({super.key, required this.description, required this.maxLines, required this.expandedText});

  @override
  Widget build(BuildContext context) {
    return ExpandableText(
      description,
      expandText: expandedText,
      maxLines: maxLines,
      linkColor: Colors.deepOrangeAccent,
      animation: true,
      expandOnTextTap: true,
      prefixText: ' ',
      linkEllipsis: false,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
