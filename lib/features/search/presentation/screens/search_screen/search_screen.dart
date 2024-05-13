import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 25,
          decoration: BoxDecoration(
            color: Theme.of(context).cardTheme.color,
            borderRadius: BorderRadius.circular(10),
          ),
        )
        // ListView.separated(
        //   scrollDirection: Axis.horizontal,
        //   itemBuilder: (context, index) =>
        //       const ChoiceChip(label: Text("jooo"), selected: false),
        //   separatorBuilder: (context, index) => 12.widthBox,
        //   itemCount: 10,
        // )
      ],
    );
  }
}
