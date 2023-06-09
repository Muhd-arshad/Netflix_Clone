import 'package:flutter/material.dart';
import 'package:nexflix_clone_flutter/core/constants/constants.dart';
import 'package:nexflix_clone_flutter/domain/apiendpoints.dart';
import 'package:nexflix_clone_flutter/infrastucture/apikey.dart';
import 'package:nexflix_clone_flutter/infrastucture/base_client.dart';
import 'package:nexflix_clone_flutter/model/movie_info.dart';

import '../../../core/color/colors.dart';
import 'custom_button_widget.dart';

class BackgroundWidget extends StatefulWidget {
  const BackgroundWidget({super.key});

  @override
  State<BackgroundWidget> createState() => _BackgroundWidgetState();
}

class _BackgroundWidgetState extends State<BackgroundWidget> {
  @override
  void initState() {
    super.initState();
    setimage();
  }

  setimage() async {
    dynamic result = await apicall(ApiEndPoints.moviepopular);
    setState(() {
      if (result.results.isNotEmpty) {
        MovieInfoModel movieInfo = result.results[2];
        imageUrl =
            "https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=$apiKey";
      }
    });
  }
  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration:  BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl ?? kBgImage),
            ),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtonWidget(
                  icon: Icons.add,
                  title: 'My List',
                ),
                _playButton(),
                const CustomButtonWidget(icon: Icons.info, title: 'Info'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.white),
      ),
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        size: 25,
        color: blackColor,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          'Play',
          style: TextStyle(fontSize: 20, color: blackColor),
        ),
      ),
    );
  }
}
