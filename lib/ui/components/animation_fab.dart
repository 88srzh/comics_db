import 'package:flutter/material.dart';

class AnimationFab extends StatefulWidget {
  const AnimationFab({Key? key}) : super(key: key);

  @override
  State<AnimationFab> createState() => _AnimationFabState();
}

class _AnimationFabState extends State<AnimationFab> with SingleTickerProviderStateMixin {
  bool isOpened = false;
  late AnimationController _animationController;
  late Animation<Color?> _animateColor;
  late Animation<double> _animateIcon;
  final Curve _curve = Curves.easeInOut;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      });
    _animateIcon = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _animateColor = ColorTween(begin: Colors.blue, end: Colors.pinkAccent)
        .animate(CurvedAnimation(parent: _animationController, curve: Interval(0.00, 1.00, curve: _curve)));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget toggle() {
    return FloatingActionButton(
      backgroundColor: _animateColor.value,
      tooltip: 'Toggle',
      onPressed: animate,
      child: AnimatedIcon(
        icon: AnimatedIcons.menu_home,
        progress: _animateIcon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return toggle();
  }
}
