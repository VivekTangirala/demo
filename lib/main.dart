import 'package:flutter/material.dart';

import 'Apidata/Apidata.dart';
import 'Apidata/apidataimport.dart';

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
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Aipdata _aipdata = new Aipdata();
  _getData() async {
    await Apidataimport.getdetails().then((value) => setState(() {
          _aipdata = value;
        }));
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          // ignore: unnecessary_null_comparison
          child: _aipdata.activity == ""
              ? CircularProgressIndicator()
              : Text(_aipdata.activity),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
