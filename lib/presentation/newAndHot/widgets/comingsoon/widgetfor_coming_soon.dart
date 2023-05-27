import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nexflix_clone_flutter/core/color/colors.dart';
import 'package:nexflix_clone_flutter/core/constants/constants.dart';
import 'package:nexflix_clone_flutter/model/movie_info.dart';
import 'package:nexflix_clone_flutter/presentation/home/widgets/custom_button_widget.dart';

import '../../../widgets/video_widgets.dart';

class ComingSoonInfo extends StatelessWidget {
  const ComingSoonInfo({
    super.key, required this.movieInfo,
  });
  final MovieInfoModel movieInfo;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String imageUrl = 'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=00852b78f457782c4d7c59505d4e06a0';

    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                fetchDate(movieInfo.releaseDate!),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              // Text(
              //   '11',
              //   style: TextStyle(
              //     fontSize: 30,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
            ],
          ),
        ),
        SizedBox(
          height: 450,
          width: size.width - 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(videoImage:  imageUrl),
              kHeight20,
               Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                    
                      movieInfo.originalTitle!,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        letterSpacing: -3,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Row(
                    children: [
                      CustomButtonWidget(
                        icon: Icons.notifications,
                        title: 'remind me',
                        iconSize: 20,
                        fontSize: 12,
                      ),
                      kWidth20,
                      CustomButtonWidget(
                        icon: Icons.info,
                        title: 'Info',
                        iconSize: 20,
                        fontSize: 12,
                      ),
                      kWidth20,
                    ],
                  )
                ],
              ),
              kHeight,
              Text(
                 ("Coming on ${fetchDay(movieInfo.releaseDate!)}"),
                style: txtStyle16,
              ),
              kHeight20,
              Text(
                movieInfo.originalTitle ?? 'Empty Title',
                style: txtStyle18,
              ),
              kHeight,
               Text(
                movieInfo.overview,
                maxLines: 4,
                style: const TextStyle(
                  color: greycolor,
                  
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  String fetchDate(String date) {
    //convert date in string format to date format 
    DateTime dateInFormat = DateTime.parse(date);
    final formatDate = (DateFormat.MMMMd().format(dateInFormat)).split(" ");
    //add \n to make it in the displayable format eg:
    //APR
    //5
    return "${formatDate.first.substring(0, 3)} \n${formatDate.last} ";
  }

  String fetchDay(String date) {
    DateTime dateInFormat = DateTime.parse(date);
    final dayName = DateFormat('EEEE').format(dateInFormat);
    return dayName;
  }
}

