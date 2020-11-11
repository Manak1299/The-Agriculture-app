import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_caption/splashpage.dart';
import 'package:hexcolor/hexcolor.dart';

import 'demoPage.dart';
import 'mainhomepage.dart';

void main() => runApp(MyApp());

Map<int, Color> color =
{
  900:Color.fromRGBO(2, 136, 209, .1),
  50:Color.fromRGBO(2, 136, 209, .2),
  100:Color.fromRGBO(2, 136, 209, .3),
  200:Color.fromRGBO(2, 136, 209, .4),
  300:Color.fromRGBO(2, 136, 209, .5),
  400:Color.fromRGBO(2, 136, 209, .6),
  500:Color.fromRGBO(2, 136, 209, .7),
  600:Color.fromRGBO(2, 136, 209, .8),
  700:Color.fromRGBO(2, 136, 209, .9),
  800:Color.fromRGBO(2, 136, 209, 1),
};

class MyApp extends StatelessWidget {


  //1ada7d1
  // MaterialColor colorCustom = MaterialColor(0xFF880E4F, color);
  MaterialColor colorCustom = MaterialColor(0xFF0288D1, color);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blue
      //or set color with: Color(0xFF0000FF)
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: ScreenOne(),
      home: SplashPage(),
    );
  }

}

//Side Menu Refs:- https://www.youtube.com/watch?v=oExw0U4U_UI

