// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/ui/components/custom_setting_divider_widget.dart';
import 'package:comics_db_app/ui/widgets/account/account_details_cubit.dart';
import 'package:comics_db_app/ui/widgets/account/components/heading_account_card_widget.dart';
import 'package:comics_db_app/ui/widgets/account/components/logout_card_widget.dart';
import 'package:comics_db_app/ui/widgets/account/components/settings_card_widget.dart';

class AccountWidget extends StatefulWidget {
  const AccountWidget({Key? key}) : super(key: key);

  @override
  State<AccountWidget> createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<AccountDetailsCubit>().setupAccountDetails(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: CustomMainAppBarWidget(),
      body: BodyPersonalWidget(),
    );
  }
}

class BodyPersonalWidget extends StatefulWidget {
  const BodyPersonalWidget({Key? key}) : super(key: key);

  @override
  State<BodyPersonalWidget> createState() => _BodyPersonalWidgetState();
}

class _BodyPersonalWidgetState extends State<BodyPersonalWidget> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AccountDetailsCubit>();
    final name = cubit.state.name;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadingAccountCardWidget(headingText: name),
        const CustomDropdownMenuItemWidget(),
        const CustomSettingDivider(),
        const LogoutCardWidget(),
        const CustomSettingDivider(),
        const HeadingAccountCardWidget(headingText: 'Settings'),
        const CustomSettingDivider(),
        const SettingsCardWidget(),
        const CustomSettingDivider(),
        const NotificationsCardWidget(),
        const CustomSettingDivider(),
        // const AnimationFab(),
      ],
    );
  }
}

class CustomDropdownMenuItemWidget extends StatefulWidget {
  const CustomDropdownMenuItemWidget({
    super.key,
  });

  @override
  State<CustomDropdownMenuItemWidget> createState() => _CustomDropdownMenuItemWidgetState();
}

class _CustomDropdownMenuItemWidgetState extends State<CustomDropdownMenuItemWidget> {
  @override
  Widget build(BuildContext context) {
    // String dropDownValue = 'Favorites';

    return DropdownButton<String>(
      // items: const ['Favorites', 'Movies', 'TV'].map((String value) {
      //   return DropdownMenuItem<String>(
      //     value: value,
      //     child: Text(value),
      //   );
      // }).toList(),
      items: const [
        DropdownMenuItem(value: 'Favorites', child: Text('Favorites')),
        DropdownMenuItem(value: 'Movies', child: Text('Movies')),
        DropdownMenuItem(value: 'TV', child: Text('TV')),
      ],
      value: dropDownValue,
      isExpanded: true,
      style: const TextStyle(color: Colors.green),
      onChanged: dropDownCallback,
    );
  }

  void dropDownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        dropDownValue = selectedValue;
      });
    }
  }
}

class NotificationsCardWidget extends StatefulWidget {
  const NotificationsCardWidget({Key? key}) : super(key: key);

  @override
  State<NotificationsCardWidget> createState() => _NotificationsCardWidgetState();
}

class _NotificationsCardWidgetState extends State<NotificationsCardWidget> {
  bool notifications = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      activeColor: Colors.pinkAccent,
      inactiveThumbColor: Colors.grey,
      value: notifications,
      onChanged: (bool value) {
        setState(
          () {
            notifications = value;
          },
        );
      },
      title: Text(
        'Push notifications',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
