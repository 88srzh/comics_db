import 'package:comics_db_app/domain/data_providers/session_data_provider.dart';
import 'package:comics_db_app/ui/components/custom_setting_divider.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodySettingsWidget(),
    );
  }
}

class BodySettingsWidget extends StatelessWidget {
  const BodySettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        HeadingCardWidget(headingText: 'Общее'),
        CustomSettingDivider(),
        GeneralCard(),
        CustomSettingDivider(),
      ],
    );
  }
}


class HeadingCardWidget extends StatelessWidget {
  const HeadingCardWidget({Key? key, required this.headingText}) : super(key: key);
  final String headingText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            color: Colors.grey[50],
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(headingText, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GeneralCard extends StatelessWidget {
  const GeneralCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        // SessionDataProvider().setSessionId(null);
        Navigator.pushNamed(context, MainNavigationRouteNames.auth);
      },
      title: const Text('Выйти'),
      trailing: const Icon(Icons.logout),
    );
  }
}


