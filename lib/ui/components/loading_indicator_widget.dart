// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:loading_indicator/loading_indicator.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  const LoadingIndicatorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 50,
        width: 50,
        child: LoadingIndicator(
          indicatorType: Indicator.ballRotateChase,

          /// Required, The loading type of the widget
          colors: [Colors.deepPurpleAccent],

          /// Optional, The color collections
          strokeWidth: 2,

          /// Optional, The stroke of the line, only applicable to widget which contains line
          backgroundColor: Colors.transparent,

          /// Optional, Background of the widget
          pathBackgroundColor: Colors.transparent,

          /// Optional, the stroke backgroundColor
        ),
      ),
    );
  }
}
