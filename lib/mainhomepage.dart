import 'dart:async';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_caption/homepages/listPage.dart';
import 'package:flutter_caption/sidebar/sidebar.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'homepages/aboutusPage.dart';
import 'homepages/dashboardPage.dart';
import 'homepages/inquiryformPage.dart';

class MyHomePage extends StatefulWidget {

  String title;
  MyHomePage({Key key, this.title}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int currentPage = 0;
  String _title="";
  PageController controller = PageController();
  var currentPageValue = 0.0;
  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (currentPageValue < 2) {
        currentPageValue++;
      } else {
        currentPageValue = 0.0;
      }
      controller.animateToPage(
        currentPageValue.toInt(),
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
    controller = PageController();
    _title = 'Home';
  }

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page;
      });
    });
    return Scaffold(
      appBar: AppBar(
       // title: Center(child: Text(_title)),
        title:  Center(child: Image.asset('assets/cpa_logo.png',height: 40,width: 80,))
      ),

      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: _getPage(currentPage),
        ),
      ),
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(
              iconData: Icons.home,
              title: "Home",
              onclick: () {
                final FancyBottomNavigationState fState =
                    bottomNavigationKey.currentState;
                fState.setPage(0);
              }),
          TabData(iconData: Icons.perm_identity, title: "About Us", onclick: () {}),
          TabData(iconData: Icons.send, title: "Inquiry", onclick: () {}),
          TabData(iconData: Icons.menu, title: "More", onclick: () {})
        ],
        // initialSelection: 1,
        key: bottomNavigationKey,
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
            switch (position) {
              case 0:
                {
                  _title = 'Home';
                }
                break;
              case 1:
                {
                  _title = 'About Us';
                }
                break;
              case 2:
                {
                  _title = 'Inquiry';
                }
                break;
              case 3:
                {
                  _title = 'More';
                }
                break;
            }
          });
        },
      ),
    );
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return ListPage();
      case 1:
        return AboutPage();
      case 2:
        return InquiryPage();
      case 3:
        return Scaffold(
          body: Stack(
            children: [
              Sidebar()
            ],
          ),
        );
    }
  }

}
