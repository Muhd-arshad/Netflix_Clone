import 'package:flutter/material.dart';
import 'package:nexflix_clone_flutter/presentation/download/widgets/download_image_widgets.dart';
import '../../../core/color/colors.dart';
import '../../../core/constants/constants.dart';

class SectionTwo extends StatelessWidget {
  SectionTwo({super.key});
  final List imageList = [
    'https://www.themoviedb.org/t/p/w220_and_h330_face/1E5baAaEse26fej7uHcjOgEE2t2.jpg',
    'https://www.themoviedb.org/t/p/w220_and_h330_face/5ik4ATKmNtmJU6AYD0bLm56BCVM.jpg',
    'https://www.themoviedb.org/t/p/w220_and_h330_face/aX0H63vho7rZ9Rm3I567Zf00Z1t.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        
        const Text(
          'Introducing Downloads For You',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: txtColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        const Text(
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
          'We will Download A Personilzed Selection Of\nMovies And shows for you,so there is\n always something to watch on your \ndevice',
        ),
        
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: size.width * 0.35,
                backgroundColor: Colors.grey.withOpacity(0.5),
              ),
              DownloadsImageWidgets(
                imageList: imageList[0],
                margin: EdgeInsets.only(left: 150, ),
                angle: 25,
               size: Size(size.width * 0.32, size.width * 0.52),
              ),
              DownloadsImageWidgets(
                imageList: imageList[1],
                margin: EdgeInsets.only(right: 150, ),
                angle: -20,
                size: Size(size.width * 0.32, size.width * 0.52),
              ),
              DownloadsImageWidgets(
                imageList: imageList[2],
                margin: EdgeInsets.only(bottom: 20),
               size: Size(size.width * 0.37, size.width * 0.57),
                radius: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
