import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:docokana_new_app/Screens/Profile/profile.dart';
import 'package:docokana_new_app/Screens/notifications.dart';
import 'Chat/home_screen.dart';
import 'Home.dart';
import 'package:docokana_new_app/util/color.dart';

class Tabbar extends StatefulWidget {
  @override
  _TabbarState createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Exit'),
              content: Text('Do you want to exit the app?'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('No'),
                ),
                FlatButton(
                  onPressed: () => SystemChannels.platform
                      .invokeMethod('SystemNavigator.pop'),
                  child: Text('Yes'),
                ),
              ],
            );
          },
        );
      },
      child: Scaffold(
        body: DefaultTabController(
          length: 4,
          initialIndex: 1,
          child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: primaryColor,
                automaticallyImplyLeading: false,
                title: TabBar(
                    labelColor: Colors.white,
                    indicatorColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    isScrollable: false,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      Tab(
                        icon: Icon(
                          Icons.person,
                          size: 30,
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.article,
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.add,
                          size: 30,
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.message,
                        ),
                      )
                    ]),
              ),
              body: TabBarView(
                children: [
                  Center(child: Profile()),
                  Center(child: CardPictures()),
                  Center(child: HomeScreen()),
                  Center(child: Notifications()),
                ],
                physics: NeverScrollableScrollPhysics(),
              )),
        ),
      ),
    );
  }
}
