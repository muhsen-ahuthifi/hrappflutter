import 'package:flutter/foundation.dart';
import '../model/user.dart';

class UserProvider with ChangeNotifier {
  User _user = new User();

  User get user => _user;

void setUserSession(User user) {
    _user = user;
  }
  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
    String? removeUser() {
      final empId=_user.emp;
    _user = new User();
    notifyListeners();
    return empId;
  }
}