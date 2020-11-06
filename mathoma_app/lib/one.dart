import 'package:flutter/material.dart';
import './two.dart';

class Books extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0398FC),
      body: Stack(
        children: [Positioned(
          top: 60,
          left: 20,
          child: IconButton(icon: Icon(Icons.arrow_back_ios_rounded),onPressed: (){ Navigator.pop(context);},)),
          Positioned(
              top: 60,
              left: 120,
              child: Text("BOOKS",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 43,
                      //  fontWeight: FontWeight.bold,
                      fontFamily: 'Antony',
                      wordSpacing: 10,
                      letterSpacing: 4))),
          Positioned(
              top: 160,
              left: 55,
              child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    width: 260,
                    height: 65,
                    child: Center(
                        child: Text(
                      " പരസ്യാരാധനക്രമം ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                  onTap: () {
                    print('***');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Index()),
                    );
                  })),
          Positioned(
              top: 250,
              left: 55,
              child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    width: 260,
                    height: 65,
                    child: Center(
                        child: Text(
                      " ****",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                  onTap: () {
                    print('English');
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Books()),
                    // );
                  })),
          Positioned(
              top: 340,
              left: 55,
              child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    width: 260,
                    height: 65,
                    child: Center(
                        child: Text(
                      " ****",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                  onTap: () {
                    print('English');
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Books()),
                    // );
                  })),
          Positioned(
              top: 430,
              left: 55,
              child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    width: 260,
                    height: 65,
                    child: Center(
                        child: Text(
                      " ****",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                  onTap: () {
                    print('English');
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Books()),
                    // );
                  })),
          Positioned(
              top: 520,
              left: 55,
              child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    width: 260,
                    height: 65,
                    child: Center(
                        child: Text(
                      " ****",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                  onTap: () {
                    print('English');
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Books()),
                    // );
                  }))
        ],
      ),
    );
  }
}
