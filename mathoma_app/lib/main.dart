import 'package:flutter/material.dart';

import './one.dart';

void main() {
  runApp(MaterialApp(
    home: MarthomApp(),
  ));
}

class MarthomApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0398FC),
      backgroundImage:                                    ,
      body: Stack(alignment: Alignment.topLeft, children: [
        Positioned(
            left: MediaQuery.of(context).size.width / 6.5,
            top: 88,
            child: Text("SELECT YOUR ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 43,
                    //  fontWeight: FontWeight.bold,
                    fontFamily: 'Antony',
                            wordSpacing: 10,
                    letterSpacing: 4))),
        Positioned(
            left: 87,
            top: 148,
            child: Text("LANGUAGE ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 43,
                    // fontWeight: FontWeight.bold,
                    fontFamily: 'Antony',
                    wordSpacing: 10,
                    letterSpacing: 4))),
        Positioned(
            top: 290,
            left: MediaQuery.of(context).size.width / 6.5,
            child: InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  width: 260,
                  height: 65,
                  child: Center(
                      child: Text(
                    " മലയാളം",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Ruby'),
                  )),
                ),
                onTap: () {
                  print('Malayalam');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Books()),
                  );
                })),
        Positioned(
            top: 430,
            left: MediaQuery.of(context).size.width / 6.5,
            child: InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  width: 260,
                  height: 65,
                  child: Center(
                      child: Text(
                    " ENGLISH",
                    style: TextStyle(
                      fontSize: 30,
                      //fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
                onTap: () {
                  print('English');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Books()),
                  );
                }))
      ]),
    );
  }
}
