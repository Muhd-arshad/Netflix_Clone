import 'package:flutter/material.dart';
import 'package:nexflix_clone_flutter/core/color/colors.dart';
import 'package:nexflix_clone_flutter/presentation/newAndHot/widgets/everyones_watching/widget_everyone_watching.dart';
import '../../core/constants/constants.dart';
import 'widgets/comingsoon/widgetfor_coming_soon.dart';

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
                SizedBox(
                  height: 25,
                  width: 30,
                  child: Image.network(
                      'https://www.themoviedb.org/t/p/w220_and_h330_face/aX0H63vho7rZ9Rm3I567Zf00Z1t.jpg'),
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
          _comingsoon(context),
          _buildEveryOneWatching(),
        ]),
      ),
    );
  }
}

Widget _comingsoon(BuildContext context) {
  return ListView.separated(
    shrinkWrap: true,
    itemBuilder: (context, index) => const ComingSoonWidget(),
    separatorBuilder: (context, index) => kHeight,
    itemCount: 10,
  );
}

Widget _buildEveryOneWatching() {
  return ListView.separated(
    shrinkWrap: true,
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    itemBuilder: (context, index) => const EveryOneWatchingWidget(),
    separatorBuilder: (context, index) => kHeight,
    itemCount: 10,
  );
}
