import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:comics_db_app/ui/components/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingWidget extends StatefulWidget {
  const TrendingWidget({Key? key}) : super(key: key);

  @override
  State<TrendingWidget> createState() => _TrendingWidgetState();
}

class _TrendingWidgetState extends State<TrendingWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Trending'),
      body: ColoredBox(
        color: context.read<ThemeBloc>().isDarkTheme ? DarkThemeColors.genresText : Colors.white,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 3,
            mainAxisSpacing: 5,
            crossAxisCount: 3,
            childAspectRatio: 1 / 1.65,
          ),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {},
              child: Stack(
                children: [
                  Container(
                    // TODO create separate custom widget, also used in people widget
                    decoration: BoxDecoration(
                      color: context.read<ThemeBloc>().isDarkTheme ? DarkThemeColors.kPrimaryColor : Colors.white,
                      border: Border.all(
                        color: context.read<ThemeBloc>().isDarkTheme
                            ? Colors.white.withOpacity(0.2)
                            : Colors.black.withOpacity(0.2),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                      boxShadow: [
                        BoxShadow(
                          color: context.read<ThemeBloc>().isDarkTheme
                              ? Colors.white.withOpacity(0.1)
                              : Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Column(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
