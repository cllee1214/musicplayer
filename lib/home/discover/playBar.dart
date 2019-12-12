import 'package:flutter/material.dart';
import '../../events/event_bus.dart';
import 'package:dio/dio.dart';
import 'package:audioplayers/audioplayers.dart';

class PlayBar extends StatefulWidget {
  PlayBar({Key key}) : super(key: key);

  @override
  _PlayBarState createState() => _PlayBarState();
}

class _PlayBarState extends State<PlayBar> {
  String url;
  String name;
  double position = -110;

  play (id) async {
    
    Dio dio = Dio();
    var res = await dio.get('http://192.168.18.2:3000/song/url?id=' + id.toString());
    print(res.data);
    if(res.data['code'] == 200){
      String songUrl = res.data['data'][0]['url'];
      print(songUrl);
      AudioPlayer audioPlayer = AudioPlayer();
      var pid = await audioPlayer.play(songUrl);
      if(pid == 1){
        print('播放成功');
      }else{
        print('播放失败');
      }

    }else{
      print('获取歌曲失败');
    }
  }

  @override
  void initState() {
    print('playbar init..');
    eventBus.on<PlayEvent>().listen((event) {
      print(event.id);
      print(event.url);
      setState(() {
        name = event.name;
        url = event.url;
      });
    });
    eventBus.on<PopEvent>().listen((e){
      print('postion is' + e.p.toString());
      setState(() {
        position = e.p;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Stack(
          children: <Widget>[
            Positioned(
              bottom: position,
              child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      child:  MaterialApp(
                                home: Scaffold(
                                  body: Container(
                                    height: MediaQuery.of(context).size.height,
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      children: <Widget>[
                                        Divider(
                                          color: Colors.grey,
                                          height: 1,
                                          indent: 0,
                                        ),
                                        Container(
                                            padding: EdgeInsets.only(top: 3,left: 10),
                                            child: Row(
                                              children: <Widget>[
                                                ClipRRect(
                                                  child: url != null ? Image.network(url, width: 32, height: 32) : Container(),
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(left: 5),
                                                  child: name == null ? Container(): Text(name),
                                                ),
                                                Container(
                                                  child: Stack(
                                                    children: <Widget>[
                                                      Image.asset('images/icon_play_inner.png',width: 10,height: 10,),
                                                      GestureDetector(
                                                        child: Container(
                                                          width: 20,
                                                          height: 20,
                                                          child: CircularProgressIndicator(
                                                          strokeWidth:1,
                                                          value: 0.5,
                                                          backgroundColor: Colors.red,
                                                          // valueColor: Colors.red,
                                                          ),
                                                        )
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                        )
                                      ],
                                    ),
                                    color: Colors.white,
                                  ),
                                )
                              ),
                    ),
            )
          ],
        );
  }
}