import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:calendar_flutter/calendar_flutter.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import './about.dart';
import './faq.dart';
import './feedback.dart';
import './rate.dart';
import './share.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:provider/provider.dart';
import './fun.dart';
import './language.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// void main() {
//   runApp(MaterialApp(
//     home: MyApp(),
//   ));
// }

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.darkThemeEnabled,
      initialData: false,
      builder: (context, snapshot) => MaterialApp(
          theme: snapshot.data ? ThemeData.dark() : ThemeData.light(),
          home: HomePage(snapshot.data)),
    );
  }
}

class HomePage extends StatefulWidget {
  final bool darkThemeEnabled;

  HomePage(this.darkThemeEnabled);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //alarm daily
  FlutterLocalNotificationsPlugin fltrNotification;
  String _selectedParam;
  String task;
  int val;

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);
  //alarm daily

  TimeOfDay _time = TimeOfDay.now();
  var lang;
  var langTitle;
  TimeOfDay picked;
  String good = 'Experiment'; //new
  List<Experiment> experimentList = []; //new

  Future<Null> selectTime(BuildContext context) async {
    picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (picked != null && picked != _time) {
      setState(() {
        _time = picked.replacing(hour: picked.hourOfPeriod);

        // print(_time.toString());
        // print(_time.format(context));
      });
    }
  }
  //Daily Notifications
  //
  //Cancell noti starts here  for cancelling notification

  Future cancelNoti() async {
    var time = new Time(picked.hour, picked.minute, 0);
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'repeatDailyAtTime channel id',
        'repeatDailyAtTime channel name',
        'repeatDailyAtTime description');
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await fltrNotification.cancel(0);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text("Alarm turned off"),
            ),
            // content: Text("Please upload the image"),
            actions: <Widget>[
              Center(
                  child: InkWell(
                child: Text("OK"),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ))
            ],
          );
        });
  }

  //Cancel noti ends here

  //Daily notification Handler statrs here
  Future _showNoti() async {
    var time = new Time(picked.hour, picked.minute, 0);
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'repeatDailyAtTime channel id',
        'repeatDailyAtTime channel name',
        'repeatDailyAtTime description');
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await fltrNotification.showDailyAtTime(0, 'Thought of the day',
        'Click here to open your Daily Bread ', time, platformChannelSpecifics);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text("Alarm turned on"),
            ),
            // content: Text("Please upload the image"),
            actions: <Widget>[
              Center(
                  child: InkWell(
                child: Text("OK"),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ))
            ],
          );
        });
  }
  //Daily notification Handler ends here

