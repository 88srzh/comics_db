import 'package:comics_db_app/ui/components/custom_social_icon.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLinkButton extends StatelessWidget {
  const SocialLinkButton({super.key, required this.icon, required this.url});

  final IconData icon;
  final String url;

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri)) {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        minimumSize: const Size(0, 0),
        textStyle: Theme.of(context).textTheme.bodySmall,
      ),
      onPressed: () {
        _launchUrl(url);
      },
      child: CustomSocialIcon(icon: icon),
    );
  }
}