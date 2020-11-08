import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import './one.dart';
import './two.dart';

//
//experiment begins here

class Pdf2 extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Pdf2> {
  PdfViewerController _pdfViewerController;
  double counter = 0;

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ശുശ്രൂഷക്രമം',
            style: TextStyle(
              fontSize: 14,
            )),
        // centerTitle:true,
        actions: <Widget>[
          IconButton(
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
                  child: InkWell(
                    child: Text('Books'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Index()),
                      );
                    },
                  ),
                ),
                PopupMenuItem(
                  child: InkWell(
                    child: Text('About Us'),
                    onTap: () {
                      print('About Us Selected');
                    },
                  ),
                ),
                PopupMenuItem(
                  child: InkWell(
                    child: Text('Contact Us'),
                    onTap: () {
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
                title: Text('ശുശ്രൂഷക്രമം  ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(1);
                  Navigator.pop(context);
                }),
            ListTile(
                title: Text('വിശുദ്ധ മാമോദീസ ശുശ്രൂഷക്രമം    ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(5);
                  Navigator.pop(context);
                }),
            ListTile(
                title: Text('വിശുദ്ധ വിവാഹ  ശുശ്രൂഷക്രമം     ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(28);
                  Navigator.pop(context);
                }),
            ListTile(
                title: Text('പ്രസവ സ്തോത്ര  ശുശ്രൂഷ    ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(66);
                  Navigator.pop(context);
                }),
            ListTile(
                title: Text('ഭവന വാഴ് വിൻ്റെ  ക്രമം   ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(76);
                  Navigator.pop(context);
                }),
            ListTile(
                title: Text('രോഗികൾക്ക് വേണ്ടിയുള്ള പ്രാർത്ഥനാക്രമം    ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(95);
                  Navigator.pop(context);
                }),
            ListTile(
                title: Text('ശവസംസ്കാര ശുശ്രൂഷക്രമം     ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(134);
                  Navigator.pop(context);
                }),
            ListTile(
                title: Text('പൈതങ്ങളുടെ ശവസംസ്കാര ശുശ്രൂഷക്രമം   ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(193);
                  Navigator.pop(context);
                }),
            ListTile(
                title: Text(
                    'ആത്മഹത്യ ചെയ്തവരെ  സംസ്കരിക്കുന്നതിനുള്ള  ശുശ്രൂഷക്രമം  ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(210);
                  Navigator.pop(context);
                }),
            ListTile(
                title: Text('ഗീതങ്ങൾ     ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(226);
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
      body: SfPdfViewer.asset(
        'assets/demo2.pdf',
        // canShowScrollHead: false,
        // canShowScrollStatus: false,
        controller: _pdfViewerController,
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        RaisedButton(
            child: IconButton(
          icon: Icon(Icons.add_circle_outline),
          onPressed: () {
            _pdfViewerController.zoomLevel = counter++;
          },
        )),
        RaisedButton(
            child: IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: () {
            _pdfViewerController.zoomLevel = counter--;
          },
        )),
      ]),
    );
  }
}