//Date Picker
  DateTime _date = DateTime.now();

  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2020, 12, 01),
      lastDate: DateTime.now(),

      // lastDate: DateTime(2022,12,01),
    );
    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
        print(_date.toString());
        DateTime today = new DateTime.now();
      });
      //test to change value exp here

      setState(() {
        readData();
      });
    }
  }

  //Date picker ends here
  @override

  //language and date conditions start here
  void readData() {
    var head;
    var index;
    setState(() {
      if (lang == 1) {
//mal
        if (_date.day == 25 && _date.month == 12) {
          head = 'malchristmas';
//nested if for year condition's existnz
          if (_date.year - 2020 <= 4) {
            index = _date.year - 2020;
          } else {
            index = 0;
          }
          print('Happy Christmas');
        } else if (_date.day == 04 && _date.month == 04 && _date.year == 2021 ||
            _date.day == 17 && _date.month == 04 && _date.year == 2022 ||
            _date.day == 09 && _date.month == 04 && _date.year == 2023 ||
            _date.day == 31 && _date.month == 03 && _date.year == 2024 ||
            _date.day == 20 && _date.month == 04 && _date.year == 2025) {
          head = 'maleaster';
//nested if for year condition's existnz
          if (_date.year - 2020 <= 4) {
            index = _date.year - 2020;
          } else {
            index = 0;
          }
          print('Easter');
        } else if (_date.day == 02 && _date.month == 04 && _date.year == 2021 ||
            _date.day == 15 && _date.month == 04 && _date.year == 2022 ||
            _date.day == 07 && _date.month == 04 && _date.year == 2023 ||
            _date.day == 29 && _date.month == 03 && _date.year == 2024 ||
            _date.day == 18 && _date.month == 04 && _date.year == 2025) {
          head = 'malgood';
//nested if for year condition's existnz
          if (_date.year - 2020 <= 4) {
            index = _date.year - 2020;
          } else {
            index = 0;
          }

          print('Good Friday');
        } else if (_date.day == 01 && _date.month == 04 && _date.year == 2021 ||
            _date.day == 14 && _date.month == 04 && _date.year == 2022 ||
            _date.day == 06 && _date.month == 04 && _date.year == 2023 ||
            _date.day == 28 && _date.month == 03 && _date.year == 2024 ||
            _date.day == 17 && _date.month == 04 && _date.year == 2025) {
          head = 'malpesach';
//nested if for year condition's existnz
          if (_date.year - 2020 <= 4) {
            index = _date.year - 2020;
          } else {
            index = 0;
          }
          print('pesach');
        } else {
          index = _date.day + _date.month;
          head = 'malexp';
          print(_date.day);
        }

//mal
      } else {
        if (_date.day == 25 && _date.month == 12) {
          head = 'christmas';
//nested if for year condition's existnz
          if (_date.year - 2020 <= 4) {
            index = _date.year - 2020;
          } else {
            index = 0;
          }
          print('Happy Christmas');
        } else if (_date.day == 04 && _date.month == 04 && _date.year == 2021 ||
            _date.day == 17 && _date.month == 04 && _date.year == 2022 ||
            _date.day == 09 && _date.month == 04 && _date.year == 2023 ||
            _date.day == 31 && _date.month == 03 && _date.year == 2024 ||
            _date.day == 20 && _date.month == 04 && _date.year == 2025) {
          head = 'easter';
//nested if for year condition's existnz
          if (_date.year - 2020 <= 4) {
            index = _date.year - 2020;
          } else {
            index = 0;
          }
          print('Easter');
        } else if (_date.day == 02 && _date.month == 04 && _date.year == 2021 ||
            _date.day == 15 && _date.month == 04 && _date.year == 2022 ||
            _date.day == 07 && _date.month == 04 && _date.year == 2023 ||
            _date.day == 29 && _date.month == 03 && _date.year == 2024 ||
            _date.day == 18 && _date.month == 04 && _date.year == 2025) {
          head = 'good';
//nested if for year condition's existnz
          if (_date.year - 2020 <= 4) {
            index = _date.year - 2020;
          } else {
            index = 0;
          }

          print('Good Friday');
        } else if (_date.day == 01 && _date.month == 04 && _date.year == 2021 ||
            _date.day == 14 && _date.month == 04 && _date.year == 2022 ||
            _date.day == 06 && _date.month == 04 && _date.year == 2023 ||
            _date.day == 28 && _date.month == 03 && _date.year == 2024 ||
            _date.day == 17 && _date.month == 04 && _date.year == 2025) {
          head = 'pesach';
//nested if for year condition's existnz
          if (_date.year - 2020 <= 4) {
            index = _date.year - 2020;
          } else {
            index = 0;
          }
          print('pesach');
        } else {
          index = _date.day + _date.month;
          head = 'Experiment';
          print(_date.day);
        }
      }
    });
    DatabaseReference experimentRef =
        FirebaseDatabase.instance.reference().child(head);
    experimentRef.once().then((DataSnapshot snap) {
      // var KEYS= snap.value.keys;
      var DATA = snap.value;
      var KEYS = 0;
      experimentList.clear();
      if (KEYS == 0) {
        Experiment experiment = new Experiment(
          DATA[index]['verse'],
          DATA[index]['body'],
        );
        experimentList.add(experiment);
      }
      setState(() {
        print('Length : $experimentList.length');
      });
    });
  }

//language and date conditions end here

  //new inside
  void initState() {
    super.initState();
    var head;
    var index;
    langTitle = 'English';
    var androidInitilize = new AndroidInitializationSettings('app_icon');
    var iOSinitilize = new IOSInitializationSettings();
    var initilizationsSettings = new InitializationSettings(
        android: androidInitilize, iOS: iOSinitilize);
    fltrNotification = new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initilizationsSettings,
        onSelectNotification: notificationSelected);

//alaram daily reminder
//     var androidInitilize = new AndroidInitializationSettings('app_icon');
//     var iOSinitilize = new IOSInitializationSettings();
//
//     new InitializationSettings androidInitilize;
//     fltrNotification = new FlutterLocalNotificationsPlugin();
//     fltrNotification.initialize(initilizationsSettings,
//         onSelectNotification: notificationSelected);
    //alaram daily reminder

    setState(() {
      readData();
    });
  }
//alarm daily

