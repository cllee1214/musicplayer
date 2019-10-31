import 'package:shared_preferences/shared_preferences.dart';
// SharedPreferences.setMockInitialValues([]);
void storeLoginInfo(key, value) async {
  SharedPreferences.setMockInitialValues({});
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}
