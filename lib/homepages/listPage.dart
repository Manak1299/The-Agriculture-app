import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_caption/autoscroll.dart';
import 'package:flutter_caption/model/detailData.dart';
import 'package:hexcolor/hexcolor.dart';
import '../second_page_list.dart';

class ListPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<ListPage> {
  PageController controller = PageController();
  static int _currentPage = 0;

  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 205,
          child: ScrollPage(),
        ),
        ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            _firstList(),
            _secondList(),
          ],
        )
      ],
    );
  }

  buildPageView() {
    return PageView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      controller: controller,
      itemBuilder: (BuildContext context, int pos) {
        if (pos == 0) {
          return Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset(
                  "assets/slide_1.jpg",
                  height: 180,
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
          );
        } else if (pos == 1) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset("assets/slide_2.jpg",
                    height: 180, fit: BoxFit.fitWidth),
              ],
            ),
          );
        } else if (pos == 2) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset("assets/slide_3.jpg",
                    height: 180, fit: BoxFit.fitWidth),
              ],
            ),
          );
        } else {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset("assets/slide_4.jpg",
                    height: 180, fit: BoxFit.fitWidth),
              ],
            ),
          );
        }
      },
      itemCount: 4,
    );
  }

  _firstList() {
    return Column(
      children: [
        Container(
          color: Colors.blue[100],
          height: 40,
          width: double.infinity,
          child: Center(
            child: Text("Our Ideal Products",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
        ),
        Container(
          height: 180,
          child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(10),
                width: 110,
                height: 110,
                child: GestureDetector(
                  onTap: () {
                    String pump2 = "Submersible Borewell pumps";
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new SecondNewPage(
                              images_list: DetailData.borwellPumpList(),
                              item_name: pump2,
                            )));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/sub_bor_pump.png",
                        height: 100,
                        width: 100,
                      ),
                      SizedBox(height: 10,),
                      Center(
                        child: Text('Submersible Borewell Pumps',
                            style:
                            TextStyle(color: Colors.black87, fontSize: 13,fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 110,
                height: 110.0,
                margin: EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    String pump2 = "Submersible Openwell pumps";


                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new SecondNewPage(
                                images_list: DetailData.openwellPumpList(),
                                item_name: pump2)));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/sub_open_pump.png",
                        height: 100,
                        width: 100,
                      ),
                      SizedBox(height: 5,),
                      Text('Submersible Openwell pumps ',
                          style: TextStyle(color: Colors.black87, fontSize: 13,fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 120,
                height: 120,
                margin: EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    String pump2 = "Self Priming Monoblock Pumps";
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new SecondNewPage(
                                images_list: DetailData.monoblockPumpList(),
                                item_name: pump2)));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/sub_bor_pump.png",
                        height: 100,
                        width: 100,
                      ),
                      Text(
                          'Self Priming Monoblock Pumps',
                          style: TextStyle(color: Colors.black87, fontSize: 13,fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  _secondList() {
    return Column(
      children: [
        Container(
          color: Colors.blue[100],
          height: 40,
          width: double.infinity,
          child: Center(
            child: Text("All Applications",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
        ),
        Container(
          height: 160,
          child: Center(
            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: <Widget>[
                Container(
                    width: 110.0,
                    height: 110,
                    margin: EdgeInsets.all(5),
                    child: GestureDetector(
                      onTap: () {
                        String pump2 = "Agriculture";
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new SecondNewPage(
                                    images_list: DetailData.agriculList(),
                                    item_name: pump2)));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/agri_menu.png",
                            width: 80,
                            height: 80,
                          ),
                          Text(
                            'Agriculture',
                            style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )),
                Container(
                  width: 110.0,
                  height: 110,
                  margin: EdgeInsets.all(5),
                  child: GestureDetector(
                    onTap: () {
                      String pump2 = "Industrial";
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new SecondNewPage(
                                  images_list: DetailData.industrialList(),
                                  item_name: pump2)));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/ind_area.png",
                          width: 80,
                          height: 80,
                        ),
                        Text(
                          'Industrial',
                          style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 110.0,
                  height: 110,
                  margin: EdgeInsets.all(5),
                  child: GestureDetector(
                    onTap: () {
                      String pump2 = "Solar";
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new SecondNewPage(
                                  images_list: DetailData.solarList(),
                                  item_name: pump2)));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/solar_app.png",
                            width: 80, height: 80),
                        Text(
                            'Solar',
                            style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    width: 110.0,
                    height: 110,
                    margin: EdgeInsets.all(5),
                    child: GestureDetector(
                      onTap: () {
                        String pump2 = "Commercial Building Sector";
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new SecondNewPage(
                                    images_list: DetailData.buildingList(),
                                    item_name: pump2)));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/commercial_build.png",
                              width: 80, height: 80),
                          Text(
                            'Commercial Building Sector',
                            style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center
                          ),
                        ],
                      ),
                    )),
                Container(
                  width: 110.0,
                  height: 110,
                  margin: EdgeInsets.all(5),
                  child: GestureDetector(
                    onTap: () {
                      String pump2 = "Sewage & Drainage";
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new SecondNewPage(
                                  images_list: DetailData.savageList(),
                                  item_name: pump2)));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/sewage_app.png",
                            width: 80, height: 80),
                        Text(
                          'Sewage & Drainage',
                          style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
