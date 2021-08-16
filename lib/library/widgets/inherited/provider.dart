import 'package:flutter/material.dart';

class Provider<Model> extends InheritedWidget {
  final Model model;

  const Provider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
    key: key,
    child: child,
  );

  static Model? watch<Model extends ChangeNotifier>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider<Model>>()?.model;
  }

  static Model? read<Model extends ChangeNotifier>(BuildContext context) {
    final widget =
        context.getElementForInheritedWidgetOfExactType<Provider<Model>>()?.widget;
    return widget is Provider<Model> ? widget.model : null;
  }

  @override
  bool updateShouldNotify(Provider oldWidget) {
    return model != oldWidget.model;
  }
}