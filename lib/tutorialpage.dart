import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worm_indicator/shape.dart';
import 'package:worm_indicator/worm_indicator.dart';

import 'mainhomepage.dart';

class Example1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExampleState();
}

class _ExampleState extends State<Example1> {
  PageController controller = PageController();
  var currentPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  /*  Widget buildPageView() {
    return PageView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      controller: controller,
      itemBuilder: (BuildContext context, int pos) {
        if(pos==0){
          return Container(
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Text("If - Page $pos",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          );
        }else if(pos==1){
          return Container(
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Text("ELSE IF - Page $pos",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          );
        }else{
          return Container(
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Text("ELSE- Page $pos",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          );
        }

      },
      itemCount: 3,
    );
  }*/

  Widget buildPageView() {
    return PageView.builder(
      controller: controller,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, position) {
        if (position == 0) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(currentPageValue - position)
              ..rotateY(currentPageValue - position)
              ..rotateZ(currentPageValue - position),
            child: Container(
              color: position % 2 == 0 ? Colors.blue : Colors.pink,
              child: Image(
                image: AssetImage(
                "assets/firstpage.jpeg"),
                fit: BoxFit.fill,
              ),
            ),
          );
        } else if (position == 1) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(currentPageValue - position)
              ..rotateY(currentPageValue - position)
              ..rotateZ(currentPageValue - position),
            child: Container(
              color: position % 2 == 0 ? Colors.blue : Colors.pink,
              child: Center(
                child: Image(
                  image: AssetImage(
                      "assets/firstpage.jpeg"),
                  fit: BoxFit.fill,)
              ),
            ),
          );
        } else  if (position == 2){
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(currentPageValue - position)
              ..rotateY(currentPageValue - position)
              ..rotateZ(currentPageValue - position),
            child: Container(
              color: position % 2 == 0 ? Colors.blue : Colors.pink,
              child: Center(
                  child: Image(
                    image: AssetImage(
                        "assets/firstpage.jpeg"),
                    fit: BoxFit.fill,)
              ),
            ),
          );
          /*Text(
                "Page ELSE $position",
                style: TextStyle(color: Colors.white, fontSize: 22.0),
              ),*/
        }else{
          return  navigatetonextPage(context);
        }
      },
      itemCount: 4,
    );
  }

  Widget buildExampleIndicatorWithShapeAndBottomPos(
      Shape shape, double bottomPos) {
    return Positioned(
      bottom: bottomPos,
      left: 0,
      right: 0,
      child: WormIndicator(
        length: 3,
        controller: controller,
        shape: shape,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final circleShape = Shape(
      size: 16,
      shape: DotShape.Circle,
      spacing: 8,
    );
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page;
      });
    });
    return Scaffold(
      body: Stack(
        children: <Widget>[
          buildPageView(),
          buildExampleIndicatorWithShapeAndBottomPos(circleShape, 20),
        ],
      ),
    );
  }
}

Widget navigatetonextPage(BuildContext context) {
  Navigator.pop(context);
  Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MyHomePage()));
}
