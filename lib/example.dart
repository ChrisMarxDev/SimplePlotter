import 'package:flutter/material.dart';
import 'package:simple_plotter/simple_plotter.dart';
import 'dart:math';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new ExamplePage(title: 'SimplePlotter'),
    );
  }
}


class ExamplePage extends StatefulWidget {
  ExamplePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  ExamplePageState createState() => new ExamplePageState();
}

class ExamplePageState extends State<ExamplePage> {

  List<double> randomData(int amount) {
    List ret = [];
    var rng = new Random();
    for (var i = 0; i < amount; i++) {
      ret.add(rng.nextInt(100) + 0.0);
    }
    return ret;
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),),
      body: new Center(
        child: new ListView(
          children: <Widget>[
            new AspectRatio(aspectRatio: 16.0 / 9.0, child: new LineGraph(
                data: randomData(20),
                color: Colors.deepOrange,
                strokeWidth: 2.0),),
            new AspectRatio(aspectRatio: 16.0 / 9.0, child: new LineGraph(
                data: randomData(40),
                color: Colors.blue,
                backgroundColor: Colors.green,
                strokeWidth: 1.0),),
            new AspectRatio(aspectRatio: 16.0 / 9.0, child: new BarGraph(
              data: randomData(10),
              barOffset: 5.0,),),
            new AspectRatio(aspectRatio: 16.0 / 9.0, child: new BarGraph(
              data: randomData(40),
              color: Colors.red,
              backgroundColor: Colors.lightBlue,),),
          ],
        ),
      ),
    );
  }
}


