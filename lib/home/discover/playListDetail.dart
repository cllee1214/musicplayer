import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart' as prefix0;

class PlayListDetail extends StatefulWidget {
  int id;
  PlayListDetail({Key key, this.id}) : super(key: key);

  @override
  _PlayListDetailState createState() => _PlayListDetailState();
}

class _PlayListDetailState extends State<PlayListDetail> {
  Map playList;
  bool hasLoad = false;
  getData() async{
    Dio dio = Dio();
    var res = await dio.get('http://192.168.18.2:3000/playlist/detail?id=' + widget.id.toString());
    if(res.data['code'] == 200){
       playList = res.data['playlist'];
      setState(() {
        hasLoad = true;
      });
    }else{
      hasLoad = false;
      print('error...');
    }
  }

  @override
  void initState() {
    
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
               decoration: BoxDecoration(
                  image: DecorationImage(
                    image: hasLoad ? NetworkImage(playList['coverImgUrl']) : AssetImage('images/icon_play.png') ,
                    fit: BoxFit.cover
                  )
                ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.white.withAlpha(0),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top:15),
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top:15,left: 15),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset('images/icon_back.png',width: 20,height: 20,),
                        ),
                        Expanded(
                          child: Text(playList['name'], textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          child: Image(
                            image: hasLoad ? NetworkImage(playList['coverImgUrl']) : AssetImage('images/icon_play.png') ,
                            width: 100,
                            height: 100,
                          )
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          width: MediaQuery.of(context).size.width - 150,
                          height: 100,
                          child: Column(
                            children: <Widget>[
                              Text(playList['name'], style: TextStyle(color: Colors.white),textAlign: TextAlign.left,),
                              Text(playList['description'],style: TextStyle(color: Colors.white70,fontSize: 12),maxLines: 3, overflow: TextOverflow.ellipsis,)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  
                  Container(
                    height: 20,
                  ),
                  //歌曲列表
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top:15,left: 15,right: 15),
                            child: Row(
                              children: <Widget>[
                                GestureDetector(
                                  child: Image.asset('images/icon_play.png',height: 15,width: 15),
                                ),
                                Text(' 播放全部'),
                                Container(width: 15,),
                                Text(' (共'+ playList['tracks'].length.toString() +'首歌)', style: TextStyle(fontSize: 10, color: Colors.grey))
                              ],
                            )
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15,right: 15),
                            child: Column(
                              children: playList['tracks'].asMap().keys.map<Widget>((key) => Container(
                                padding: EdgeInsets.only(top: 10),
                                child: Row(
                                  children: <Widget>[
                                    Text(key.toString(), style: TextStyle(color: Colors.grey),),
                                    Expanded(
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.only(left: 20),
                                            width: MediaQuery.of(context).size.width,
                                            child: Text(playList['tracks'].asMap()[key]['name'],textAlign: TextAlign.start,),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(left: 20),
                                            width: MediaQuery.of(context).size.width,
                                            child: Text(playList['tracks'].asMap()[key]['ar'][0]['name'] + ' - ' + playList['tracks'].asMap()[key]['al']['name'],style: TextStyle(color: Colors.grey,fontSize: 10)),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: GestureDetector(
                                        child: Image.asset('images/icon_play_grey.png', width: 20,height: 20,),
                                      ),
                                    )
                                  ],
                                ),
                              )).toList(),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              )
            )
          ],
        )
      ),
    );
  }
}



