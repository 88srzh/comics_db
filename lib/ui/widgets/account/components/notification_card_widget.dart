// Flutter imports:
import 'package:flutter/material.dart';

class NotificationsCardWidget extends StatefulWidget {
  const NotificationsCardWidget({super.key, required this.headingText});
  final String headingText;

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
        widget.headingText,
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}
