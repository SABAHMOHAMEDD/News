import 'package:flutter/material.dart';
import 'package:news_app/api/SoursesResponse.dart';

class SourseTab extends StatelessWidget {
  Source source;
  bool selected;

  SourseTab(this.source,this.selected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:16 ,vertical:8 ),
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(24),
          color:selected? Theme.of(context).primaryColor: Colors.transparent,
          border: Border.all(color: Theme.of(context).primaryColor,width: 2)
      ),
      child: Text(source.name??'',style:
      TextStyle(color: selected?  Colors.white:Theme.of(context).primaryColor)

        ,),

    );
  }
}
