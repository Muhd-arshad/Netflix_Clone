import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:nexflix_clone_flutter/core/color/colors.dart';
import '../../../core/constants/constants.dart';

class NumberCardWidget extends StatelessWidget {
  const NumberCardWidget({super.key, required this.index});
  final int index;

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
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://www.themoviedb.org/t/p/w220_and_h330_face/aKx1ARwG55zZ0GpRvU2WrGrCG9o.jpg'),
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
