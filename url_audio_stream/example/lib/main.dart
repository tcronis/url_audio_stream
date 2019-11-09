import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:url_audio_stream/url_audio_stream.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    // initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  // Future<void> initPlatformState() async {
    
  // }


  static AudioStream stream = new AudioStream("http://streaming.siue.edu:8000/wsie");
  Future<void> callAudio(String action) async{
    if(action == "start"){
      stream.start();
    }else if(action == "stop"){
      stream.stop();
    }else if(action == "pause"){
      stream.pause();
    }else{
      stream.resume();
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              new RaisedButton(
                child: new Text("Start"),
                onPressed: (){
                  callAudio("start");
                },
              ),
              new RaisedButton(
                child: new Text("Stio"),
                onPressed: (){
                  callAudio("stop");
                },
              ),
              new RaisedButton(
                child: new Text("Pause"),
                onPressed: (){
                  callAudio("pause");
                },
              ),
              new RaisedButton(
                child: new Text("Resume"),
                onPressed: (){
                  callAudio("resume");
                },
              )
            ],
          )
        ),
      ),
    );
  }
}
