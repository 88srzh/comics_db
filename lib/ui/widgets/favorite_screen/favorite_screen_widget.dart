// Flutter imports:
import 'package:comics_db_app/ui/components/custom_favorite_button.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:comics_db_app/ui/navigation/main_navigation.dart';

class FavoriteScreenWidget extends StatelessWidget {
  const FavoriteScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: CustomFavoriteButton(
                onPressed: () => Navigator.pushNamed(context, MainNavigationRouteNames.favoriteMovies),
                text: 'Movies',
              ),
            ),
            Expanded(
              child: CustomFavoriteButton(
                onPressed: () => Navigator.pushNamed(context, MainNavigationRouteNames.favoriteTvs),
                text: 'TV shows',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
