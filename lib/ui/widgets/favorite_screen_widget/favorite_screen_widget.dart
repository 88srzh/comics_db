import 'package:comics_db_app/ui/components/custom_appbar_widget.dart';
import 'package:flutter/material.dart';

class FavoriteScreenWidget extends StatefulWidget {
  const FavoriteScreenWidget({Key? key}) : super(key: key);

  @override
  State<FavoriteScreenWidget> createState() => _FavoriteScreenWidgetState();
}

class _FavoriteScreenWidgetState extends State<FavoriteScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Favorites'),
    );
  }
}
