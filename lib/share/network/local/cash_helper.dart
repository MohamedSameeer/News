import 'package:shared_preferences/shared_preferences.dart';

class CashHelper{

  static SharedPreferences sharedPreferences;

  static init() async{
    sharedPreferences=await SharedPreferences.getInstance();
  }

  static Future<bool> setBool(
      {
        String key="isDark",
        dynamic value=true
      }) async{
    return await sharedPreferences.setBool(key, value);
  }

  static bool getData(String key){
    return sharedPreferences.getBool(key);
  }
}