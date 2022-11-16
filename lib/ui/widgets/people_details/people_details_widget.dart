import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/components/custom_appbar.dart';
import 'package:comics_db_app/ui/widgets/people_details/components/cast_widget.dart';
import 'package:comics_db_app/ui/widgets/people_details/components/description_widget.dart';
import 'package:comics_db_app/ui/widgets/people_details/components/people_top_poster_widget.dart';
import 'package:comics_db_app/ui/widgets/people_details/people_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PeopleDetailsWidget extends StatefulWidget {
  const PeopleDetailsWidget({Key? key}) : super(key: key);

  @override
  State<PeopleDetailsWidget> createState() => _PeopleDetailsWidgetState();
}

class _PeopleDetailsWidgetState extends State<PeopleDetailsWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = Localizations.localeOf(context);
    context.read<PeopleDetailsCubit>().setupPeopleDetailsLocale(context, locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text(
      //     'People Details',
      //     style: TextStyle(color: Colors.white),
      //   ),
      // ),
      appBar: const CustomAppBar(title: 'People Details'),
      body: ColoredBox(
        color: AppColors.kPrimaryColor,
        child: ListView(
          children: [
            Column(
              children: const [
                PeopleTopPosterWidget(),
                DescriptionWidget(),
                CastWidget(),
                // KnowForWidget(),
                // const DescriptionWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}