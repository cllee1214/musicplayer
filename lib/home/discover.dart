import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:dio/dio.dart';
class DiscoverPage extends StatefulWidget {
  DiscoverPage({Key key}) : super(key: key);

  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {

  List bannerData;
  int banerCount = 0;

  getBannerData () async{
    Dio dio = Dio();
    var res = await dio.get('http://192.168.18.2:3000/banner?type=1');
    if(res.data['code'] == 200){
       bannerData = res.data['banners'];
      setState(() {
       banerCount =  res.data['banners'].length; 
      });
    }else{
      print('get banner error...');
    }
  }  

  @override
  void initState() {
    getBannerData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(top:25),
            height: 200,
            child: banerCount == 0 ? Text('') : Swiper(
              autoplay: true,
              // itemCount: 3,
              itemCount: banerCount,
              itemBuilder: (BuildContext context, int index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    bannerData[index]['pic'],
                    // "http://p1.music.126.net/VSByhksvRvcYdK3yhAeVhQ==/109951164460065826.jpg",
                    fit: BoxFit.fill,
                  )
                );
            },
            pagination: new SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                color: Colors.grey,
                activeColor: Colors.red,
              )
            ),
          ),
        )
      ],
    );
  }
}