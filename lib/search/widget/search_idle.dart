import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nexflix_clone_flutter/core/color/colors.dart';
import 'package:nexflix_clone_flutter/domain/apiendpoints.dart';
import 'package:nexflix_clone_flutter/infrastucture/apikey.dart';
import 'package:nexflix_clone_flutter/infrastucture/base_client.dart';
import 'package:nexflix_clone_flutter/model/movie_info.dart';
import 'package:nexflix_clone_flutter/search/widget/searchtitle_widget.dart';

import '../../core/constants/constants.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/q7vmCCmyiHnuKGMzHZlr0fD44b9.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchPageTitleWIdget(
          title: "Top Searches",
        ),
        kHeight,
        Expanded(
          child: FutureBuilder(
            future: apicall(ApiEndPoints.trendingall),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    ],
                  ),
                );
              }
              if (snapshot.data.results == null) {
                return const Center(
                  child: Text('Not Found'),
                );
              }
              return ListView.separated(
              itemBuilder: (context, index) => TopSearchItemTile(movieInfo:snapshot.data.results[index] ),
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: snapshot.data.results.length );
            },
          ),
        ),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final MovieInfoModel movieInfo;
  const TopSearchItemTile({super.key, required this.movieInfo});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    String url =
        'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=$apiKey';

    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
          ),
        ),
        kWidth,
        Expanded(
          child: Text(
            movieInfo.title ?? 'No movie found',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const Icon(
          CupertinoIcons.play_circle,
          size: 50,
          color: txtColor,
        )
      ],
    );
  }
}
// ListView.separated(
//               itemBuilder: (context, index) => const TopSearchItemTile(),
//               separatorBuilder: (context, index) => const SizedBox(height: 20),
//               itemCount: 10),