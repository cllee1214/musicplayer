import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../config/index.dart';
import '../utils/store.dart';
import '../home/frame.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var loginKey = GlobalKey<FormState>();

  String username;

  String password;

  Future login () async {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return Frame();
    }));
    // Dio dio = Dio();
    // // 10.0.2.2
    // // 10.0.0.2
    // // 192.168.18.2
    // Response res = await dio.get('http://192.168.18.2:4000/login/cellphone?phone=18782922762&password=cai199062');
    // // print(res.data.toString());
    // if(res.data['code'] == 200){
    //   print('登录成功');
    //   storeLoginInfo('loginInfo', res.data.toString());
    // }else{
    //    showDialog(
    //     context: context,
    //     builder: (cxt) {
    //       return SimpleDialog(
    //         // title: Text('xxxxx'),
    //         children: <Widget>[
    //           Container(
    //             padding: EdgeInsets.only(left: 15,right: 15),
    //             child:  Text(res.data['msg']),
    //           )
    //         ],
    //       );
    //     }
    //   );
    // }
  }

  submit () {
    //校验表单
    if(loginKey.currentState.validate()) {
      loginKey.currentState.save();
      login();
    } else {

    }
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.only(top: 150,left: 15,right: 15),
        width: double.infinity,
        height: double.infinity,
        color: Colors.white10,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Text('欢迎回来！', textAlign: TextAlign.left, style: TextStyle(color: Colors.black,fontSize: 26,fontWeight: FontWeight.bold)),
            ),
            Container(
               width: double.infinity,
               child: Text('用flutter撸的音乐播放器', style: TextStyle(fontSize: 12,color: Colors.grey))
            ),
            Form(
              key: loginKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '请输入用户名',
                      prefixIcon: Icon(Icons.person)
                    ),
                    validator: (value) {
                      //todo 校验格式 如邮箱等
                      return value.trim().length == 0 ? '用户名不能为空' : null;
                    },
                    onSaved: (value){
                      username = value;
                    },      
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: '请输入密码',
                      prefixIcon: Icon(Icons.lock)
                    ),
                    validator: (value) {
                      return value.trim().length == 0 ? '密码不能为空' : null;
                    },
                    onSaved: (value){
                      password = value;
                    },            
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 50),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child:  RaisedButton(
                      child: Text('登            录', style: TextStyle(color: Colors.white)),
                      color: Colors.redAccent,
                      onPressed: () {
                        submit();
                      },
                    ),
                  ),
                ],
              )
            )    
          ],
        )
      );
  }
}

