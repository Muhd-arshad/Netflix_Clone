import 'package:flutter/material.dart';
import 'package:nexflix_clone_flutter/presentation/download/widgets/sectionthree_widget.dart';
import 'package:nexflix_clone_flutter/presentation/download/widgets/sectiontwo_widget.dart';
import 'package:nexflix_clone_flutter/presentation/download/widgets/smart_download_widget.dart';
import 'package:nexflix_clone_flutter/presentation/widgets/app_bar_widget.dart';

class ScreenDownload extends StatelessWidget {
  ScreenDownload({super.key});

  final _widgetList = [
    const SmartDownloads(),
    const SectionTwo(),
    const SectionThree(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBarWidget(
          title: 'Downloads',
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) => _widgetList[index],
        separatorBuilder: (context, index) => const SizedBox(
          height: 25,
        ),
        itemCount: _widgetList.length,
      ),
    );
  }
}
