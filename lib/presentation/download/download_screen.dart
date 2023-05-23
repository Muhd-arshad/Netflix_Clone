import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nexflix_clone_flutter/core/color/colors.dart';
import 'package:nexflix_clone_flutter/core/constants/constants.dart';
import 'package:nexflix_clone_flutter/presentation/widgets/app_bar_widget.dart';

class ScreenDownload extends StatelessWidget {
  ScreenDownload({super.key});

  final _widgetList = [
    const _SmartDownloads(),
    SectionTwo(),
    const SectionThree(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBarWidget(
          title: 'Downloads',
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) => _widgetList[index],
        separatorBuilder: (context, index) => const SizedBox(
          height: 25,
        ),
        itemCount: _widgetList.length,
      ),
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        kWidth,
        Icon(
          Icons.settings,
          color: txtColor,
        ),
        kWidth,
        Text('Smart Downloads'),
      ],
    );
  }
}

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

class SectionThree extends StatelessWidget {
  const SectionThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: btColorBlue,
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Set Up',
                style: TextStyle(
                    color: txtColor, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          color: btColorWhite,
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See what You Can Download',
              style: TextStyle(
                color: blackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


class DownloadsImageWidgets extends StatelessWidget {
  final EdgeInsets margin;
  final double angle;
  final double radius;
  final Size size;
  final String imageList;

  const DownloadsImageWidgets({super.key,
  required this.margin,
  this.angle=0,
  this.radius=10,
  required this.size,
  required this.imageList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imageList),
              ),
            ),
          ),
        ),
      ),
    );
    
  }
}
