import 'package:flutter/material.dart';
import 'package:overflow_view/overflow_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tree View Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Tree View Example"),
        ),
        body: Container(
            height: double.infinity,
            // color: Colors.yellowAccent[100],
            child: OverflowView(
              // Either layout the children horizontally (the default)
              // or vertically.
              direction: Axis.horizontal,
              // The amount of space between children.
              spacing: 4,
              // The widgets to display until there is not enough space.
              children: <Widget>[
                for (int i = 0; i < 10; i++)
                  AvatarWidget(
                    text: avatars[i].initials,
                    color: avatars[i].color,
                  )
              ],
              // The overview indicator showed if there is not enough space for
              // all chidren.
              builder: (context, remaining) {
                // You can return any widget here.
                // You can either show a +n widget or a more complex widget
                // which can show a thumbnail of not rendered widgets.
                return AvatarWidget(
                  text: '+$remaining',
                  color: Colors.red,
                );
              },
            )),
      ),
    );
  }
}

class Avatar {
  const Avatar(this.initials, this.color);
  final String initials;
  final Color color;
}

const List<Avatar> avatars = <Avatar>[
  Avatar('AD', Colors.green),
  Avatar('JG', Colors.pink),
  Avatar('DA', Colors.blue),
  Avatar('JA', Colors.black),
  Avatar('CB', Colors.amber),
  Avatar('RR', Colors.deepPurple),
  Avatar('JD', Colors.pink),
  Avatar('MB', Colors.amberAccent),
  Avatar('AA', Colors.blueAccent),
  Avatar('BA', Colors.tealAccent),
  Avatar('CR', Colors.yellow),
];

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    Key?  key,
    required this.text,
    required this.color,
  }) : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundColor: color,
      foregroundColor: Colors.white,
      child: Text(
        text,
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}