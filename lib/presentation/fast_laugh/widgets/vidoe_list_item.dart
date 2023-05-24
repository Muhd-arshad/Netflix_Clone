import 'package:flutter/material.dart';
import 'package:nexflix_clone_flutter/core/color/colors.dart';

class VideoListItems extends StatelessWidget {
  final int index;
  const VideoListItems({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //rightside
                CircleAvatar(
                  backgroundColor: blackColor,
                  radius: 30,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.volume_off_outlined),iconSize: 30,color: txtColor,
                  ),
                ),
                //rightside
               const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage('https://www.themoviedb.org/t/p/w220_and_h330_face/1E5baAaEse26fej7uHcjOgEE2t2.jpg'),),
                    ),
                     VideoActionWidget(
                        icon: Icons.emoji_emotions, title: "LOL"),
                    VideoActionWidget(icon: Icons.add, title: "My List"),
                   VideoActionWidget(icon: Icons.share, title: "Share"),
                    VideoActionWidget(
                        icon: Icons.play_arrow, title: "Play"),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class VideoActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: txtColor,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(color: txtColor, fontSize: 16),
          )
        ],
      ),
    );
  }
}
