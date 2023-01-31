// Flutter imports:
import 'package:comics_db_app/ui/widgets/settings/model_theme.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:provider/provider.dart';

class CustomMainAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const CustomMainAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
      builder: (context, ModelTheme themeNotifier, child) {
        return AppBar(
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
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     GestureDetector(
                //       onTap: () {},
                //       child: const Icon(
                //         Icons.search,
                //         color: AppColors.searchIcon,
                //         size: 30,
                //       ),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
                //       child: GestureDetector(
                //         onTap: () {},
                //         child: const Icon(
                //           Icons.filter_alt_outlined,
                //           color: AppColors.ratingThumb,
                //           size: 30,
                //         ),
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: () {},
                //       child: const Icon(
                //         Icons.menu,
                //         color: AppColors.ratingThumb,
                //         size: 30,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
          backgroundColor: themeNotifier.isDark ? AppColors.kPrimaryColor : Colors.white70,
        );
      },
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
