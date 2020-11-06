import 'package:flutter/material.dart';
import './four.dart';
import './three.dart';
import './pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xff0398FC),
      floatingActionButton: FlatButton(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.amberAccent,
            child: Text('Page Number'),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GoToPage()),
            );
          }),
      body: Stack(
        children: [Positioned(
          top: 60,
          left: 20,
          child: IconButton(icon: Icon(Icons.arrow_back_ios_rounded),onPressed: (){ Navigator.pop(context);},)),
          Positioned(
              top: 60,
              left: 120,
              child: Text("INDEX",
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
                      " മഹത്വീകരണം  ",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                  onTap: () {
                    print('English');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Page3()),
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
                      " കന്യകമറിയാമിന്റെ പാട്ട്  ",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                  onTap: () {
                    print('English');
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => HomePage()),
                     );
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
                      " 3rd page",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                  onTap: () {
                    print('English');


                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => ThirdExp())
                     );
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
