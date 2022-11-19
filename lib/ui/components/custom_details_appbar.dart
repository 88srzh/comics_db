import 'package:flutter/material.dart';

class CustomDetailsAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const CustomDetailsAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 22),
      ),
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.white),
      leading: IconButton(
          color: Theme.of(context).colorScheme.onBackground,
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).maybePop()),
      );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
