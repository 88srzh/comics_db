import 'package:comics_db_app/ui/components/custom_auth_text_style.dart';
import 'package:comics_db_app/ui/widgets/auth/components/form_widget.dart';
import 'package:flutter/material.dart';

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
            'In order to use the editing and rating capabilities of TMDb, as well as get personal recommendations you will need to login to your account. If you do not have an account, registering for an account is free and simple.',
            style: customAuthTextStyle(),
          ),
          const SizedBox(height: 5),
          TextButton(
            // style: AppButtonStyle.linkButton,
            onPressed: () {},
            child: const Text('Register'),
          ),
          const SizedBox(height: 25),
          Text(
            'If you signed up but did not get your verification email.',
            style: customAuthTextStyle(),
          ),
          const SizedBox(height: 5),
          TextButton(
            // style: AppButtonStyle.linkButton,
            onPressed: () {},
            child: const Text('Verify email'),
          ),
        ],
      ),
    );
  }
}
