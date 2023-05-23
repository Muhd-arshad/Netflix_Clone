import 'package:flutter/material.dart';
import 'package:nexflix_clone_flutter/fast_laugh/fast_laugh.dart';
import 'package:nexflix_clone_flutter/newAndHot/new_hot.dart';
import 'package:nexflix_clone_flutter/presentation/download/download_screen.dart';
import 'package:nexflix_clone_flutter/presentation/home/screenhome.dart';
import 'package:nexflix_clone_flutter/search/screen_search.dart';

import 'bottom_nav.dart';

class ScreenMain extends StatelessWidget {
  ScreenMain({super.key});

  final _pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastLaugh(),
    const ScreenSearch(),
   ScreenDownload(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: chaneIndexNotifier,
          builder: (context, index, child) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
