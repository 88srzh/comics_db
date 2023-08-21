import 'package:flutter/material.dart';

FloatingActionButton fabWatchlist(VoidCallback onPressed, bool rate) {
  return FloatingActionButton(
    heroTag: 'watchlist',
    elevation: 0.0,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(35.0))),
    backgroundColor: Colors.pinkAccent,
    onPressed: onPressed,
    child: rate ? const Icon(Icons.bookmark) : const Icon(Icons.bookmark_outline),
  );
}
