import 'package:flutter/material.dart';

FloatingActionButton fabFavorite(VoidCallback onPressed, bool favorite) {
  return FloatingActionButton(
    elevation: 0.0,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(35.0))),
    backgroundColor: Colors.pinkAccent,
    onPressed: onPressed,
    child: favorite ? const Icon(Icons.favorite) : const Icon(Icons.favorite_outline),
  );
}
