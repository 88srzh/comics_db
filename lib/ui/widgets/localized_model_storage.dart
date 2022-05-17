import 'package:flutter/cupertino.dart';

class LocalizedModelStorage {
  String _localeTag = '';
  String get localeTag => _localeTag;
  final VoidCallback onLocaleTagDidChange;

  LocalizedModelStorage({
    required this.onLocaleTagDidChange,
})
}