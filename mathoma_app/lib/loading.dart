import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:marthom/marthomapp.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState(){
    super.initState();
 Timer(Duration(seconds:3),()=>Navigator.push(context,MaterialPageRoute(builder:(context)=>MarthomApp())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(children: [Image.asset(
        "images/4.jpeg",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),

        Positioned(top: 430,
           left: 130,
          child: SpinKitThreeBounce
            (color:Color(0xff0398FC),),),
      ],),);
  }
}
