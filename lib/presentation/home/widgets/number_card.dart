import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:nexflix_clone_flutter/core/color/colors.dart';
import '../../../core/constants/constants.dart';

class NumberCardWidget extends StatelessWidget {
  const NumberCardWidget({super.key, required this.index, required this.imageUrl});
  final int index;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 30,
              height: 200,
            ),
            Container(
              width: 130,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: kRadius10,
                image:  DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      imageUrl),
                ),
              ),
            ),
          ],
        ),
        Positioned(
            bottom: -30,
            left: 5,
            child: BorderedText(
              strokeColor: txtColor,
              strokeWidth: 10.0,
              child: Text(
                "${index +1}",
                style:const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: blackColor,
                  fontSize: 140,
                  decoration: TextDecoration.none,
                  decorationColor: Colors.white,
                  
                ),
              ),
            )),
      ],
    );
  }
}
