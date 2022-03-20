import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/components/loading_indicator.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_description_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_title_genres_rating_vote_average_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_top_poster_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_trailer_widget.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieDetailsWidget extends StatefulWidget {
  const MovieDetailsWidget({Key? key}) : super(key: key);

  @override
  _MovieDetailsWidgetState createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<MovieDetailsModel>().setupLocale(context);
  }

  @override
  Widget build(BuildContext context) {
    final movieDetails = context.select((MovieDetailsModel model) => model.movieDetails);
    if (movieDetails == null) {
      return const Center(
        child: LoadingIndicatorWidget(),
      );
    }
    final videos = movieDetails.videos.results
        .where((video) => video.type == 'Trailer' && video.site == 'YouTube');
    final trailerKey = videos.isNotEmpty == true ? videos.first.key : null;
    String youtubeKey = trailerKey.toString();

    return Scaffold(
      body: ColoredBox(
        color: AppColors.kPrimaryColor,
        child: ListView(
          children: [
            Column(
              children: [
                const TopPosterWidget(),
                const TitleGenresRatingVoteAverageWidget(),
                const DescriptionWidget(),
                TrailerWidget(youtubeKey: youtubeKey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// // TODO change font color to grey, may be do colored box
// class _PeoplesWidget extends StatelessWidget {
//   const _PeoplesWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final model = NotifierProvider.watch<MovieDetailsModel>(context);
//     var crew = model?.movieDetails?.credits.crew;
//     if (crew == null || crew.isEmpty) return const SizedBox.shrink();
//     crew = crew.length > 4 ? crew.sublist(0, 4) : crew;
//     var crewChunks = <List<Employee>>[];
//     for (var i = 0; i < crew.length; i += 2) {
//       crewChunks
//           .add(crew.sublist(i, i + 2 > crew.length ? crew.length : i + 2));
//     }
//     return Column(
//       children: crewChunks
//           .map(
//             (chunk) => Padding(
//               padding: const EdgeInsets.only(bottom: 20.0),
//               child: _PeoplesWidgetRow(employes: chunk),
//             ),
//           )
//           .toList(),
//       // children: [
//       //   _PeoplesWidgetRow(employes: [],),
//       //   const SizedBox(height: 20),
//       //   _PeoplesWidgetRow(employes: [],),
//       // ],
//     );
//   }
// }
//
// class _PeoplesWidgetRow extends StatelessWidget {
//   final List<Employee> employes;
//
//   const _PeoplesWidgetRow({Key? key, required this.employes}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.max,
//       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: employes
//           .map((employee) => _PeopleWidgetRowItem(employee: employee))
//           .toList(),
//     );
//   }
// }
//
// class _PeopleWidgetRowItem extends StatelessWidget {
//   final Employee employee;
//
//   const _PeopleWidgetRowItem({Key? key, required this.employee})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(employee.name),
//           Text(employee.job),
//         ],
//       ),
//     );
//   }
// }
//
// class _CastWidget extends StatelessWidget {
//   const _CastWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ColoredBox(
//       color: Colors.transparent,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Text('Актеры'),
//           ),
//           const SizedBox(
//             height: 250.0,
//             child: Scrollbar(
//               child: _MovieActorListWidget(),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: InkWell(
//                 onTap: () {},
//                 // onTap: () async => showFullCastAndCrew(context),
//                 child: const Text('Полный актерский состав')),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _MovieActorListWidget extends StatelessWidget {
//   const _MovieActorListWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final model = NotifierProvider.watch<MovieDetailsModel>(context);
//     var cast = model?.movieDetails?.credits.cast;
//     if (cast == null || cast.isEmpty) return const SizedBox.shrink();
//     return ListView.builder(
//       itemCount: 6,
//       itemExtent: 120,
//       scrollDirection: Axis.horizontal,
//       itemBuilder: (BuildContext context, int index) {
//         return _MovieActorListItemWidget(actorIndex: index);
//       },
//     );
//   }
// }
//
// class _MovieActorListItemWidget extends StatelessWidget {
//   final int actorIndex;
//
//   const _MovieActorListItemWidget({Key? key, required this.actorIndex})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final model = NotifierProvider.read<MovieDetailsModel>(context);
//     final actor = model!.movieDetails?.credits.cast[actorIndex];
//     final backdropPath = actor?.profilePath;
//     return Padding(
//       padding: const EdgeInsets.only(right: 10.0),
//       child: DecoratedBox(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(color: Colors.black.withOpacity(0.2)),
//           borderRadius: const BorderRadius.all(Radius.circular(10)),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.purple.withOpacity(0.1),
//               blurRadius: 8,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: ClipRRect(
//           borderRadius: const BorderRadius.all(Radius.circular(8)),
//           clipBehavior: Clip.hardEdge,
//           child: Column(
//             children: [
//               // TODO if image doesn't exist load 'no image'
//               backdropPath != null
//                   ? Image.network(ApiClient.imageUrl(backdropPath))
//                   // : const SizedBox.shrink(),
//                   : const Image(image: AssetImage(AppImages.noImage)),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(actor!.name, maxLines: 1),
//                       const SizedBox(height: 7),
//                       Text(actor.character, maxLines: 2),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
