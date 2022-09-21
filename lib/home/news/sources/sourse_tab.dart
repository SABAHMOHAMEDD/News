import 'package:flutter/material.dart';
import 'package:news_app/home/news/sources/SoursesResponse.dart';

class SourseTab extends StatelessWidget {
  Source source;
  bool selected;

  SourseTab(this.source,this.selected);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      height: 35,
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: selected ? Theme.of(context).primaryColor : Colors.transparent,
          border: Border.all(color: Theme.of(context).primaryColor, width: 2)),
      child: Center(
        child: Text(
          source.name ?? '',
          style: TextStyle(
              color: selected ? Colors.white : Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
