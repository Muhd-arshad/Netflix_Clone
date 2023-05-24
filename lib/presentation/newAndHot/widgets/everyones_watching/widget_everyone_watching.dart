import 'package:flutter/material.dart';

import '../../../../core/color/colors.dart';
import '../../../../core/constants/constants.dart';
import '../../../home/widgets/custom_button_widget.dart';
import '../../../widgets/video_widgets.dart';

class EveryOneWatchingWidget extends StatelessWidget {
  const EveryOneWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        Text(
          'Friends',
          style: txtStyle18,
        ),
        kHeight,
        const Text(
          'This hit sitcomes follows the money misadvanture of six 20- something pais as  they navigate the pitfalls of work,life and loves in 1990s Manhattan',
          style: TextStyle(
            color: greycolor,
          ),
        ),
        kHeight50,
        const VideoWidget(),
        kHeight20,
       const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtonWidget(
              icon: Icons.share,
              title: 'Share',
              fontSize: 12,
              iconSize: 25,
            ),
            kWidth,
            CustomButtonWidget(
              icon: Icons.add,
              title: 'My list',
              fontSize: 12,
              iconSize: 25,
            ),
            kWidth,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              title: 'like',
              fontSize: 12,
              iconSize: 25,
            ),
            kWidth,
          ],
          
        )
      ],
    );
  }
}
