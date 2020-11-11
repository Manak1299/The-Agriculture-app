import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final IconData icons;
  final String title;
  final  Function onTap;


  const MenuItem({Key key, this.icons, this.title,this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icons,color: Colors.white,),
            SizedBox(width:20),
            Text(title,style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
