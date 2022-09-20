import 'package:flutter/material.dart';
import 'package:news_app/api/SoursesResponse.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/sourses_tabs.dart';

class HomeScreen extends StatelessWidget {
  static const String RouteName= 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: Text('NewsApp '),),
      body: Column(
        children: [
          FutureBuilder<SoursesResponse>(
            future:ApiManager.getNewsSourses() ,


              builder:(buildcontext,snapShot){
              if(snapShot.hasError){
                return Center(child: Text('${snapShot.error.toString()}'));

              }else if(snapShot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());

              }
              var data= snapShot.data;
              if('error'==data?.status){
                return Center(child: Text('${data?.message}'));

              }
              var sourses=data?.sources;
              return SoursesTabs(sourses!);


              })

        ],

      ),

    );
  }
}
