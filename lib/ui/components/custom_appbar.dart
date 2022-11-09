import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container());
  }
}
