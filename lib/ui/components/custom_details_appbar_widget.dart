// Flutter imports:
import 'package:flutter/material.dart';

class CustomDetailsAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;

  const CustomDetailsAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title!,
        style: Theme.of(context).textTheme.displayLarge,
      ),
      centerTitle: true,
      iconTheme: const IconThemeData(),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
        ),
        onPressed: () => Navigator.of(context).maybePop(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
