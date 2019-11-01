import 'package:flutter/material.dart';
import '../utils/store.dart';
import '../login/login.dart';
import './frame.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var hasLogin = false;
  @override
  void initState() {
    // print('===============');
    // var info = getLoginInfo('loginInfo');
    // info.then((value){
    //   print(value);
    // });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       child: hasLogin ? Frame() :LoginPage(),
    );
  }
}