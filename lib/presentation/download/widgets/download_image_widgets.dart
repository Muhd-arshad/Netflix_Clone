import 'dart:math';

import 'package:flutter/material.dart';

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
