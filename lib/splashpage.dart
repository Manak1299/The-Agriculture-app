
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_caption/tutorialpagetest.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: new Example(),
      title: new Text('Caption',textScaleFactor: 2,),
      image: new Image.asset("assets/agri_logo.png"),
      photoSize: 100.0,
      backgroundColor: HexColor("#1da7d1"),
      loaderColor: HexColor("#1da7d1"),
    );
  }
}

//Loader Refs :- https://flutterawesome.com/a-collection-of-high-fidelity-loading-animations-in-gif-format-with-flutter/
//Git Hub:- https://github.com/Codelessly/FlutterLoadingGIFs