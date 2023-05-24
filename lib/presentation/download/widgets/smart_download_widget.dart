import 'package:flutter/material.dart';

import '../../../core/color/colors.dart';
import '../../../core/constants/constants.dart';

class SmartDownloads extends StatelessWidget {
  const SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        kWidth,
        Icon(
          Icons.settings,
          color: txtColor,
        ),
        kWidth,
        Text('Smart Downloads'),
      ],
    );
  }
}