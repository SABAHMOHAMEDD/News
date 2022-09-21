import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/news/sources/SoursesResponse.dart';
import 'package:news_app/home/news/sources/sourses_tabs.dart';

import 'categories/categories_fragment.dart';

class NewsFragment extends StatelessWidget {
  Category category;

  NewsFragment(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder<SoursesResponse>(
              future: ApiManager.getNewsSourses(category.id),
              builder: (buildcontext, snapShot) {
                if (snapShot.hasError) {
                  return Center(child: Text('${snapShot.error.toString()}'));
                } else if (snapShot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                var data = snapShot.data;
                if ('error' == data?.status) {
                  return Center(child: Text('${data?.message}'));
                }
                var sourses = data?.sources;
                return SoursesTabs(sourses!);
              })
        ],
      ),
    );
  }
}
