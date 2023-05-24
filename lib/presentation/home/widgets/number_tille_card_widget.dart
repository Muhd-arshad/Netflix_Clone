import 'package:flutter/material.dart';
import 'package:nexflix_clone_flutter/presentation/home/widgets/number_card.dart';

import '../../../core/constants/constants.dart';
import '../../widgets/main_text_tilte.dart';

class NumberTitleCardWidget extends StatelessWidget {
  const NumberTitleCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: MainTitle(title: 'Top 10 Movies In India Today'),
        ),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
                10,
                (index) => NumberCardWidget(
                      index: index,
                    )),
          ),
        )
      ],
    );
  }
}
