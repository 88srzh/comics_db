// Flutter imports:
import 'package:flutter/material.dart';
import 'package:comics_db_app/generated/l10n.dart';

class NotificationsCardWidget extends StatefulWidget {
  const NotificationsCardWidget({super.key});

  @override
  State<NotificationsCardWidget> createState() => _NotificationsCardWidgetState();
}

class _NotificationsCardWidgetState extends State<NotificationsCardWidget> {
  bool notifications = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: notifications,
      onChanged: (bool value) {
        setState(
              () {
            notifications = value;
          },
        );
      },
      title: Text(
        S.of(context).notifications,
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}
