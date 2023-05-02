import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';

class CustomFavoriteButton extends StatelessWidget {
  final Function onPressed;
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
        onPressed: () => Navigator.pushNamed(context, MainNavigationRouteNames.favoriteTvs),
        child: Text(
          text,
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
