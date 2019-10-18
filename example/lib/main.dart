import 'package:expandable_tabs/expandable_tabs_lib.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expandable Tabs Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text('Expandable Tabs Demo')),
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ExpandableTabs(
          tabs: _buildList(),
          screenWidth: MediaQuery.of(context).size.width,
          animatedHeight: 30.0,
          generalHeight: 80.0,
        ),
      ),
    );
  }

  List<Map<String, dynamic>> _buildList() {
    var _keyOne = GlobalKey<ExpandableTabItemState>();
    var _keyTwo = GlobalKey<ExpandableTabItemState>();
    var _keyThree = GlobalKey<ExpandableTabItemState>();
    var _keyFour = GlobalKey<ExpandableTabItemState>();
    return [
      {
        "tab": ExpandableTabItem(
          key: _keyOne,
          iconPath: "assets/icons/schoolIcon.png",
          text: "School",
          color: Colors.blue,
          textColor: Colors.white,
          isOpen: true,
          animatedHeight: 30.0,
          generalHeight: 80.0,
          callback: () => print("Location"),
        ),
        "key": _keyOne,
      },
      {
        "tab": ExpandableTabItem(
          key: _keyTwo,
          iconPath: "assets/icons/medicalIcon.png",
          text: "Medical",
          color: Colors.red,
          textColor: Colors.white,
          isOpen: false,
          animatedHeight: 30.0,
          generalHeight: 80.0,
          callback: () => print("Medical"),
        ),
        "key": _keyTwo,
      },
      {
        "tab": ExpandableTabItem(
          key: _keyThree,
          iconPath: "assets/icons/teamIcon.png",
          text: "Team",
          color: Colors.orange,
          textColor: Colors.white,
          isOpen: false,
          animatedHeight: 30.0,
          generalHeight: 80.0,
          callback: () => print("Team"),
        ),
        "key": _keyThree,
      },
      {
        "tab": ExpandableTabItem(
          key: _keyFour,
          iconPath: "assets/icons/generalIcon.png",
          text: "General",
          color: Colors.green,
          textColor: Colors.white,
          isOpen: false,
          animatedHeight: 30.0,
          generalHeight: 80.0,
          callback: () => print("General"),
        ),
        "key": _keyFour,
      },
    ];
  }
}
