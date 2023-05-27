import 'package:flutter/material.dart';
import 'package:nexflix_clone_flutter/domain/apiendpoints.dart';
import 'package:nexflix_clone_flutter/infrastucture/apikey.dart';
import 'package:nexflix_clone_flutter/infrastucture/base_client.dart';
import 'package:nexflix_clone_flutter/model/movie_info.dart';
import 'package:nexflix_clone_flutter/presentation/home/widgets/number_card.dart';
import '../../../core/constants/constants.dart';
import '../../widgets/main_text_tilte.dart';

class NumberTitleCardWidget extends StatelessWidget {
  const NumberTitleCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List imageList = [];
    return FutureBuilder(
      future: apicall(ApiEndPoints.toprate),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: Column(
              children: [
                CircularProgressIndicator(
                  color: Colors.blue,
                ),
                Text('please wait'),
              ],
            ),
          );
        }
        if (snapshot.data == null) {
          return const Text('No data found');
        }
        imageList = snapshot.data.results.map((MovieInfoModel movieInfo) {
          if (movieInfo.posterPath == null) {
            return null;
          }
          String imageUrl =
              'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=$apiKey';

          return imageUrl;
        }).toList();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: MainTitle(title: 'Top 10 Movies '),
            ),
            kHeight,
            LimitedBox(
              maxHeight: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                    10,
                    (index) => NumberCardWidget(
                          index: index,
                          imageUrl: imageList[index],
                        )),
              ),
            )
          ],
        );
      },
    );
  }
}
