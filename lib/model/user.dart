class User {
  String emp;
  String name;
 // String email;
 // String phone;
 // String type;
  String token;
  //String renewalToken;

  User({this.emp, this.name, this.token});

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
        emp: responseData['emp'],
        name: responseData['name'],
        token: responseData['access_token']
        
    );
  }
}