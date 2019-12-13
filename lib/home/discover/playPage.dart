import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer/events/event_bus.dart';

class PlayPage extends StatefulWidget {
  PlayPage({Key key}) : super(key: key);

  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                children: <Widget>[
                   GestureDetector(
                      onTap: () {
                        eventBus.fire(PopEvent(-1000, 'page'));
                      },
                      child: Image.asset('images/icon_back.png',width: 20,height: 20,),
                    ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}