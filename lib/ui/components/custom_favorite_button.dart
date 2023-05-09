// Flutter imports:
import 'package:flutter/material.dart';

class CustomFavoriteButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomFavoriteButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          side: const BorderSide(
            width: 2.0,
            color: Colors.grey,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
