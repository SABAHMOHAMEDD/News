import 'package:flutter/material.dart';
import 'package:news_app/home/categories/categories_fragment.dart';
import 'package:news_app/home/news_fragment.dart';
import 'package:news_app/home/settings/settings.dart';

import 'home_side_menu.dart';

class HomeScreen extends StatefulWidget {
  static const String RouteName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage('assets/images/pattern.png'),
                fit: BoxFit.cover)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: PreferredSize(
                preferredSize: AppBar().preferredSize,
                child: SafeArea(
                    child: Container(
                  height: 80,
                  color: Colors.transparent,
                  child: AppBar(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(34),
                        bottomRight: Radius.circular(34),
                      ),
                    ),
                    elevation: 8,
                    backgroundColor: Theme.of(context).primaryColor,
                    title: Text(
                      'News App',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ))),
            drawer: Drawer(
              child: HomeSideMenu(onSideMenuItemClick),
            ),
            body: currentWidget));
  }

  @override
  void initState() {
    super.initState();
    currentWidget = CategoriesFragment(onCategoryClick);
  }

  late Widget currentWidget;

  void onCategoryClick(Category category) {
    currentWidget = NewsFragment(category);
    setState(() {});
  }

  void onSideMenuItemClick(int type) {
    if (type == HomeSideMenu.categories) {
      currentWidget = CategoriesFragment(onCategoryClick);
    } else if (type == HomeSideMenu.settings) {
      currentWidget = Settings();
    }
    setState(() {});
    Navigator.pop(context);
  }
}
