import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage(title: 'Flutter Demo Home Page'));
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: color,
          size: 30,
        ),
        Text(label, style: TextStyle(color: color, fontSize: 25))
      ],
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
  @override
  Widget build(BuildContext context) {
    var titleSection = Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(padding: EdgeInsets.all(20.0)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Oeschinen Lake Campground",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Text("Kandersteg, Switzerland",
                style: TextStyle(color: Colors.grey, fontSize: 20)),
          ],
        ),
        Padding(padding: EdgeInsets.all(50.0)),
        Icon(Icons.star, size: 25, color: Colors.red),
        Text(
          '41',
          style: TextStyle(fontSize: 20),
        )
      ],
    );

    var buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(children: <Widget>[
          Icon(Icons.call, size: 30, color: Colors.lightBlue),
          Text('Call', style: TextStyle(color: Colors.lightBlue))
        ]),
        Padding(padding: EdgeInsets.all(25.0)),
        Column(children: <Widget>[
          Icon(Icons.near_me, size: 30, color: Colors.lightBlue),
          Text('ROUTE', style: TextStyle(color: Colors.lightBlue)),
        ]),
        Padding(padding: EdgeInsets.all(30.0)),
        Column(children: <Widget>[
          Icon(Icons.share, size: 30, color: Colors.lightBlue),
          Text('SHARE', style: TextStyle(color: Colors.lightBlue))
        ]),
      ],
    );

    var textSection = Container(
        child: Text(
            'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
            style: TextStyle(fontSize: 18)),
        padding: EdgeInsets.all(40.0));

    return Scaffold(
      body: Column(
        children: <Widget>[
          Image.network(
              "https://i1.wp.com/blog.signifykorea.com/wp-content/uploads/2020/02/%EC%BA%A0%ED%95%91.jpg?fit=1400%2C933&ssl=1",
              height: 400,
              width: 600,
              fit: BoxFit.cover),
          // Padding(padding: EdgeInsets.all(10.0)),
          titleSection,
          // Padding(padding: EdgeInsets.all(10.0)),
          buttonSection,
          // Padding(padding: EdgeInsets.all(10.0)),
          textSection,
        ],
      ),
    );
  }
}
