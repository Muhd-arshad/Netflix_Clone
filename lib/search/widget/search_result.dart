import 'package:flutter/material.dart';
import 'package:nexflix_clone_flutter/domain/apiendpoints.dart';
import 'package:nexflix_clone_flutter/infrastucture/base_client.dart';
import 'package:nexflix_clone_flutter/model/movie_info.dart';
import 'package:nexflix_clone_flutter/search/widget/searchtitle_widget.dart';

import '../../core/constants/constants.dart';
import '../../infrastucture/apikey.dart';

class SearchResultWidget extends StatelessWidget {
  final String apiQuery;
  const SearchResultWidget({super.key, required this.apiQuery});

  @override
  Widget build(BuildContext context) {
    List imageList = [];
    String imageUrl ='';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchPageTitleWIdget(title: "Movies & TV"),
        kHeight,
        Expanded(
          child: FutureBuilder(
            future: apicall(ApiEndPoints.searchmovie + apiQuery),
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
                return const Center(
                  child: Text(
                    'No data found ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                );
              }
              imageList = snapshot.data.results.map((MovieInfoModel movieInfo) {
                if (movieInfo.posterPath != null) {
                  imageUrl =
                      'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=$apiKey';
                }

                return imageUrl;
              }).toList();
              if (imageList.isEmpty) {
                return const Center(
                  child: Text(
                    'No movie found ',
                    style: TextStyle(fontSize: 20),
                  ),
                );
              }

              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 9,
                  crossAxisSpacing: 9,
                  childAspectRatio: 1 / 1.4,
                ),
                itemBuilder: (context, index) {
                  return CardForSearchResult(
                    imageurl: imageList[index],
                  );
                },
                itemCount: imageList.length,
              );
            },
          ),
        ),
      ],
    );
  }
}

class CardForSearchResult extends StatelessWidget {
  const CardForSearchResult({super.key, required this.imageurl});
  final String imageurl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(imageurl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
