import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nexflix_clone_flutter/core/color/colors.dart';
import 'package:nexflix_clone_flutter/search/widget/search_idle.dart';
// import 'package:nexflix_clone_flutter/search/widget/search_idle.dart';
import '../core/constants/constants.dart';
import 'widget/search_result.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  String query = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                onChanged: (value) {
                  setState(() {
                    query = value;
                  });
                },
                backgroundColor: Colors.grey.withOpacity(0.4),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                ),
                style: const TextStyle(color: txtColor),
              ),
              kHeight,
              Expanded(
                child: query.isEmpty
                    ? const SearchIdleWidget()
                    : SearchResultWidget(
                        apiQuery: query,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
