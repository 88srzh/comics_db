// Flutter imports:
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
              child: SizedBox(
                width: 200.0,
                height: 200.0,
                child: OutlinedButton(
                  onPressed: () => Navigator.pushNamed(context, MainNavigationRouteNames.favoriteMovies),
                  child: const Text('Movies'),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 200.0,
                child: OutlinedButton(
                  onPressed: () => Navigator.pushNamed(context, MainNavigationRouteNames.favoriteTvs),
                  child: const Text('TV'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
