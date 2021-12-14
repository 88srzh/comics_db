import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/widgets/tv_popular/tv_popular_model.dart';
import 'package:comics_db_app/ui/widgets/tv_popular/tv_popular_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_top_rated/tv_top_rated_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TvWidget extends StatelessWidget {
  const TvWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => TvPopularModel(), child: const TvListWidget());
}

class TvListWidget extends StatefulWidget {
  const TvListWidget({Key? key}) : super(key: key);

  @override
  _TvListWidgetState createState() => _TvListWidgetState();
}

class _TvListWidgetState extends State<TvListWidget> {
  @override
  Widget build(BuildContext context) {
    // final topRatedTvModel = context.watch<TopRatedTvModel>();
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(AppImages.movieAppBarLogo),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.search, color: AppColors.searchIcon, size: 30,),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: const Icon(Icons.filter_alt_outlined, color: AppColors.ratingThumb, size: 30,),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.menu, color: AppColors.ratingThumb, size: 30,),
                  ),
                ],
              )
            ],
          ),
          ),
        backgroundColor: AppColors.kPrimaryColor,
        ),
      body: ColoredBox(
        color: AppColors.kPrimaryColor,
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
                      const Text('Популярные', style: TextStyle(color: AppColors.genresText,
                      fontSize: 21, fontWeight: FontWeight.w600),
                      ),
                      InkWell(
                        // TODO: Исправить переход на страницу
                        onTap: () => Navigator.of(context).pushNamed('popularTv'),
                        child: const Text('Все', style: TextStyle(
                          color: AppColors.ratingText, fontSize: 15,
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
                      Text('Скоро', style: TextStyle(
                        color: AppColors.genresText, fontSize: 21, fontWeight: FontWeight.w600,
                      ),)
                    ],
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),

                ),
              ],
            ),
          ],
        ),


      ),
      );
  }
}



