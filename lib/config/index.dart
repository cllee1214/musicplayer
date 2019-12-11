
class Config {

  // 用于调试  是否是真机
  bool isReal = true; 

  //
  String resolveHost () {
    String host = isReal ? 'http://192.168.3.34:3000' : 'http://192.168.18.2:3000' ;
    return host;
  }
}