import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      /*crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,*/
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 5,
            shadowColor: Colors.grey,
            color: Colors.cyan,
            child: Container(
              width: double.infinity,
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start ,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Manak Agarwal"),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Manak Agarwal"),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Manak Agarwal"),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 50,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 5,
            shadowColor: Colors.grey,
            color: Colors.cyan,
            child: Container(
              width: double.infinity,
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Manak Agarwal"),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Manak Agarwal"),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Manak Agarwal"),
                  )
                ],
              ),
            ),
          ),
        ),

      ],
    );
  }
}
