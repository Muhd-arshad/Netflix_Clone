import 'package:flutter/cupertino.dart';
import 'package:nexflix_clone_flutter/core/color/colors.dart';
import 'package:nexflix_clone_flutter/search/widget/searchtitle_widget.dart';

import '../../core/constants/constants.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/q7vmCCmyiHnuKGMzHZlr0fD44b9.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchPageTitleWIdget(
          title: "Top Searches",
        ),
        kHeight,
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => const TopSearchItemTile(),
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: 10),
        ),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/q7vmCCmyiHnuKGMzHZlr0fD44b9.jpg'),
                fit: BoxFit.cover),
          ),
        ),
        kWidth,
        const Expanded(
            child: Text(
          " Movie Name",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        )),
        const Icon(
          CupertinoIcons.play_circle,
          size: 50,color: txtColor,
        )
      ],
    );
  }
}
