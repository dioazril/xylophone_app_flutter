import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabsNote(),
    );
  }
}

class TabsNote extends StatefulWidget {
  const TabsNote({Key? key}) : super(key: key);

  @override
  State<TabsNote> createState() => _TabsNoteState();
}

class _TabsNoteState extends State<TabsNote> {
  void soundTab(number) {
    final player = AudioPlayer();
    player.play(AssetSource('note$number.wav'));
  }

  Widget keyTabs(MaterialColor color, int note) {
    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(color),
        ),
        onPressed: () {
          soundTab(note);
        },
        child: Text('Note $note'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            keyTabs(Colors.red, 1),
            keyTabs(Colors.orange, 2),
            keyTabs(Colors.yellow, 3),
            keyTabs(Colors.green, 4),
            keyTabs(Colors.teal, 5),
            keyTabs(Colors.blue, 6),
            keyTabs(Colors.purple, 7),
          ],
        ),
      ),
    );
  }
}
