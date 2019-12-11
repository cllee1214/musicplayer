import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../../widgets/loading.dart';
import '../../config/index.dart';

class NewAlbum extends StatefulWidget {
  NewAlbum({Key key}) : super(key: key);

  _NewAlbumState createState() => _NewAlbumState();
}

class _NewAlbumState extends State<NewAlbum> {

    bool hasLoad = false;
    List newAlbumListData;

    getData () async{
    Dio dio = Dio();
    var res = await dio.get(Config().resolveHost() + '/top/album?offset=0&limit=6');
    if(res.data['code'] == 200){
       newAlbumListData = res.data['albums'];
      setState(() {
        hasLoad = true;
      });
    }else{
      hasLoad = false;
      print('get error...');
    }
  }

  @override
  void initState() { 
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return hasLoad ? Container(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.red,
              child:  Text('新碟上架',textAlign: TextAlign.left,),
            ),
            SizedBox(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                childAspectRatio: 0.6,
                physics: new NeverScrollableScrollPhysics(),
                children: newAlbumListData.map((album) => AlbumItem(imageUrl: album['picUrl'],name: album['name'],singger: album['artist']['name'])).toList()
              ),
            )
          ],
        ),
      ),
    ) : Loading();
  }
}


class AlbumItem extends StatelessWidget {
  const AlbumItem({Key key, @required this.name, @required this.singger, @required this.imageUrl}) : super(key: key);
  final String name;
  final String singger;
  final imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    child:  Image.network(imageUrl),
                  )
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(name, textAlign: TextAlign.left, style: TextStyle(fontSize: 12)),
                ),
                 Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(singger, textAlign: TextAlign.left, style: TextStyle(fontSize: 12,color: Colors.grey))
                ),     
              ],
            ),
    );
  }
}