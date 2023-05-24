import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';
import 'main_card.dart';
import 'main_text_tilte.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    super.key, required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding:  const EdgeInsets.all(8.0),
          child:  MainTitle(title: title),
        ),
       kHeight,
      LimitedBox(
        maxHeight: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(10, (index) => const MainCard()),
        ),
      )
      ],
    );
  }
}