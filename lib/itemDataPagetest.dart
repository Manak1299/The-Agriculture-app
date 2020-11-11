import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'model/tabDatamodel.dart';

class ItemDataPage extends StatefulWidget {
  String item_name;
  ItemDataPage({Key key, this.item_name}) : super(key: key);
  @override
  _ItemDataPageState createState() => _ItemDataPageState();
}

class _ItemDataPageState extends State<ItemDataPage>
    with TickerProviderStateMixin {
  // double screenRatio;
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
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.blue,
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
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Text('Application',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 22.0)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.count(
                            childAspectRatio: 10/1,
                            crossAxisCount: 1,
                            shrinkWrap: true,
                            children: List.generate(
                              TabData.application_list().length,
                                  (index) {
                                return Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(TabData.application_list()[index].value),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              new Column(
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
                    height: 320.0,
                    child: new TabBarView(
                      controller: _tabController,
                      children: [Tab1data(), Tab2data()],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
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
  return Center(
    child: RaisedButton(onPressed: () {  },color: Colors.blue,child: Text("Download"),

    ),
  );
}

Widget Tab2data() {
  List<TabData> _dummylist = TabData.dummy_list();
  return ListView.builder(
      itemCount: _dummylist.length,
      itemBuilder: (context, i) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("*"),
                Flexible(child: Text(_dummylist[i].name+":",style: TextStyle(fontSize: 14,fontWeight:FontWeight.bold),)),
                Flexible(child: Text(_dummylist[i].value,style: TextStyle(fontSize: 12),)),
    ]
            ),
      )
  );
}
