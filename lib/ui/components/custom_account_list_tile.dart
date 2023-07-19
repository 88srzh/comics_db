// Flutter imports:
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAccountListTile extends StatelessWidget {
  const CustomAccountListTile({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: Theme.of(context).textTheme.displayMedium,
      ),
      leading: const Icon(MdiIcons.movie),
      onTap: onTap,
    );
  }
}
