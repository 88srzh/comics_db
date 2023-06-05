import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/ui/components/custom_appbar_widget.dart';
import 'package:comics_db_app/ui/widgets/favorite_screen/movie/favorite_movie_list_cubit.dart';
import 'package:comics_db_app/ui/widgets/favorite_screen/movie/favorite_movie_list_widget.dart';
import 'package:comics_db_app/ui/widgets/favorite_screen/tv/favorite_tv_list_widget.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreenWidget extends StatefulWidget {
  const FavoriteScreenWidget({Key? key}) : super(key: key);

  @override
  State<FavoriteScreenWidget> createState() => _FavoriteScreenWidgetState();
}

class _FavoriteScreenWidgetState extends State<FavoriteScreenWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final locale = Localizations.localeOf(context);
    context.read<FavoriteMovieListCubit>().setupFavoriteMovieLocale(locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Favorites'),
      body: Stack(
        children: const [
          FavoriteMovieListWidget(),
          FavoritesAnimatedButtonBarWidget(),
        ],
      ),
    );
  }
}

class FavoritesAnimatedButtonBarWidget extends StatelessWidget {
  const FavoritesAnimatedButtonBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 50.0,
          width: 200.0,
          child: AnimatedButtonBar(
            radius: 8.0,
            backgroundColor: Colors.white,
            foregroundColor: DarkThemeColors.kPrimaryColor.withOpacity(0.2),
            elevation: 10,
            borderColor: Colors.white,
            borderWidth: 2.0,
            animationDuration: const Duration(milliseconds: 400),
            children: [
              ButtonBarEntry(
                child: const Text(
                  'Movies',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {},
              ),
              ButtonBarEntry(
                child: const Text(
                  'TV',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}
