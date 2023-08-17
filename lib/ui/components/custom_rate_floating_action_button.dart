import 'package:flutter/material.dart';

FloatingActionButton fabRate(VoidCallback onPressed, bool rate) {
  return FloatingActionButton(
    elevation: 0.0,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(35.0))),
    backgroundColor: Colors.pinkAccent,
    onPressed: onPressed,
    child: rate ? const Icon(Icons.star_rate) : const Icon(Icons.star_rate_outlined),
  );
}
