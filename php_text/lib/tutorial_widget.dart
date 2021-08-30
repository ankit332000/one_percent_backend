import 'package:flutter/material.dart';
import 'package:php_text/http_connection.dart';

class Tutorial extends StatefulWidget {
  const Tutorial({Key? key}) : super(key: key);

  @override
  _TutorialState createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  final data = HTTPConnection.getMethod();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("OnePercent"),
          ),
          body:
              // FutureBuilder(builder: (BuildContext,)

              Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'Heading',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Body'),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Previous'),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Next'),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
