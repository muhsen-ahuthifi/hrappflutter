class User {
 final String? emp;
 final String? name;
 // String email;
 // String phone;
 // String type;
 final String? token;
  //String renewalToken;

final bool isHrAdmin;
  User({this.emp, this.name, this.token, this.isHrAdmin=false});

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
        emp: responseData['emp'],
        name: responseData['name'],
        token: responseData['access_token'],
      isHrAdmin: responseData['hrad']=="1"

    );
  }
}