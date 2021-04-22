import 'package:flutter/material.dart';

import './body.dart';

import 'package:fluttertoast/fluttertoast.dart';

//Double tap to exit the app
class OutsideDoor extends StatefulWidget {
  @override
  _BackButtonState createState() => _BackButtonState();
}

class _BackButtonState extends State<OutsideDoor> {
  DateTime backbuttonpressedTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xff0398FC),
      body: WillPopScope(
        onWillPop: onWillPop, //here
        child: MyApp(),
        //
        //

        //here
      ),
    );
  }

  Future<bool> onWillPop() async {
    DateTime currentTime = DateTime.now();

    //bifbackbuttonhasnotbeenpreedOrToasthasbeenclosed
    //Statement 1 Or statement2
    bool backButton = backbuttonpressedTime == null ||
        currentTime.difference(backbuttonpressedTime) > Duration(seconds: 3);

    if (backButton) {
      backbuttonpressedTime = currentTime;
      Fluttertoast.showToast(
          msg: "Double Click to exit app",
          backgroundColor: Colors.black,
          textColor: Colors.white);
      // return false;
      return Future.value(false);
    }
    //return true;
    return Future.value(true);
  }
}
