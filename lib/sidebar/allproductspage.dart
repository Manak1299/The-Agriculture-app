import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_caption/model/detailData.dart';

class AllProductsPage extends StatefulWidget {
  @override
  _AllProductsPageState createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Products"),centerTitle: true,),
      body: Container(
        child: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(DetailData.allproductList().length, (index) {
            return GestureDetector(
              child: Card(
                  elevation: 4,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('${DetailData.allproductList()[index].item_name}', style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 12),),
                      Image.asset(DetailData.allproductList()[index].item_image,
                        width: 100,
                        height: 100,
                      ),
                    ],
                  )
              ),
            );
          }),
        ),
      ),
    );
  }
}
