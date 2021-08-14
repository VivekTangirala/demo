import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  static Map<String, dynamic> _apidata = {};
  //This is the function to get the details from the api
  Future _getApiDetails() async {
    var response =
        await http.get(Uri.parse(("https://www.boredapi.com/api/activity")));
    var jsonData = jsonDecode(response.body);
    _apidata = jsonData;
    return _apidata;
  }

  @override
  void initState() {
    _getApiDetails(); //calling this function everytime this page is built.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          FutureBuilder(
            future: _getApiDetails(),
            builder: (context, snapShot) {
              if (snapShot.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListTile(
                  title: Text(_apidata['activity'].toString()),
                  subtitle: Text(_apidata['participants'].toString()),
                  leading: Text(_apidata['participants'].toString()),
                );
              }
            },
          ),
          IconButton(
            onPressed: () {
             setState(() {
                _getApiDetails();
             });
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
