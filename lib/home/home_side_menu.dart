import 'package:flutter/material.dart';

class HomeSideMenu extends StatelessWidget {
  static const int categories = 1;
  static const int settings = 2;
  Function
      onItemClickCallBack; // 34an na b recive the func from home page lazem a5d el func f constructor
  HomeSideMenu(this.onItemClickCallBack);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 64),
              color: Theme.of(context).primaryColor,
              alignment: Alignment.center,
              child: const Text(
                'News App!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24),
              )),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    //call back to connet with home page(categories tab)
                    onItemClickCallBack(categories);
                  },
                  child: Row(
                    children: [
                      ImageIcon(AssetImage('assets/images/ic_categories.png')),
                      SizedBox(
                        width: 18,
                      ),
                      Text(
                        'Categories',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    //call back to connet with home page(settings tab)
                    onItemClickCallBack(settings);
                  },
                  child: Row(
                    children: const [
                      ImageIcon(AssetImage('assets/images/ic_settings.png')),
                      SizedBox(
                        width: 18,
                      ),
                      Text(
                        'Settings',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