//alarm daily

  //new inside
  Widget build(BuildContext context) {
    DateTime today = new DateTime.now();
    int index;
    String head;

    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          child: Text(
              "${_date.day.toString()}-${_date.month.toString().padLeft(2, '0')}-${_date.year.toString().padLeft(2, '0')}",
              style: TextStyle(
                fontSize: 18.0,
              )),
          onTap: () {
            selectDate(context);

            DateTime today = new DateTime.now();

            //conditions start here

            //index =_time.minute+_date.day+_time.hour;
            //      head='items';
            //      index=2;

            print('loop runs');
            setState(() {
              readData();
            });
            //conditions end here
          },
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.bookmark_border,
              color: Colors.white,
            ),
            onPressed: null,
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/bread.jpeg"),
                          fit: BoxFit.fill)),
                  child: Center(child: Text('Daily Bread'))),
            ),
            Container(
              height: 30.0,
              padding: EdgeInsets.only(left: 28.0, top: 2.0, bottom: 2.0),
              color: Colors.grey[300],
              child: Row(
                children: [
                  Text(
                    'SETTINGS',
                    style: TextStyle(fontSize: 10.0),
                  ),
                  Transform.scale(
                    scale: 1.5,
                    child: IconButton(
                        icon: SvgPicture.asset('icons/settings.svg'),
                        color: Colors.grey[200],
                        onPressed: null //do something,
                        ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey,
            ),
            ListTile(
              title: Text('App Language'),
              onTap: () {
                print('Language button pressed');
                //start

                //lang= 0;
                setState(() {
                  if (langTitle == 'Malayalam') {
                    langTitle = 'English';
                    lang = 0;
                    readData();
                  } else if (langTitle == 'English') {
                    langTitle = 'Malayalam';
                    lang = 1;
                    readData();
                  }
                });
                //end
              },
              subtitle: Text(
                langTitle,
                style: TextStyle(fontSize: 10.0),
              ),
              trailing: Transform.scale(
                scale: .5,
                child: IconButton(
                  icon: SvgPicture.asset('icons/arrow.svg'),
                  onPressed: () {
                    print('icon button pressed');
                  },
                ),
              ),
              contentPadding: EdgeInsets.only(left: 28.0),
            ),
            //daily reminder
            Divider(
              height: 1.0,
              color: Colors.grey,
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  InkWell(
                      child: Text(
                        'Daily Reminder',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      onTap: () {
                        setState(() {
                          selectTime(context);
                          //print(_time.format(context));
                        });
                      }),
                  SizedBox(
                    width: 20.0,
                  ),
                  Transform.scale(
                    scale: .85,
                    child: IconButton(
                        icon: SvgPicture.asset('icons/switch-on.svg'),
                        onPressed: _showNoti),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Transform.scale(
                    scale: .85,
                    child: IconButton(
                        icon: SvgPicture.asset('icons/switch-off.svg'),
                        onPressed: cancelNoti),
                  ),
                ],
              ),
              onTap: () {
                print('Daily Reminder  button pressed');
                //
                //
                //
                //
              },
              subtitle: picked == null
                  ? Text("Select Time")
                  : Text(
                      "${picked.hour.toString()}:${picked.minute.toString()}",
                      style: TextStyle(fontSize: 10.0),
                    ),
              onLongPress: () {
                setState(() {
                  selectTime(context);
                  //print(_time.format(context));
                });
              },
              contentPadding: EdgeInsets.only(left: 28.0),
            ),

            //night mode
            Divider(
              height: 1.0,
              color: Colors.grey,
            ),
            ListTile(
              title: Text('Night Mode'),
              onTap: () {
                print('Night mode button pressed');
              },
              trailing: Switch(
                value: widget.darkThemeEnabled,
                onChanged: bloc.changeTheme,
              ),
              //Transform.scale(
              //   scale: .5,
              //   child: IconButton(
              //     icon: SvgPicture.asset('icons/arrow.svg'),
              //     onPressed: () {
              //       print('icon button pressed');
              //     },
              //   ),
              // ),
              contentPadding: EdgeInsets.only(left: 28.0),
            ),

            //Load Verse images
            Divider(
              height: 1.0,
              color: Colors.grey,
            ),
            // ListTile(
            //   title:
            //       //Text(experimentList[index].body) ,
            //       Text('Load Verse Images'),
            //   onTap: null,
            //   trailing: Transform.scale(
            //     scale: .5,
            //     child: IconButton(
            //       icon: SvgPicture.asset('icons/dot.svg'),
            //       onPressed: () {
            //         print('icon button pressed');
            //         // Navigator.push(
            //         //   context,
            //         //   MaterialPageRoute(builder: (context) => TimeScreen()),
            //         // );
            //       },
            //     ),
            //   ),
            //   contentPadding: EdgeInsets.only(left: 28.0),
            // ),
            //Help
            Divider(
              height: 1.0,
              color: Colors.grey,
            ),
            Container(
              height: 30.0,
              padding: EdgeInsets.only(left: 28.0, top: 2.0, bottom: 2.0),
              color: Colors.grey[300],
              child: Row(
                children: [
                  Text(
                    'HELP',
                    style: TextStyle(fontSize: 10.0),
                  ),
                  Transform.scale(
                    scale: 1.5,
                    child: IconButton(
                        icon: SvgPicture.asset('icons/info.svg'),
                        color: Colors.grey[200],
                        onPressed: () {} //do something,
                        ),
                  ),
                ],
              ),
            ),
            //feedback
            Divider(
              height: 1.0,
              color: Colors.grey,
            ),
            ListTile(
              title: Text('FeedBack'),
              onTap: () {
                print('FeedBack button pressed');
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FeedBack(),
                ));
              },
              trailing: Transform.scale(
                scale: .5,
                child: IconButton(
                  icon: SvgPicture.asset('icons/arrow.svg'),
                  onPressed: () {
                    print('icon button pressed');
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FeedBack(),
                    ));
                  },
                ),
              ),
              contentPadding: EdgeInsets.only(left: 28.0),
            ),
