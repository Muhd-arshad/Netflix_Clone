import 'package:flutter/material.dart';

import '../../core/color/colors.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: Image.network(
            'https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/qVNACrSwu8RCgf9loLKfTv0mDeq.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            backgroundColor: blackColor.withOpacity(0.5),
            radius: 22,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.volume_off_outlined),
              iconSize: 20,
              color: txtColor,
            ),
          ),
        ),
      ],
    );
  }
}
