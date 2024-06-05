import 'dart:developer';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inno_net_app/core/extensions/page_navigation_extension.dart';
import 'package:inno_net_app/features/article/presentation/blocs/get_articles/get_articles_bloc.dart';
import 'package:inno_net_app/features/article/presentation/screens/article_screen/article_screen.dart';
import 'package:inno_net_app/features/common/widgets/root_bottom_navigation_bar_icon_widget.dart';
import 'package:inno_net_app/features/home/presentation/blocs/bloc/scroll_view_listener_bloc.dart';
import 'package:inno_net_app/features/home/presentation/screens/home/home_screen.dart';
import 'package:inno_net_app/features/post/presentation/screens/post_create_screen/post_create_screen.dart';
import 'package:inno_net_app/features/profile/presentation/screens/profile_screen/profile_screen.dart';
import 'package:inno_net_app/features/search/presentation/screens/search_screen/search_screen.dart';
import 'package:inno_net_app/widgets/app_title_widget.dart';

import 'package:inno_net_app/widgets/custom_svg_picture_widget.dart';
import 'package:page_transition/page_transition.dart';

/// [RootBottomNavigationBar] is a class that is used to display the bottom navigation bar.
/// It has a [StatefulWidget] of type [RootBottomNavigationBar]
/// It has a [State] of type [_RootBottomNavigationBarState]
/// It has a [int] parameter of [_selectedIndex]
/// It has a [List] of type [Widget] parameter of [_screens]
/// It has a [void] method of [_onItemTapped] that takes in an [int] parameter of [index]
/// It has a [void] method of [_onItemTapped] that takes in an [int] parameter of [index]
/// It has a [Widget] build method that returns a [Scaffold] widget
/// It has a [PreferredSize] parameter of [AppBar]
/// It has a [SafeArea] parameter of [bottomNavigationBar]
/// It has a [Row] parameter of [children]
/// It has a [IconButton] parameter of [onPressed]
/// [_onItemTapped] method is called when the user taps on the bottom navigation bar
class RootBottomNavigationBar extends StatefulWidget {
  const RootBottomNavigationBar({super.key});

  @override
  State<RootBottomNavigationBar> createState() =>
      _RootBottomNavigationBarState();
}

class _RootBottomNavigationBarState extends State<RootBottomNavigationBar> {
  int _selectedIndex = 0;

  ///[HomeScreen] hi
  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const SizedBox.shrink(),
    const ArticleScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      context.pushWithTransition(
          const PostCreateScreen(), PageTransitionType.bottomToTop);
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  void initState() {
    context.read<GetArticlesBloc>().add(const GetArticles());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: BlocConsumer<ScrollViewListenerBloc, ScrollViewListenerState>(
            listener: (context, state) {
              if (state is ScrollViewListenerReverseState) {
                log('User scroll down');
                // pageGoesDown = state.pageGoesDown;
              }
              if (state is ScrollViewListenerForwardState) {
                log('User scroll up');
              }
            },
            builder: (context, state) {
              if (state is ScrollViewListenerReverseState) {
                return const SafeArea(child: SizedBox.shrink());
              }
              return _selectedIndex == 0
                  ? AppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      title: const AppTitleWidget(),
                      titleSpacing: 0,
                      actions: const [
                        SvgPictureWidget(
                          imageUrl: 'assets/common/notification (1).svg',
                        ),
                      ],
                    )
                  : _selectedIndex == 1
                      ? const SafeArea(child: CupertinoSearchTextField())
                      : const SizedBox.shrink();
            },
          ).paddingOnly(right: 5, left: 5),
        ),
        body: PopScope(
            canPop: _selectedIndex == 0,
            onPopInvoked: (didPop) {
              if (_selectedIndex != 0) {
                _onItemTapped(0);
              }
            },
            child: _screens[_selectedIndex]),
        bottomNavigationBar:
            BlocBuilder<ScrollViewListenerBloc, ScrollViewListenerState>(
          builder: (context, state) {
            // in this case, the bottom navigation bar will be hidden
            if (state is ScrollViewListenerReverseState) {
              return const SizedBox.shrink();
            }
            return SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      enableFeedback: false,
                      onPressed: () {
                        _onItemTapped(0);
                      },
                      icon: _selectedIndex == 0
                          ? const RootBottomNavigationBarIcon(
                              image: "assets/common/home (1).svg",
                              pageName: "Home",
                            )
                          : const RootBottomNavigationBarIcon(
                              image: "assets/common/home.svg",
                              pageName: "Home",
                            )),
                  IconButton(
                      enableFeedback: false,
                      onPressed: () {
                        _onItemTapped(1);
                      },
                      icon: _selectedIndex == 1
                          ? const RootBottomNavigationBarIcon(
                              image: "assets/common/search.svg",
                              pageName: "Search",
                            )
                          : const RootBottomNavigationBarIcon(
                              image:
                                  "assets/common/search-interface-symbol.svg",
                              pageName: "Search",
                            )),
                  IconButton(
                      enableFeedback: false,
                      onPressed: () {
                        _onItemTapped(2);
                        log('Post button clicked');
                      },
                      icon: _selectedIndex == 2
                          ? const RootBottomNavigationBarIcon(
                              image: "assets/common/more.svg",
                              pageName: "Post",
                            )
                          : const RootBottomNavigationBarIcon(
                              image: "assets/common/more.svg",
                              pageName: "Post",
                            )),
                  IconButton(
                      enableFeedback: false,
                      onPressed: () {
                        _onItemTapped(3);
                      },
                      icon: _selectedIndex == 3
                          ? const RootBottomNavigationBarIcon(
                              image: "assets/common/news (1).svg",
                              pageName: 'Article')
                          : const RootBottomNavigationBarIcon(
                              image: "assets/common/news.svg",
                              pageName: 'Article',
                            )),
                  IconButton(
                      enableFeedback: false,
                      onPressed: () {
                        _onItemTapped(4);
                      },
                      icon: _selectedIndex == 4
                          ? const RootBottomNavigationBarIcon(
                              image: "assets/common/profile-user.svg",
                              pageName: "Profile")
                          : const RootBottomNavigationBarIcon(
                              image: "assets/common/user.svg",
                              pageName: "Profile",
                            )),
                ],
              ),
            );
          },
        ));
  }
}
