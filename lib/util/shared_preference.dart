import '../model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class UserPreferences {
  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("emp", user.emp);
    prefs.setString("name", user.name);
  //  prefs.setString("email", user.email);
  //  prefs.setString("phone", user.phone);
   // prefs.setString("type", user.type);
    prefs.setString("access_token", user.token);
    //prefs.setString("renewalToken", user.renewalToken);

    print("object prefere");
   // print(user.renewalToken);

    return prefs.commit();
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String emp = prefs.getString("emp");
    String name = prefs.getString("name");
  //  String email = prefs.getString("email");
    //String phone = prefs.getString("phone");
  //  String type = prefs.getString("type");
    String token = prefs.getString("access_token");
   // String renewalToken = prefs.getString("renewalToken");

    return User(
        emp: emp,
        name: name,
       // email: email,
      //  phone: phone,
       // type: type,
        token: token);
       // renewalToken: renewalToken);
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("emp");
    prefs.remove("name");
   // prefs.remove("phone");
  //  prefs.remove("type");
    prefs.remove("access_token");
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("access_token");
    return token;
  }
}