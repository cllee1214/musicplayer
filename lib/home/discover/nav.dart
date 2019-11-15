import 'package:flutter/material.dart';

const List navConfig = [
  {
    'name': '每日推荐',
    'image': 'images/icon_daily.png'
  },

   {
    'name': '歌单',
    'image': 'images/icon_playlist.png'
  },

   {
    'name': '排行榜',
    'image': 'images/icon_rank.png'
  },
  
   {
    'name': '电台',
    'image': 'images/icon_radio.png'
  },

   {
    'name': '直播',
    'image': 'images/icon_look.png'
  },
];


class Nav extends StatelessWidget {
  const Nav({Key key}) : super(key: key);

List <Widget>  creat () {
    return navConfig.map((config) => (
      Column(
          children: <Widget>[
            ClipOval(
              child: Container(
                width: 40,
                height: 40,
                color: Colors.red,
                child: Image(
                  image: AssetImage(config['image']),
                  width: 20,
                  height: 20,
                ),
              ),
            ),
            Text(config['name'], style: TextStyle(fontSize: 12),)
          ],
        )
    )).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: creat()
      ),
    );
  }
}

