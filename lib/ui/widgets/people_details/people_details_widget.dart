// Flutter imports:
import 'package:comics_db_app/ui/widgets/settings/model_theme.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/components/custom_details_appbar_widget.dart';
import 'package:comics_db_app/ui/widgets/people_details/components/cast_widget.dart';
import 'package:comics_db_app/ui/widgets/people_details/components/description_widget.dart';
import 'package:comics_db_app/ui/widgets/people_details/components/people_top_poster_widget.dart';
import 'package:comics_db_app/ui/widgets/people_details/people_details_cubit.dart';
import 'package:provider/provider.dart';

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
    return Consumer<ModelTheme>(
      builder: (context, ModelTheme notifierTheme, child) {
        return Scaffold(
          appBar: const CustomDetailsAppBar(title: ''),
          body: ColoredBox(
            color: notifierTheme.isDark ? AppColors.kPrimaryColor : Colors.transparent,
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
      },
    );
  }
}
