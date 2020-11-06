import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import './one.dart';

void main() {
  runApp(MaterialApp(
    title: 'Syncfusion PDF Viewer Demo',
    home: HomePage(),
  ));
}

/// Represents Homepage for Navigation
class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Syncfusion Flutter PDF Viewer'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.bookmark,
              color: Colors.white,
            ),
            onPressed: () {
              _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
        ],
      ),
      body: SfPdfViewer.asset(
        'assets/demo.pdf',
        key: _pdfViewerKey,
      ),
    );
  }
}
//experiment begins here

class ThirdExp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ThirdExp> {
  PdfViewerController _pdfViewerController;
  double counter=0;

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('പരസ്യാരാധനക്രമം ',style:TextStyle(fontSize:14,)),
        // centerTitle:true,
        actions: <Widget>[IconButton(
      icon: Icon(
        Icons.arrow_back_ios_rounded,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
          IconButton(
            icon: Icon(
              Icons.keyboard_arrow_up,
              color: Colors.white,
            ),
            onPressed: () {
              _pdfViewerController.previousPage();
            },
          ),
          IconButton(
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
            onPressed: () {
              _pdfViewerController.nextPage();
            },
          ),
         //Start delete
          PopupMenuButton<IconButton>(
            onSelected: null,
            itemBuilder: (BuildContext ctxt) {
              return <PopupMenuItem<IconButton>>[
                PopupMenuItem(
                  child: InkWell(child: Text('Books'),onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Books()),
                    );
                  },
                    ),
                ),
                PopupMenuItem(
                  child: InkWell(child: Text('About Us'),onTap: (){
                    print('About Us Selected');
                  },
                  ),
                ),
                PopupMenuItem(
                  child: InkWell(child: Text('Contact Us'),onTap: (){
                    print('Contact Us Selected');
                  },
                  ),
                ),



              ];
            },
          ),




       //Delete here

        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 60,
              color: Color(0xff1f4b91),
              child: Center(
                child: DrawerHeader(
                  decoration: BoxDecoration(),
                  child: Text('INDEX',
                      style: TextStyle(color: Colors.white, fontSize: 25)),
                ),
              ),
            ),
            ListTile(
                title: Text('testing'),
                onTap: () {
                  _pdfViewerController.jumpToPage(29);
                })
          ],
        ),
      ),
      body: SfPdfViewer.asset(
        'assets/demo.pdf',
        // canShowScrollHead: false,
        // canShowScrollStatus: false,
        controller: _pdfViewerController,
      ),
      floatingActionButton: Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RaisedButton(child:IconButton(icon:Icon(Icons.add_circle_outline),onPressed: (){
 _pdfViewerController.zoomLevel = counter++;},)),
            RaisedButton(child:IconButton(icon:Icon(Icons.remove_circle_outline),onPressed: (){_pdfViewerController.zoomLevel = counter--;},)),
          ]
      ),
    );
  }
}
