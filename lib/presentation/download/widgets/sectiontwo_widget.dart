import 'package:flutter/material.dart';
import 'package:nexflix_clone_flutter/domain/apiendpoints.dart';
import 'package:nexflix_clone_flutter/infrastucture/base_client.dart';
import 'package:nexflix_clone_flutter/model/movie_info.dart';
import 'package:nexflix_clone_flutter/presentation/download/widgets/download_image_widgets.dart';
import '../../../core/color/colors.dart';
import '../../../core/constants/constants.dart';

class SectionTwo extends StatefulWidget {
  const SectionTwo({super.key});

  @override
  State<SectionTwo> createState() => _SectionTwoState();
}

class _SectionTwoState extends State<SectionTwo> {
  List imageList = [];

  @override
  void initState() {
    super.initState();
    initializeImages();
  }

  initializeImages() async {
    dynamic result = await apicall(ApiEndPoints.trendingall);
    result == null ? debugPrint("null") : debugPrint("not null");
    setState(() {
      imageList = result.results.map((MovieInfoModel movieInfo) {
        if (movieInfo.posterPath == null) {
          return null;
        }

        String imageUrl =
            'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=b2dee3b855c4ea705ff5dda3c0201768';
        return imageUrl;
      }).toList();
    });
  }

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
            fontSize: 22,
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
            children: imageList.length < 3
                ? []
                : [
                    CircleAvatar(
                      radius: size.width * 0.36,
                      backgroundColor: Colors.grey.withOpacity(0.5),
                    ),
                    DownloadsImageWidgets(
                      imageList: imageList[0],
                      margin: const EdgeInsets.only(
                        left: 150,
                      ),
                      angle: 25,
                      size: Size(size.width * 0.32, size.width * 0.52),
                    ),
                    DownloadsImageWidgets(
                      imageList: imageList[1],
                      margin: const EdgeInsets.only(
                        right: 150,
                      ),
                      angle: -20,
                      size: Size(size.width * 0.32, size.width * 0.52),
                    ),
                    DownloadsImageWidgets(
                      imageList: imageList[2],
                      margin: const EdgeInsets.only(bottom: 20),
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
