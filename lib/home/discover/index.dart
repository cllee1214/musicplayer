import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:dio/dio.dart';

import './banner.dart';
import './nav.dart';
import './recommend.dart';
import './newAlbum.dart';

class DiscoverPage extends StatefulWidget {
  DiscoverPage({Key key}) : super(key: key);

  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: <Widget>[

          // 头部导航
          Container(
            child: HeadBanner(),
          ),
  
          // 导航栏：每日推荐、歌单、排行、电台、直播
          Container(
            padding: EdgeInsets.only(top:10),
            height: 80,
            child: Nav()
          ),

          // 推荐歌单
          Container(
            child: RecommendList(),
          ),

          //新碟上架
          Container(
            child: NewAlbum(),
          )
          
        ],
      ),
    );
  }
}