import 'package:flutter/material.dart';
import 'package:app_swaplivros/components/search_book_delegate.dart';
import 'package:app_swaplivros/components/header.dart';
import 'package:app_swaplivros/components/layout.dart';
import 'package:app_swaplivros/pages/home_page/genrer_view.dart';
import 'package:app_swaplivros/pages/home_page/home.dart';
import 'package:app_swaplivros/pages/home_page/notifications_view.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, int initialIndex = 0})
      : _pageController = PageController(initialPage: initialIndex),
        super(key: key);

  final PageController _pageController;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      headerProps: HeaderProps(
        showLogo: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: SearchBookDelegate());
            },
          ),
        ],
      ),
      showBottomMenu: true,
      pageController: widget._pageController,
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: widget._pageController,
        children: const [
          Home(),
          GenrerView(),
          NotificationsView(),
        ],
      ),
    );
  }
}
