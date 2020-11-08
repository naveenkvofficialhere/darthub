import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import './one.dart';
import './two.dart';

//
//experiment begins here

class Pdf3 extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Pdf3> {
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
        title: Text('നമസ്കാരക്രമം  ',style:TextStyle(fontSize:14,)),
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
                      MaterialPageRoute(builder: (context) => Index()),
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
                title: Text('സന്ധ്യയിലെ നമസ്കാരം  ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(1);
                  Navigator.pop(context);
                }), ListTile(
                title: Text('സുത്താറയുടെ  നമസ്കാരം     ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(7);
                  Navigator.pop(context);
                }), ListTile(
                title: Text('മയ്യലിൻ്റെ  നമസ്കാരം     ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(21);
                  Navigator.pop(context);
                }), ListTile(
                title: Text('ഈശാനുഹറോ   ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(37);
                  Navigator.pop(context);
                }),
            ListTile(
                title: Text('വൈകുന്നേരത്തെ  സ്തുതി  ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(39);
                  Navigator.pop(context);
                }),ListTile(
                title: Text('കാലത്തെ സ്തുതി    ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(42);
                  Navigator.pop(context);
                }),ListTile(
                title: Text('സന്ധ്യാസമയത്തെ ഒരു പ്രാർത്ഥന     ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(47);
                  Navigator.pop(context);
                }),

            ListTile(
                title: Text('പ്രഭാത സമയത്തെ ഒരു പ്രാർത്ഥന  ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(48);
                  Navigator.pop(context);
                }),ListTile(
                title: Text('പ്രാർത്ഥനകളും ലുത്തിനിയാകളും  ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(50);
                  Navigator.pop(context);
                }),ListTile(
                title: Text('സ്വയ പരിശോധനാ  സഹായി    ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(61);
                  Navigator.pop(context);
                }),ListTile(
                title: Text('മലയാളം  HYMNS   ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(63);
                  Navigator.pop(context);
                }),

          ],
        ),
      ),
      body: SfPdfViewer.asset(
        'assets/demo3.pdf',
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
