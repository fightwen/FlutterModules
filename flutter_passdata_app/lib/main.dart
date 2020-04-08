import 'package:flutter/material.dart';

import 'b_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text="尚未接收資料";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                text
            ),
            RaisedButton(onPressed: onPressToNextScreen,child: Text("點我進 B 畫面"),)
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  void onPressToNextScreen() async{
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BScreen(value:"我是從 A 傳來的資料!"),
      ),
    );
    //從 B 畫面回傳後更新畫面資料
    setState(() {
      if(result!=null){
        text = result;
      }
    });
  }
}
