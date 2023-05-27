import 'package:flutter/material.dart';
import 'package:nexflix_clone_flutter/model/movie_info.dart';

import '../../../../core/color/colors.dart';
import '../../../../core/constants/constants.dart';
import '../../../home/widgets/custom_button_widget.dart';
import '../../../widgets/video_widgets.dart';

class EveryOneWatchingInfoCard extends StatelessWidget {
  const EveryOneWatchingInfoCard({
    super.key, required this.movieInfo,
  });
  final MovieInfoModel movieInfo;

  @override
  Widget build(BuildContext context) {
    String imageUrl = 
            'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=b2dee3b855c4ea705ff5dda3c0201768';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        Text(
           movieInfo.originalTitle ?? 'No Title Found',
          style: txtStyle18,
        ),
        kHeight,
         Text(
          movieInfo.overview,
          style: const TextStyle(
            color: greycolor,
          ),
        ),
        kHeight50,
         VideoWidget(videoImage: imageUrl),
        kHeight20,
       const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtonWidget(
              icon: Icons.share,
              title: 'Share',
              fontSize: 12,
              iconSize: 25,
            ),
            kWidth,
            CustomButtonWidget(
              icon: Icons.add,
              title: 'My list',
              fontSize: 12,
              iconSize: 25,
            ),
            kWidth,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              title: 'like',
              fontSize: 12,
              iconSize: 25,
            ),
            kWidth,
          ],
          
        )
      ],
    );
  }
}
