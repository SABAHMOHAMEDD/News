import 'package:flutter/material.dart';
import 'package:news_app/api/SoursesResponse.dart';
import 'package:news_app/home/news_list.dart';
import 'package:news_app/home/sourse_tab.dart';

class SoursesTabs extends StatefulWidget {
 List<Source>  sources;
  SoursesTabs(this.sources);

  @override
  State<SoursesTabs> createState() => _SoursesTabsState();
}

class _SoursesTabsState extends State<SoursesTabs> {
  int selectedtab=0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(

        length:widget.sources.length,

        child: Column(
          children: [
            TabBar(
              onTap: (index){
                selectedtab=index;
                setState( () {});



              },
                isScrollable: true,
                indicatorColor: Colors.transparent,
                tabs:

              widget.sources.map((source) {
                var isSelected = widget.sources.indexOf(source)==selectedtab;

                return SourseTab(source,isSelected);

              }).toList() ),
            NewsList(widget.sources[selectedtab])

            ],

            )

          ,
        ),
    );

  }
}
