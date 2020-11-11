import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'model/tabDatamodel.dart';

class ItemDataPageDepricated extends StatefulWidget {
  String item_name;
  ItemDataPageDepricated({Key key, this.item_name}) : super(key: key);
  @override
  _ItemDataPageState createState() => _ItemDataPageState();
}

class _ItemDataPageState extends State<ItemDataPageDepricated>
    with TickerProviderStateMixin {
  double screenSize;
  // double screenRatio;
  AppBar appBar;
  List<Tab> tabList = List();
  TabController _tabController;
  List<TabData> applicationlist = new List<TabData>();

  @override
  void initState() {
    tabList.add(new Tab(
      child: Text("Catelog", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
    ));
    tabList.add(new Tab(
      child: Text("Data", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
    ));
    _tabController = new TabController(vsync: this, length: tabList.length);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size.width;
    appBar = AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Scaffold(
            body: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Container(
                          color: Colors.blue,
                          width: double.infinity,
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(width: 30,),
                                Text(
                                  widget.item_name,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                                CloseButton(
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Text('Application',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 22.0)),
                        ),
                        GridView.count(
                          childAspectRatio: 16/13,
                          crossAxisCount: 2,
                          crossAxisSpacing: 1.0,
                          mainAxisSpacing: 1.0,
                          shrinkWrap: true,
                          children: List.generate(
                            TabData.application_list().length,
                                (index) {
                              return Text(TabData.application_list()[index].name);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          decoration: new BoxDecoration(
                              color: Theme.of(context).primaryColor),
                          child: new TabBar(
                              controller: _tabController,
                              indicatorColor: Colors.red,
                              indicatorSize: TabBarIndicatorSize.tab,
                              tabs: tabList),
                        ),
                        new Container(
                          height: 200.0,
                          child: new TabBarView(
                            controller: _tabController,
                            children: [Tab1data(), Tab2data()],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getPage(Tab tab) {
    switch (tab.text) {
      case 'Overview':
        return Tab1data();
      case 'Orders':
        return Tab2data();
    }
  }
}

Widget Tab1data() {
  List<TabData> _dummylist = TabData.dummy_data_list();
  return ListView.builder(
      itemCount: _dummylist.length,
      itemBuilder: (context, i) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Flexible(child: Text(_dummylist[i].name)),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Flexible(child: Text(_dummylist[i].value)),
              )
            ],
          ));
}

Widget Tab2data() {
  List<TabData> _dummylist = TabData.dummy_list();
  return ListView.builder(
      itemCount: _dummylist.length,
      itemBuilder: (context, i) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text(_dummylist[i].name), Text(_dummylist[i].value)],
          ));
}
