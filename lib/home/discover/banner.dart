import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:dio/dio.dart';

import '../../widgets/loading.dart';
import '../../config/index.dart';

class HeadBanner extends StatefulWidget {
  HeadBanner({Key key}) : super(key: key);

  _HeadBannerState createState() => _HeadBannerState();
}

class _HeadBannerState extends State<HeadBanner> {

  List bannerData;
  int banerCount = 0;

  @override
  void initState() {
    getBannerData();
    super.initState();
  }

  getBannerData () async{
    Dio dio = Dio();
    var res = await dio.get(Config().resolveHost() + '/banner?type=1');
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
  Widget build(BuildContext context) {
    return Container(
       child: banerCount == 0 ? 
           Loading() 
           : 
           Container(
              padding: EdgeInsets.only(top:25),
              height: 200,
              child: Swiper(
                autoplay: true,
                // itemCount: 3,
                itemCount: banerCount,
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      bannerData[index]['pic'],
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
          ),
    );
  }
}