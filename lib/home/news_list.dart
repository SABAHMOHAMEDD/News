import 'package:flutter/material.dart';
import 'package:news_app/api/SoursesResponse.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/NewsResponse.dart';

import '../news_widget.dart';

class NewsList extends StatelessWidget {
  Source source;

  NewsList(this.source);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(

          child: FutureBuilder<NewsResponse>(
        future: ApiManager.getNewsBySourseId(source.id),
        builder: (buildcontext, snapShot) {
          if (snapShot.hasError) {
            return Center(child: Text('${snapShot.error.toString()}'));
          } else if (snapShot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          var data = snapShot.data;
          if ('error' == data?.status) {
            return Center(child: Text('${data?.message}'));
          }
          return ListView.builder(
              itemBuilder: (_, index) {
                return NewsWidget((data?.newsList![index])!);
              },
              itemCount: data?.newsList?.length ?? 0);
        },
      )),
    );
  }
}
