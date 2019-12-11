import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../../widgets/loading.dart';
import './playListDetail.dart';

import '../../config/index.dart';

class RecommendList extends StatefulWidget {
  RecommendList({Key key}) : super(key: key);

  _RecommendListState createState() => _RecommendListState();
}

class _RecommendListState extends State<RecommendList> {

  List recommendListData;
  bool hasLoad = false; 

  getData () async{
    Dio dio = Dio();
    var host = Config().resolveHost();
    print(host);
    var res = await dio.get(host + '/personalized?limit=6');
    if(res.data['code'] == 200){
       recommendListData = res.data['result'];
      //  print(recommendListData);
      setState(() {
        hasLoad = true;
      });
    }else{
      hasLoad = false;
      print('get banner error...');
    }
  }

  @override
  void initState() {   
    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
            child: hasLoad ? Column(
              children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.red,
                        child:  Text('推荐歌单',textAlign: TextAlign.left),
                      ),
                      SizedBox(
                        height: 360,
                        // color: Colors.grey,
                        child: GridView.count(
                          crossAxisCount: 3,
                          crossAxisSpacing: 5,
                          // mainAxisSpacing: 3,
                          childAspectRatio: 0.7,
                          physics: new NeverScrollableScrollPhysics(),
                          children: recommendListData.map((data) => PlayListItem(imageUrl: data['picUrl'], name: data['name'], id: data['id'])).toList()
                      ),
                      )
                    ],
            ): Loading(),
    );
  }
}


class PlayListItem extends StatefulWidget {
  String imageUrl;
  String name;
  int id;
  PlayListItem({Key key, @required this.imageUrl, @required this.name, @required this.id}) : super(key: key);

  _PlayListItemState createState() => _PlayListItemState();
}

class _PlayListItemState extends State<PlayListItem> {

  @override
  void initState() { 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,  MaterialPageRoute(builder: (content) => PlayListDetail(id: widget.id)));
                },
                child: Column(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              child:  Image.network(widget.imageUrl),
                            )
                          ),
                          Text(widget.name,overflow: TextOverflow.ellipsis, maxLines: 2, style: TextStyle(fontSize: 12))
                        ],
                        ) ,
            ),
      
      );
  }
}