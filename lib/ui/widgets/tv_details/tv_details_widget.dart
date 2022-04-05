import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/components/loading_indicator.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_description_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_top_poster_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_trailer_widget.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TvDetailsWidget extends StatefulWidget {
  const TvDetailsWidget({Key? key}) : super(key: key);

  @override
  _TvDetailsWidgetState createState() => _TvDetailsWidgetState();
}

class _TvDetailsWidgetState extends State<TvDetailsWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.microtask(
      () => context.read<TvDetailsModel>().setupLocale(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading =
        context.select((TvDetailsModel model) => model.tvData.isLoading);
    if (isLoading) {
      return const Center(child: LoadingIndicatorWidget());
    }
    var tvTrailerData =
        context.select((TvDetailsModel model) => model.tvData.tvTrailedData);
    final tvTrailerKey = tvTrailerData.trailerKey;
    // final tvVideos = tvDetailsModel.videos.results
    //     .where((video) => video.type == "Trailer" && video.site == 'YouTube');
    // final tvTrailerKey =
    //     tvVideos.isNotEmpty == true ? tvVideos.first.key : null;

    return Scaffold(
      body: ColoredBox(
        color: AppColors.kPrimaryColor,
        child: ListView(
          children: [
            Column(
              children: [
                const TvTopPosterWidget(),
                const TvDescriptionWidget(),
                TvTrailerWidget(youtubeKey: tvTrailerKey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class _FavoritesButton extends StatelessWidget {
//   const _FavoritesButton({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {},
//       child: const Text('В Избранное', style: TextStyle(fontSize: 24)),
//       style: ButtonStyle(
//         shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
//         backgroundColor: MaterialStateProperty.all(AppColors.kPrimaryColorOld),
//         padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 65.0, vertical: 15.0),),
//       ),
//     );
//   }
// }

// class _DirectorWidget extends StatelessWidget {
//   const _DirectorWidget({
//     Key? key
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final model = NotifierProvider.watch<TvDetailsModel>(context);
//     if (model == null) return const SizedBox.shrink();
//     var names = <String>[];
//     final createdBy = model.tvDetails?.createdBy;
//     if (createdBy != null && createdBy.isNotEmpty) {
//       var createdByNames = <String>[];
//       for (var create in createdBy) {
//         createdByNames.add(create.name);
//       }
//       names.add(createdByNames.join(', '));
//     }
//
//
//     return Row(
//       children: [
//         const Text('Режиссер: ', style: TextStyle(color: Colors.grey),),
//         Expanded(
//           child: Text(names.join(' '), style: const TextStyle(color: Colors.black87),),
//         ),
//       ],
//     );
//   }
// }

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
//                 child: _TvActorListWidget()),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: InkWell(
//                 // onTap: () {
//                 //   showDialog<void>(
//                 //       context: context,
//                 //       builder: (BuildContext context) {
//                 //         return Dialog(
//                 //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
//                 //           elevation: 16,
//                 //           child: Container(
//                 //             height: 400,
//                 //             width: 360,
//                 //             child: ListView.builder(
//                 //               itemCount: 6,
//                 //                 itemExtent: 120,
//                 //                 scrollDirection: Axis.horizontal,
//                 //                 itemBuilder: (BuildContext context, int index) {
//                 //                 return _TvActorListItemWidget(actorIndex: index);
//                 //                 }),
//                 //           ),
//                 //         );
//                 //       });
//                 // },
//               onTap: () {},
//                 child: const Text('Полный актерский состав')),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _TvActorListWidget extends StatelessWidget {
//   const _TvActorListWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final model = NotifierProvider.watch<TvDetailsModel>(context);
//     var cast = model?.tvDetails?.credits.cast;
//     if (cast == null || cast.isEmpty) return const SizedBox.shrink();
//     return ListView.builder(
//         itemCount: 6,
//         itemExtent: 120,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (BuildContext context, int index) {
//           return _TvActorListItemWidget(actorIndex: index);
//         });
//   }
// }
//
// class _TvActorListItemWidget extends StatelessWidget {
//   final int actorIndex;
//   const _TvActorListItemWidget({Key? key, required this.actorIndex}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final model = NotifierProvider.read<TvDetailsModel>(context);
//     final actor = model!.tvDetails?.credits.cast[actorIndex];
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
//               backdropPath != null
//                   ? Image.network(ApiClient.imageUrl(backdropPath))
//               // : const SizedBox.shrink(),
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
