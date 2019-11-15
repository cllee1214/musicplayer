import 'package:flutter/material.dart';

class RecommendList extends StatelessWidget {
  const RecommendList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.red,
              child:  Text('推荐歌单',textAlign: TextAlign.left,),
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
                children: <Widget>[
                  PlayListItem(),
                  PlayListItem(),
                   PlayListItem(),

                    PlayListItem(),
                     PlayListItem(),
                      PlayListItem()
              ],
            ),
            )
          ],
          
        ),
    );
  }
}

//349368004

class PlayListItem extends StatefulWidget {
  PlayListItem({Key key}) : super(key: key);

  _PlayListItemState createState() => _PlayListItemState();
}

class _PlayListItemState extends State<PlayListItem> {
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
                Text('那些好听到发疯的粤语歌', style: TextStyle(fontSize: 12))
              ],
            ),
      );
  }
}