//FAQ
            Divider(
              height: 1.0,
              color: Colors.grey,
            ),
            ListTile(
              title: Text('Frequently Asked Questions'),
              onTap: () {
                print('FAQ button pressed');
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Faq(),
                ));
              },
              trailing: Transform.scale(
                scale: .5,
                child: IconButton(
                  icon: SvgPicture.asset('icons/arrow.svg'),
                  onPressed: () {
                    print('icon button pressed');
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Faq(),
                    ));
                  },
                ),
              ),
              contentPadding: EdgeInsets.only(left: 28.0),
            ),

            //Rate
            Divider(
              height: 1.0,
              color: Colors.grey,
            ),
            ListTile(
              title: Text('Rate Daily Bread'),
              onTap: () {
                print('Rate button pressed');
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Rate(),
                ));
              },
              trailing: Transform.scale(
                scale: .5,
                child: IconButton(
                  icon: SvgPicture.asset('icons/arrow.svg'),
                  onPressed: () {
                    print('icon button pressed');
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Rate(),
                    ));
                  },
                ),
              ),
              contentPadding: EdgeInsets.only(left: 28.0),
            ),

            //Share Daily bread
            Divider(
              height: 1.0,
              color: Colors.grey,
            ),
            ListTile(
              title: Text('Share Daily Bread'),
              onTap: () {
                print('Share Daily pressed');
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Share(),
                ));
              },
              trailing: Transform.scale(
                scale: .5,
                child: IconButton(
                  icon: SvgPicture.asset('icons/arrow.svg'),
                  onPressed: () {
                    print('icon button pressed');
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Share(),
                    ));
                  },
                ),
              ),
              contentPadding: EdgeInsets.only(left: 28.0),
            ),
            //About us
            Divider(
              height: 1.0,
              color: Colors.grey,
            ),
            ListTile(
              title: Text('About Us'),
              onTap: () {
                print('About us clicked');
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => About(),
                ));
              },
              trailing: Transform.scale(
                scale: .5,
                child: IconButton(
                  icon: SvgPicture.asset('icons/arrow.svg'),
                  onPressed: () {
                    print('icon button pressed');
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => About(),
                    ));
                  },
                ),
              ),
              contentPadding: EdgeInsets.only(left: 28.0),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey,
            ),
          ],
        ),
      ),
      body: experimentList.length == 0
          ? NoConnection()
          : new ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: experimentList.length,
              itemBuilder: (_, index) {
                return experimentList.length == 0
                    ? NoConnection()
                    : ExperimentUI(experimentList[index].body,
                        experimentList[index].verse);
              }),
    );
  }

  Future notificationSelected(String payload) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Thought Of The Day$payload"),
      ),
    );
  }

//new    card widget return inside
  Widget ExperimentUI(String verse, String body) {
    return new Container(
      margin: EdgeInsets.only(left: 8.0, right: 6.0, top: 4.0),
      padding: EdgeInsets.only(left: 8.0, right: 6.0, top: 4.0),
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(width: .5, color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                verse,
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16.0),
              )),
          SizedBox(height: 18.0),
          Text(
            'THOUGHTS ON TODAY\'S VERSE',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 18.0,
              color: Colors.blueGrey,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5.0,
          ),
          Divider(height: 0.5, color: Colors.grey),
          SizedBox(height: 10.0),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              body,
              style: TextStyle(fontSize: 15.0),
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 63,
            ),
          )
        ],
      ),
    );
  }

//new card widget return inside

}

class NoConnection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Check Your Network Connectivity")),
    );
  }
}

class Bloc {
  final _themeController = StreamController<bool>();

  get changeTheme => _themeController.sink.add;

  get darkThemeEnabled => _themeController.stream;
}

final bloc = Bloc();

//language data display return

// After the Selection Screen returns a result, hide any previous snackbars
// and show the new result.

//calender
