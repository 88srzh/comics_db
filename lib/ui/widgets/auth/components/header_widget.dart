// Flutter imports:
import 'package:comics_db_app/ui/widgets/auth/components/guest_auth_button_widget.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:comics_db_app/ui/components/custom_auth_text_style.dart';
import 'package:comics_db_app/ui/widgets/auth/components/form_widget.dart';

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
          Text(
            'In order to use the editing and rating capabilities of TMDb, as well as get personal recommendations you will need to login to your account.',
            style: customAuthTextStyle(),
          ),
          const SizedBox(height: 10.0),
          Text(
            'Or you can enter via guest login.',
            style: customAuthTextStyle(),
          ),
          const SizedBox(width: 5.0),
          const GuestAuthButtonWidget(),
          const SizedBox(width: 5.0),
        ],
      ),
    );
  }
}
