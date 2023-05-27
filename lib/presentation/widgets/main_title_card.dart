import 'package:flutter/material.dart';
import 'package:nexflix_clone_flutter/infrastucture/apikey.dart';
import 'package:nexflix_clone_flutter/infrastucture/base_client.dart';
import 'package:nexflix_clone_flutter/model/movie_info.dart';

import '../../core/constants/constants.dart';
import 'main_card.dart';
import 'main_text_tilte.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    super.key,
    required this.title,
    required this.apiUrl,
  });
  final String title;
  final String apiUrl;

  @override
  Widget build(BuildContext context) {
    List imageList = [];
    return FutureBuilder(
      future: apicall(apiUrl),
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
        if (snapshot.data == null) {
          return Text('No value');
        }

        if (snapshot.hasData) {
          imageList = snapshot.data.results.map((MovieInfoModel movieInfo) {
            if (movieInfo.posterPath == null) {
              return null;
            }
            String imageUrl =
                'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=$apiKey';

            return imageUrl;
          }).toList();
          if(imageList.isEmpty){
              return ListTile(title: Text('No $title'));
            }
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MainTitle(title: title),
            ),
            kHeight,
            LimitedBox(
              maxHeight: 200,
              child:  ListView.separated(
            //padding: EdgeInsets.all(15),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>  MainCard(imageUrlFromApi:imageList[index]),
            itemCount: 10,
            separatorBuilder: (context, index) => kWidth,
          ),
        )
            
          ],
        );
      },
    );
  }
}
// Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//          Padding(
//           padding:  const EdgeInsets.all(8.0),
//           child:  MainTitle(title: title),
//         ),
//        kHeight,
//       LimitedBox(
//         maxHeight: 200,
//         child: ListView(
//           scrollDirection: Axis.horizontal,
//           children: List.generate(10, (index) => const MainCard()),
//         ),
//       )
//       ],
//     )