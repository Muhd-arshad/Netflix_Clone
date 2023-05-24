import 'package:flutter/material.dart';
import 'package:nexflix_clone_flutter/search/widget/searchtitle_widget.dart';

import '../../core/constants/constants.dart';

String imageUrl =
    "https://media.istockphoto.com/id/1051788618/vector/movie-and-film-poster-template-design-modern-retro-vintage-style.jpg?s=612x612&w=0&k=20&c=CwMag6f5GwoHexEtMA5zrep78r4Q4yV0ZF8X0CUCIUs=";

class SearchResultWidget extends StatelessWidget {
  // final String apiQuery;
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchPageTitleWIdget(title: "Movies & TV"),
        kHeight,
        Expanded(
            child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 9,
          crossAxisSpacing: 9,
          childAspectRatio: 1 / 1.4,
          shrinkWrap: true,
          children: List.generate(
            20,
            (index) => const CardForSearchResult(),
          ),
        )),
      ],
    );
  }
}

class CardForSearchResult extends StatelessWidget {
  const CardForSearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
