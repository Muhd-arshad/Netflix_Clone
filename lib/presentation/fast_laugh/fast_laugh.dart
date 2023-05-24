import 'package:flutter/material.dart';
import 'package:nexflix_clone_flutter/presentation/fast_laugh/widgets/vidoe_list_item.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: List.generate(10, (index) {
            return VideoListItems(index: index,);
          }),
        ),
    );
  }
}