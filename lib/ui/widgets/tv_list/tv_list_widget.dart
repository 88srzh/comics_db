// Flutter imports:
import 'package:comics_db_app/ui/components/custom_header_text_widget.dart';
import 'package:comics_db_app/ui/widgets/settings/model_theme.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/components/custom_main_appbar_widget.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/tv_airing_today/tv_airing_today_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_on_the_air/tv_on_the_air_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_popular/tv_popular_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_top_rated/tv_top_rated_widget.dart';
import 'package:provider/provider.dart';

class TvListWidget extends StatefulWidget {
  const TvListWidget({Key? key}) : super(key: key);

  @override
  State<TvListWidget> createState() => _TvListWidgetState();
}

class _TvListWidgetState extends State<TvListWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
      builder: (context, ModelTheme notifierTheme, child) {
        return Scaffold(
          appBar: const CustomMainAppBarWidget(),
          body: ColoredBox(
            color: notifierTheme.isDark ? AppColors.kPrimaryColor : Colors.white70,
            child: ListView(
              children: [
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0, left: 20.0, bottom: 20.0),
                      child: SizedBox(
                        height: 180,
                        child: TopRatedTvWidget(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomHeaderTextWidget(text: 'Popular'),
                          InkWell(
                            onTap: () => Navigator.of(context).pushNamed(MainNavigationRouteNames.tvPopularList),
                            child: Text(
                              'See All',
                              style: TextStyle(
                                color: notifierTheme.isDark ? AppColors.ratingText : AppColors.kPrimaryColor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 200,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: PopularTvWidget(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomHeaderTextWidget(text: 'Airing Today'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 200,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: AiringTodayTvsWidget(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomHeaderTextWidget(text: 'On The Air'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 200,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: OnTheAirTvsWidget(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
