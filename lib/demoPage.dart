import 'package:flutter/material.dart';
class MyNewHomePage extends StatefulWidget {

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyNewHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _currentSelected = 0;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();
  final List<Widget> _children = [

  ];

  void onTappedBar(int index){
    index == 3
        ? _drawerKey.currentState.openDrawer()
        : setState((){
      _currentSelected = index;

    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _drawerKey,
      drawer: new Drawer(
          child: ListView(
            children: <Widget>[
              new DrawerHeader(
                child: new Text('Jonathan'),
                decoration: new BoxDecoration(color: Colors.orange),),
              new ListTile(
                leading: const Icon(Icons.notifications),
                title: new Text('Notifications'),
                onTap: (){
                  Navigator.pop(context);
                 // Navigator.push(context, new MaterialPageRoute(builder: (context) => new FirstFragment()));
                },
              ),
              new ListTile(
                leading: const Icon(Icons.list),
                title: new Text('Preferences'),
                onTap: (){
                  Navigator.pop(context);
                //  Navigator.push(context, new MaterialPageRoute(builder: (context) => new SecondFragment()));
                },
              ),
              new ListTile(
                leading: const Icon(Icons.help),
                title: new Text('Help'),
                onTap: (){
                  Navigator.pop(context);
                  //Navigator.push(context, new MaterialPageRoute(builder: (context) => new ThirdFragment()));
                },
              ),
              new ListTile(
                leading: const Icon(Icons.outlined_flag),
                title: new Text('Logout'),
                onTap: (){
                  Navigator.pop(context);
                  //Navigator.push(context, new MaterialPageRoute(builder: (context) => new FirstFragment()));
                },
              ),
            ],
          )
      ),
      body:_children[_currentSelected],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey[900],
        type: BottomNavigationBarType.fixed,
        onTap: onTappedBar,
        currentIndex: _currentSelected,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.white,
        selectedItemColor: Color.fromRGBO(10, 135, 255, 1),
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(icon: new Icon(Icons.home), title: new Text('Home')),
          BottomNavigationBarItem(icon: new Icon(Icons.search), title: new Text('Explore')),
          BottomNavigationBarItem(icon: new Icon(Icons.device_hub), title: new Text('Channels')),
          BottomNavigationBarItem(icon: new Icon(Icons.dehaze), title: new Text('More')),
        ],
      ),
    );
  }
}
class Page extends StatelessWidget {
  const Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}