import 'package:flutter/material.dart';

import '../../core/color/colors.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
     
    super.key, this.videoImage,
  });
  final String? videoImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: Image.network(
            videoImage!,
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
