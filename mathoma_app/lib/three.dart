import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0398FC),
      appBar: AppBar(
        title: Text("Marthoman"),
        centerTitle: true,
      ),
      body: Image(
        image: AssetImage('images/hello.jpeg'),
        fit: BoxFit.cover,
      ),
    );
  }
}
