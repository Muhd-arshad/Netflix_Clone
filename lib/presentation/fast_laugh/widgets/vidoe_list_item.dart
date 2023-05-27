import 'package:flutter/material.dart';
import 'package:nexflix_clone_flutter/core/color/colors.dart';
import 'package:nexflix_clone_flutter/domain/apiendpoints.dart';
import 'package:nexflix_clone_flutter/infrastucture/base_client.dart';
import 'package:nexflix_clone_flutter/model/movie_info.dart';

import '../../../infrastucture/apikey.dart';
import 'fast_laugh_video.dart';

final dummyVideoUrls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4"
];

class VideoListItems extends StatefulWidget {
  final int index;
  const VideoListItems({super.key, required this.index});

  @override
  State<VideoListItems> createState() => _VideoListItemsState();
}

class _VideoListItemsState extends State<VideoListItems> {
  List imageList = [];
  trendingDataFetch() async {
    dynamic result = await apicall(ApiEndPoints.trendingall);

    setState(() {
      imageList = result.results.map((MovieInfoModel movieInfo) {
        String imageurl =
            "https://image.tmdb.org/t/p/w500/${movieInfo.posterPath}?api_key=$apiKey";

        return imageurl;
      }).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    trendingDataFetch();
  }

  @override
  Widget build(BuildContext context) {
    final videoUrl = dummyVideoUrls[widget.index % dummyVideoUrls.length];

    return Stack(
      children: [
        FastLaughVideoPlayer(videoUrl: videoUrl),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //leftside
                CircleAvatar(
                  backgroundColor: blackColor,
                  radius: 30,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.volume_off_outlined),
                    iconSize: 30,
                    color: txtColor,
                  ),
                ),
                //rightside
                if (imageList.isNotEmpty) ...[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                            imageList[widget.index],
                          ),
                        ),
                      ),
                      const VideoActionWidget(
                          icon: Icons.emoji_emotions, title: "LOL"),
                      const VideoActionWidget(
                          icon: Icons.add, title: "My List"),
                      const VideoActionWidget(
                          icon: Icons.share, title: "Share"),
                      const VideoActionWidget(
                          icon: Icons.play_arrow, title: "Play"),
                    ],
                  )
                ],
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
