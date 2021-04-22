import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import './outsideDoor.dart';


class SplashScreen extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds:3),
        //()=>Navigator.push(context,MaterialPageRoute(builder:(context)=>OutsideDoor())));
            ()=>Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>OutsideDoor())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(children: [Image.asset(
        "images/books.jpeg",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),

        Positioned(top: MediaQuery.of(context).size.height*.85,
          left: MediaQuery.of(context).size.width*.39,
          child: SpinKitRotatingCircle
            (color:Colors.transparent,),),
      ],),);
  }
}
