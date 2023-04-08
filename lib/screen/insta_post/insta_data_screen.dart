import 'package:flutter/material.dart';
import 'package:stories_editor/stories_editor.dart';

class InstaData extends StatefulWidget {
  const InstaData({Key? key}) : super(key: key);

  @override
  State<InstaData> createState() => _InstaDataState();
}

class _InstaDataState extends State<InstaData> {
  List<Color> colorlist = [
    Colors.black,
    Colors.white,
    Colors.red,
    Colors.pink,
    Colors.pinkAccent,
    Colors.teal,
    Colors.green,
    Colors.grey,
    Colors.amber,
    Colors.blue,
    Colors.purple,
    Colors.lightGreenAccent,
    Colors.orange,
    Colors.cyanAccent,
    Colors.lime,
    Colors.indigo,
    Colors.yellowAccent
  ];
  List<List<Color>> grediantcolorlist=[
    [Colors.pink,Colors.deepPurple],
    [Colors.blue,Colors.amber],
    [Colors.white,Colors.grey],
    [Colors.deepPurple,Colors.blue],
    [Colors.black,Colors.teal],
    [Colors.red,Colors.pinkAccent],
    [Colors.lime,Colors.lightGreen],
    [Colors.indigo,Colors.purple],
    [Colors.grey,Colors.black],
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StoriesEditor(
          giphyKey: 'C4dMA7Q19nqEGdpfj82T8ssbOeZIylD4',
          onDone: (p0) {},
          colorList: colorlist,
          gradientColors: grediantcolorlist,
        ),
      ),
    );
  }
}
