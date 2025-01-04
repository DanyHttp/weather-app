import 'package:flutter/material.dart';

class Huorly_Cart extends StatelessWidget {
  const Huorly_Cart({super.key, required this.screensize});

  final Size screensize;

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              width: screensize.width / 5.5,
              height: screensize.height / 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff9BC6FD), Color(0xff5099FC)]),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('11:0',style: TextStyle(color: Colors.white,fontSize: 18),),
                  Image.asset("assets/sun_cloud.png"),
                  Text('11:0',style: TextStyle(color: Colors.white,fontSize: 21,fontWeight: FontWeight.bold),),
                ],
              ),
            );
  }
}