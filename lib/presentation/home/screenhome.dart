import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nexflix_clone_flutter/core/color/colors.dart';
import 'package:nexflix_clone_flutter/core/constants/constants.dart';
import 'package:nexflix_clone_flutter/presentation/home/widgets/background_card_widget.dart';
import 'package:nexflix_clone_flutter/presentation/home/widgets/number_tille_card_widget.dart';
import '../widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (context, value, child) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }

              return true;
            },
            child: Stack(
              children: [
                ListView(
                  children: const [
                    BackgroundWidget(),
                    MainTitleCard(title: 'Released in the past year'),
                    MainTitleCard(title: 'Trending'),
                    NumberTitleCardWidget(),
                    MainTitleCard(title: 'Release Tense '),
                    MainTitleCard(title: 'South indian Movies'),
                  ],
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                        width: double.infinity,
                        height: 90,
                        color: Colors.black.withOpacity(0.2),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  'https://www.freepnglogos.com/uploads/netflix-logo-circle-png-5.png',
                                  width: 60,
                                  height: 60,
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.cast_sharp,
                                  color: txtColor,
                                  size: 30,
                                ),
                                kWidth,
                                Container(
                                  height: 30,
                                  width: 30,
                                  color: Colors.blue,
                                ),
                                kWidth,
                              ],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Tv Shows',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Movies',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Categories',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          );
        },
      ),
    );
  }
}
