import 'package:flutter/material.dart';
import 'package:nexflix_clone_flutter/core/constants/constants.dart';

import '../../../core/color/colors.dart';
import 'custom_button_widget.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget ({super.key});

  @override
  Widget build(BuildContext context) {
    return   Stack(
          children: [
            Container(
              width: double.infinity,
              height: 600,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(kBgImage),
                ),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  const  CustomButtonWidget(
                      icon: Icons.add,
                      title: 'My List',
                    ),
                    _playButton(),
                    const CustomButtonWidget(icon: Icons.info, title:'Info' ),
                  ],
                ),
              ),
            ),
          ],
        );
  }
   TextButton _playButton() {
    return TextButton.icon(
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.white),
      ),
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        size: 25,
        color: blackColor,
      ),
      label: const Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          'Play',
          style: TextStyle(fontSize: 20, color: blackColor),
        ),
      ),
    );
  }
}