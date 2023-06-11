import '../model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'serializer.dart';

class UserPreferences {
static  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

  await  prefs.setString("emp", user.emp??"");
   await prefs.setString("name", user.name??"");
  //  prefs.setString("email", user.email);
  //  prefs.setString("phone", user.phone);
   // prefs.setString("type", user.type);
   await prefs.setString("access_token", user.token!);
    //prefs.setString("renewalToken", user.renewalToken);

   await prefs.setString("hrad", user.isHrAdmin?"1":"0");

   // print("object prefere");
   // print(user.renewalToken);

    return true;
  }

 static Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? emp = prefs.getString("emp");
    String? name = prefs.getString("name");
  //  String email = prefs.getString("email");
    //String phone = prefs.getString("phone");
  //  String type = prefs.getString("type");
    String? token = prefs.getString("access_token");
    String? isHrAdmin = prefs.getString("hrad");

    return User(
        emp: emp,
        name: name,
       // email: email,
      //  phone: phone,
       // type: type,
       isHrAdmin: isHrAdmin=="1",
        token: token);
       // renewalToken: renewalToken);
  }

  static void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
  await  prefs.remove("emp");
   await prefs.remove("name");
   // prefs.remove("phone");
  await prefs.remove("hrad");
  await  prefs.remove("access_token");

 await prefs.remove("notifications");

  }

  static Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("access_token");
    return token??"";
  }

    static Future<void> addNotification(NotificationModel row) async {
    List<NotificationModel> posList = await getNotificationList();
   
    posList.insert(0, row);
    await _updateNotificationList(posList);
  }
   static Future<void> _updateNotificationList(List<NotificationModel> nList) async {
    List<Map<String, String>> jsonObject = nList.take(50)
        .map((e) => {
              "title": e.title,
              "msg": e.msg,
              "date":e.date??""
            })
        .toList();

    String jsonString = await ngJson.encodeAsync(jsonObject);
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString("notifications",jsonString);

    return;
  }

  static Future<int> getNotificationCount() async {
    List<NotificationModel> nList = await getNotificationList();
    return nList.length;
  }

  static Future<List<NotificationModel>> getNotificationList() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? jsonPos =
        await prefs.getString("notifications");

    if (jsonPos != null) {
      List posJsonList = await ngJson.parseAsync(jsonPos);

      return posJsonList
          .map((row) => NotificationModel(
              title: row["title"],
              msg: row["msg"] ?? "",
              date:row["date"]??""
             ))
          .toList();
    }
    return List.from([]);
  }

}

class NotificationModel {
final String title;
final String msg;
final String? date;

  NotificationModel({required this.title,required this.msg,this.date});

}
