import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import './one.dart';
import './two.dart';

// 
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
                title: Text('മഹത്വീകരണം (കൗമാ)   ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(1);
                  Navigator.pop(context);
                }), ListTile(
                title: Text('അനുതാപത്തിൻ്റെ  മസുമൂർ   ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(4);
                  Navigator.pop(context);
                }), ListTile(
                title: Text('അനുതാപ  പ്രാർത്ഥനകൾ    ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(6);
                  Navigator.pop(context);
                }), ListTile(
          title: Text('സ്തോത്രം -കന്യകാമറിയാമിൻ്റെ   പാട്ട്    ',
              style: TextStyle(fontWeight: FontWeight.bold)),
        onTap: () {
          _pdfViewerController.jumpToPage(11);
          Navigator.pop(context);
        }),
            ListTile(
                title: Text('മസുമൂർ   ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(12);
                  Navigator.pop(context);
                }),ListTile(
                title: Text('മാലാഖമാരുടെ സ്തുതി   ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(18);
                  Navigator.pop(context);
                }),ListTile(
                title: Text('പരിശുദ്ധാത്മാവിനു  വേണ്ടിയുള്ള  അപേക്ഷകൾ    ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(22);
                  Navigator.pop(context);
                }),
            Container(height:40.0,
                color: Colors.blueAccent,
                child:Center(
                  child: Text('ഓരോ ഞായറാഴ്ചത്തേക്കുള്ള പ്രോമ്യോൻ, സെദറാ ',
                      style:TextStyle(fontSize: 12,fontWeight:FontWeight.bold),),
                )),
            ListTile(
                title: Text('ഒന്നാം ഞായറാഴ്ച    ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(28);
                  Navigator.pop(context);
                }),ListTile(
                title: Text('രണ്ടാം ഞായറാഴ്ച  ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(34);
                  Navigator.pop(context);
                }),ListTile(
                title: Text('മൂന്നാം  ഞായറാഴ്ച    ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(38);
                  Navigator.pop(context);
                }),ListTile(
                title: Text('നാലാം ഞായറാഴ്ച    ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(43);
                  Navigator.pop(context);
                }),ListTile(
                title: Text('അഞ്ചാം  ഞായറാഴ്ച     ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(47);
                  Navigator.pop(context);
                }),ListTile(
                title: Text('രണ്ടാം ഭാഗം ശുശ്രുഷ    ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(51);
                  Navigator.pop(context);
                }),ListTile(
                title: Text('നിഖ്യാ  വിശ്വാസപ്രമാണം     ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(55);
                  Navigator.pop(context);
                }),ListTile(
                title: Text('ഹൂത്താമ്മാ    ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(57);
                  Navigator.pop(context);
                }),ListTile(
                title: Text('പ്രത്യേക പ്രാർത്ഥനകൾ    ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(61);
                  Navigator.pop(context);
                }),ListTile(
                title: Text('വിശുദ്ധ കുർബാനയുടെ ക്രമം    ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(68);
                  Navigator.pop(context);
                }),ListTile(
                title: Text('വിശുദ്ധ കുർബാനയുടെ  പരസ്യശുശ്രൂഷ     ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _pdfViewerController.jumpToPage(71);
                  Navigator.pop(context);
                }),

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
