// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:comics_db_app/ui/components/custom_auth_text_widget.dart';
import 'package:comics_db_app/ui/widgets/auth/components/form_widget.dart';
import 'package:comics_db_app/ui/widgets/auth/components/guest_auth_button_widget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          FormWidget(),
          const SizedBox(height: 25),
          const CustomAuthTextWidget(
            text:
                'In order to use the editing and rating capabilities of TMDb, as well as get personal recommendations you will need to login to your account.',
          ),
          const SizedBox(height: 10.0),
          const CustomAuthTextWidget(text: 'Or you can enter via guest.'),
          const SizedBox(height: 10.0),
          const GuestAuthButtonWidget(),
          const SizedBox(width: 5.0),
        ],
      ),
    );
  }
}
