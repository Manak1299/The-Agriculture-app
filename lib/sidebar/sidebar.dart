import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_caption/model/detailData.dart';
import 'package:flutter_caption/sidebar/allproductspage.dart';
import 'package:flutter_caption/sidebar/websitepage.dart';
import 'package:rxdart/subjects.dart';
import 'package:share/share.dart';
import 'aboutPage.dart';
import 'catalogpage.dart';
import 'menuitem.dart';

class Sidebar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar>
    with SingleTickerProviderStateMixin<Sidebar> {
  StreamController<bool> _streamController;
  StreamSink<bool> _streamSink;
  Stream<bool> _streamside;
  AnimationController _animationController;
  Duration _animDuration = const Duration(microseconds: 1000);
  String text = '';
  String subject = '';
  List<String> imagePaths = ["assets/manak_resume.png"];
  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: _animDuration);
    _streamController = PublishSubject<bool>();
    _streamside = _streamController.stream;
    _streamSink = _streamController.sink;
    _streamSink.add(true);
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _streamController.close();
    _streamSink.close();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return StreamBuilder<bool>(
      initialData: true,
      stream: _streamside,
      builder: (context, isOpend) {
        return AnimatedPositioned(
          duration: _animDuration,
          top: 0,
          bottom: 0,
          left: isOpend.data ? 0 : -screenWidth,
          right: isOpend.data ? 0 : screenWidth - 45,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.blue,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      /*ListTile(
                        title: Text("Name Title",
                            style: TextStyle(color: Colors.white)),
                        subtitle: Text("Name Sub Title",
                            style: TextStyle(color: Colors.white)),
                        leading: CircleAvatar(
                          radius: 50,
                          //child: Icon(Icons.perm_identity,color: Colors.white,size: 80,),
                          child: Image.network(
                            "https://static.indiatvnews.com/ins-web/images/kohli-profile-1540274232.jpg",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.white.withOpacity(0.3),
                        height: 0.45,
                        endIndent: 30,
                        indent: 30,
                        thickness: 1,
                      ),*/
                      MenuItem(
                        icons: Icons.home,
                        title: "All Products",
                        onTap: () {
                          onIconPressed();
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new AllProductsPage()));
                        },
                      ),
                      MenuItem(
                        icons: Icons.home,
                        title: "Catalog",
                        onTap: () {
                          onIconPressed();
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new CatalogPage()));
                        },
                      ),
                      MenuItem(
                        icons: Icons.web_asset,
                        title: "Website",
                        onTap: () {
                          onIconPressed();
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new WebsitePage()));
                        },
                      ),
                      MenuItem(
                        icons: Icons.help,
                        title: "Help & Support",
                        onTap: () {
                          onIconPressed();
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new AboutUsPage()));
                        },
                      ),
                      MenuItem(
                        icons: Icons.share,
                        title: "Share",
                        onTap: () {
                          onIconPressed();
                        },
                      ),
                      MenuItem(
                        icons: Icons.home,
                        title: "Version",
                        onTap: () {
                          onIconPressed();
                          _showDialog();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 35,
                      height: 110,
                      color: Colors.blue,
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Colors.cyan[400],
                        size: 25,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }



  void onIconPressed() {
    final anim_status = _animationController.status;
    final iscompleted = anim_status == AnimationStatus.completed;

    if (iscompleted) {
      _streamSink.add(false);
      _animationController.reverse();
    } else {
      _streamSink.add(true);
      _animationController.forward();
    }
  }


  void _showDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('App Version'),
          content: Container(
            height: 100,
            child: Column(
              children: [

              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

 /* _displayPattern(int n) {
    String pattern ;

    for (var i = 0; i < n; i++) {
     *//* print("  ");
      pattern ="  ";*//*
      for (var j=0; j<=i ;j++ ){
        print("* ");
        pattern ="* ";
      }

    }
    return pattern;
  }*/
}

void _sharebutton() {

}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;
    final width = size.width;
    final height = size.height;
    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
