import 'package:flutter/material.dart';
import 'package:nexflix_clone_flutter/core/color/colors.dart';
import 'package:nexflix_clone_flutter/core/constants/constants.dart';
import 'package:nexflix_clone_flutter/presentation/home/widgets/custom_button_widget.dart';

import '../../../widgets/video_widgets.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        const SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'FEB',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              Text(
                '11',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 450,
          width: size.width - 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const VideoWidget(),
              kHeight20,
              const Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Black Night',
                    style: TextStyle(
                      letterSpacing: -3,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      CustomButtonWidget(
                        icon: Icons.notifications,
                        title: 'remind me',
                        iconSize: 20,
                        fontSize: 12,
                      ),
                      kWidth20,
                      CustomButtonWidget(
                        icon: Icons.info,
                        title: 'Info',
                        iconSize: 20,
                        fontSize: 12,
                      ),
                      kWidth20,
                    ],
                  )
                ],
              ),
              kHeight,
              Text(
                'Coming on friday',
                style: txtStyle16,
              ),
              kHeight20,
              Text(
                'Black Night',
                style: txtStyle18,
              ),
              kHeight,
              const Text(
                'Landing the lead in the school musical is dream come true for a jodi,util the pressure sends her confidence-- and her relationship--into a tailspin.',
                style: TextStyle(
                  color: greycolor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

