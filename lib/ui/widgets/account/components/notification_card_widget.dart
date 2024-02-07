import 'package:flutter/material.dart';

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
      activeColor: Colors.pinkAccent,
      inactiveThumbColor: Colors.grey,
      value: notifications,
      onChanged: (bool value) {
        setState(
              () {
            notifications = value;
          },
        );
      },
      title: Text(
        'Push notifications',
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}
