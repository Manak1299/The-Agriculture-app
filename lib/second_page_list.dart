import 'package:flutter/material.dart';
import 'itemDataPagetest.dart';
import 'model/detailData.dart';

class SecondNewPage extends StatelessWidget {
  List<DetailData> images_list;
  String item_name;

  SecondNewPage({Key key, this.images_list, this.item_name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(item_name)),
      ),
      body: Container(
        child: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(images_list.length, (index) {
            return GestureDetector(
              onTap: () {
                _settingModalBottomSheet(
                    context, index, images_list[index].item_name);
              },
              child: Card(
                  elevation: 4,
                  color: Colors.white,
                  borderOnForeground: true,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Align(
                          child: Text('${images_list[index].item_name}',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),textAlign: TextAlign.center,)),
                      Image.asset(
                        images_list[index].item_image,
                        width: 100,
                        height: 100,
                      ),
                    ],
                  )),
            );
          }),
        ),
      ),
    );
  }
}

void _settingModalBottomSheet(context, int position, item_names) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      enableDrag: true,
      builder: (BuildContext bc) {
        return Container(
            height: 760,
           child: ItemDataPage(item_name: item_names));
      });
}
