import 'dart:developer';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inno_net_app/features/home/presentation/blocs/bloc/scroll_view_listener_bloc.dart';
import 'package:inno_net_app/features/home/presentation/screens/widgets/home_page_post_show_tile.dart';

/// [HomeScreen] is a class that is used to display the home screen.
/// this widget is responsible for displaying the home screen.
/// this widgets shows the list of posts on the home screen.
/// [_scrollController] is used to listen to the scroll events.
/// according to the scroll direction, the app bar and bottom navigation bar will be hidden or shown.
/// if the user scrolls down the app bar and bottom navigation bar will be hidden.
/// if the user scrolls up the app bar and bottom navigation bar will be shown.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        log("User scroll down");
        // user scroll down
        BlocProvider.of<ScrollViewListenerBloc>(context)
            .add(ScrollViewListenerReverse());
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        // user scroll up
        BlocProvider.of<ScrollViewListenerBloc>(context)
            .add(ScrollViewListenerForward());
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
                controller: _scrollController,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const HomePagePostsShowTile();
                },
                separatorBuilder: (context, index) {
                  return 10.heightBox;
                },
                itemCount: 20)
            .expanded()
      ],
    );
  }
}
