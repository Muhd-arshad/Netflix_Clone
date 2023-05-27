import 'package:flutter/material.dart';
import 'package:nexflix_clone_flutter/core/color/colors.dart';
import 'package:nexflix_clone_flutter/presentation/newAndHot/widgets/comingsoon/comingsoonwidget.dart';
import 'package:nexflix_clone_flutter/presentation/newAndHot/widgets/everyones_watching/everyon_wacthing_widget.dart';
import '../../core/constants/constants.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(95),
            child: AppBar(
              backgroundColor: blackColor,
              title: const Text(
                "New & Hot",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
              actions: [
                const Icon(
                  Icons.cast,
                  color: Colors.white,
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
              bottom: TabBar(
                  unselectedLabelColor: txtColor,
                  labelColor: blackColor,
                  isScrollable: true,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                    color: txtColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  tabs: const [
                    Tab(
                      text: "   🍿Coming Soon   ",
                    ),
                    Tab(
                      text: "  🔥Everyone's watching  ",
                    )
                  ]),
            )),
        body: TabBarView(children: [
          // _buildTaabularView('comingSoon'),
          buildComingSoon(),
          _buildEveryOneWatching(),
        ]),
      ),
    );
  }
}


  Widget buildComingSoon() {
    return const ComingSoonWidget();
  }


Widget _buildEveryOneWatching() {
  return  const EveryonesWatchingWidget();
}
