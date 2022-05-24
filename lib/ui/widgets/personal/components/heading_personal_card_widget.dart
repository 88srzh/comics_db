import 'package:flutter/material.dart';

class HeadingPersonalCardWidget extends StatelessWidget {
  const HeadingPersonalCardWidget({Key? key, required this.headingText}) : super(key: key);
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
