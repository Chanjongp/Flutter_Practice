import 'package:flutter/material.dart';

void main() => runApp(MyApp2());

class MyApp2 extends StatefulWidget {
  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  bool _isStared = false;
  int _count = 40;

  @override
  Widget build(BuildContext context) {
    Widget titlesection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
          /*3*/
          IconButton(
            onPressed: pressedStar,
            icon: (_isStared ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Theme.of(context).primaryColor,
          ),
          Text('$_count')
        ],
      ),
    );
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(50),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
          // appBar: AppBar(title: Text('Flutter layout demo'), ),
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(30.0),
              child: AppBar(title: Text('Flutter layout demo'))),
          body: Column(children: [
            Image.network(
              "https://i1.wp.com/blog.signifykorea.com/wp-content/uploads/2020/02/%EC%BA%A0%ED%95%91.jpg?fit=1400%2C933&ssl=1",
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titlesection,
            buttonSection,
            textSection,
          ])),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(label,
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w400, color: color)))
      ],
    );
  }

  pressedStar() {
    setState(() {
      if (_isStared) {
        _isStared = !_isStared;
        _count--;
      } else {
        _isStared = !_isStared;
        _count++;
      }
    });
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Widget titlesection = Container(
//       padding: const EdgeInsets.all(32),
//       child: Row(
//         children: [
//           Expanded(
//             /*1*/
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 /*2*/
//                 Container(
//                   padding: const EdgeInsets.only(bottom: 8),
//                   child: Text(
//                     'Oeschinen Lake Campground',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Text(
//                   'Kandersteg, Switzerland',
//                   style: TextStyle(color: Colors.grey),
//                 )
//               ],
//             ),
//           ),
//           /*3*/
//           Icon(
//             Icons.star,
//             color: Colors.red,
//           ),
//           Text('41')
//         ],
//       ),
//     );
//     Color color = Theme.of(context).primaryColor;

//     Widget buttonSection = Container(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           _buildButtonColumn(color, Icons.call, 'CALL'),
//           _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
//           _buildButtonColumn(color, Icons.share, 'SHARE'),
//         ],
//       ),
//     );

//     Widget textSection = Container(
//       padding: const EdgeInsets.all(50),
//       child: Text(
//         'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
//         'Alps. Situated 1,578 meters above sea level, it is one of the '
//         'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
//         'half-hour walk through pastures and pine forest, leads you to the '
//         'lake, which warms to 20 degrees Celsius in the summer. Activities '
//         'enjoyed here include rowing, and riding the summer toboggan run.',
//         softWrap: true,
//       ),
//     );
//     return MaterialApp(
//       title: 'Flutter layout demo',
//       home: Scaffold(
//           // appBar: AppBar(title: Text('Flutter layout demo'), ),
//           appBar: PreferredSize(
//               preferredSize: Size.fromHeight(30.0),
//               child: AppBar(title: Text('Flutter layout demo'))),
//           body: Column(children: [
//             Image.network(
//               "https://i1.wp.com/blog.signifykorea.com/wp-content/uploads/2020/02/%EC%BA%A0%ED%95%91.jpg?fit=1400%2C933&ssl=1",
//               width: 600,
//               height: 240,
//               fit: BoxFit.cover,
//             ),
//             titlesection,
//             buttonSection,
//             textSection,
//           ])),
//     );
//   }

//   Column _buildButtonColumn(Color color, IconData icon, String label) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(icon, color: color),
//         Container(
//             margin: const EdgeInsets.only(top: 8),
//             child: Text(label,
//                 style: TextStyle(
//                     fontSize: 12, fontWeight: FontWeight.w400, color: color)))
//       ],
//     );
//   }
// }
