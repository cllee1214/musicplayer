import 'package:flutter/material.dart';
import './discover/index.dart';
class Frame extends StatefulWidget {
  Frame({Key key}) : super(key: key);

  _FrameState createState() => _FrameState();
}

class _FrameState extends State<Frame> with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        body: Container(
          padding: EdgeInsets.only(top:15,left: 15,right: 15),
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            children: <Widget>[
             Container(
               padding: EdgeInsets.only(left:35,right:35,top:15),
               height: 40,
               child:  DefaultTabController(
                length: 3,
                child: TabBar(
                  controller: _tabController,
                  labelColor: Colors.black,
                  indicator: BoxDecoration(), // 去掉下划线
                  unselectedLabelStyle:TextStyle(
                    fontSize: 12
                  ),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                  tabs: <Widget>[
                    Text('发现'),
                    Text('我的'),
                    Text('动态'),
                  ],
                ),
              ),
             ),
             Expanded(
               flex: 1,
               child: TabBarView(
                 controller: _tabController,
                 children: <Widget>[
                  DiscoverPage(),
                   Text('1111'),
                   Text('1111')
                 ],
               ),
             )
            ],
          )
       ),
      )
    );
  }
}
