import 'package:flutter/material.dart';

class NewAlbum extends StatelessWidget {
  const NewAlbum({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                children: <Widget>[
                  AlbumItem(),
                  AlbumItem(),
                  AlbumItem()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


class AlbumItem extends StatelessWidget {
  const AlbumItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    child:  Image.network('http://p1.music.126.net/i0qi6mibX8gq2SaLF1bYbA==/2002210674180198.jpg'),
                  )
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text('叶惠美', textAlign: TextAlign.left, style: TextStyle(fontSize: 12)),
                ),
                 Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text('周杰伦', textAlign: TextAlign.left, style: TextStyle(fontSize: 12,color: Colors.grey))
                ),     
              ],
            ),
    );
  }
}