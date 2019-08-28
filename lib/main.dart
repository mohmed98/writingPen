import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void updatePos(Offset point) {
    setState(() {
      if (point == null) {
        topMargin = 0;
        leftMargin = 0;
      }
      topMargin = point.dx;
      leftMargin = point.dy;
    });
  }

  double topMargin = 50;
  double leftMargin = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onPanUpdate: (s) {
          Offset pos = (context.findRenderObject() as RenderBox)
              .globalToLocal(s.globalPosition);
          pos = pos.translate(-25, -25);
          updatePos(pos);
        },
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: leftMargin, left: topMargin),
              width: 50,
              height: 50,
              child: Image.asset('images/pen2.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}
