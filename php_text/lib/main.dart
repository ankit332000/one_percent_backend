import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:php_text/tutorial_widget.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PHP Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Tutorial(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  getMethod() async {
    String url = "http://192.168.1.104/android/php_text/lib/get.php";
    var res = await http.get(Uri.parse(Uri.decodeFull(url)),
        headers: {"Accept": "application/json"});
    var responseBody = json.decode(res.body);
    return responseBody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: getMethod(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          List? snap = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error Fetching data : ${snapshot.error}"),
            );
          }
          return ListView.builder(
            itemCount: snap!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("${snap[index]['heading']}"),
                subtitle: Text(
                    "${snap[index]['body']}\n ${snap[index]['prev']}\n ${snap[index]['next']}."),
              );
            },
          );
        },
      ),
    );
  }
}
