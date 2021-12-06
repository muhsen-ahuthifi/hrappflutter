import 'package:flutter/material.dart';
import 'package:hrapp/ui/widget/AppTheme.dart';
import 'package:hrapp/ui/widget/commonWidget.dart';
import 'package:hrapp/util/app_route.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_login_signup/src/signup.dart';
import 'package:hrapp/model/user.dart';
import 'package:hrapp/providers/auth.dart';
import 'package:hrapp/providers/user_provider.dart';
import '../widget/formFields.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  String _username, _password;


Widget _logo(){
  return Image.asset('res/img/logo.png',alignment: Alignment.center,width: 200, excludeFromSemantics: true);
}
  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        entryField("البريد الالكتروني",(value) => _username = value,(value) => value.isEmpty ? "يرجى ادخال البريد الالكتروني" : null),
        entryField("كلمة المرور",(value) => _password = value,(value) => value.isEmpty ? "يرجى ادخال كلمة المرور" : null, isPassword: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
   AuthProvider auth = Provider.of<AuthProvider>(context);
    final height = MediaQuery.of(context).size.height;
    
    var doLogin = () {
      final form = formKey.currentState;

      if (form.validate()) {
        form.save();

        final Future<Map<String, dynamic>> successfulMessage = auth.login(_username, _password);
        successfulMessage.then((response) {
          if (response['status']) {
            User user = response['user'];
            Provider.of<UserProvider>(context, listen: false).setUser(user);
            Navigator.pushReplacementNamed(context, AppRouteUrl.apps);
          } else {
            smartErrorToast(context, "فشل تسجيل الدخول", response['message'].toString());
           
          }
        });
      } else {
        print("form is invalid");
      }
    };

    return Scaffold(
      backgroundColor: Colors.white,
        body: Container(
      height: height,
      child: Stack(
        children:[

          Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .1 ),
            child: SingleChildScrollView(
               child: Form(
               key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: height * .15),
                  _logo(),
                //  _title(),
                  SizedBox(height: 30),
                  _emailPasswordWidget(),
                  SizedBox(height: 20),
                    Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    alignment: Alignment.centerLeft,
                    
                    child:ExcludeSemantics(
                      child: Text('نسيت كلمة المرور ?', style: TextStyle( fontSize: 14, fontWeight: FontWeight.w500,fontFamily: SmartAppTheme.fontName)
                    ) ),
                  ),
                  SizedBox(height: 10),

                 auth.loggedInStatus == Status.Authenticating
                    ? smartLoadingButton(' ... يرجى الانتظار')
                    : smartSubmitButton(context,'تسجيل الدخول',doLogin),
                
                  SizedBox(height: height * .12),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    alignment: Alignment.center,
                    
                    child:ExcludeSemantics(
                      child: Text('جميع الحقوق محفوظة AOBWC', style: TextStyle( fontSize: 12, fontWeight: FontWeight.w500,fontFamily: SmartAppTheme.fontName)
                    ) ),
                  ),
                //  _createAccountLabel(),
                ],
              ),
               ),
            ),
          ),
        //  Positioned(bottom: 40, left: 0, child: smartLoadingButton('test')),
        ],
      ),
    ));
  }



}









  // Widget _backButton() {
  //   return InkWell(
  //     onTap: () {
  //       Navigator.pop(context);
  //     },
  //     child: Container(
  //       padding: EdgeInsets.symmetric(horizontal: 10),
  //       child: Row(
  //         children: <Widget>[
  //           Container(
  //             padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
  //             child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
  //           ),
  //           Text('Back',
  //               style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
  //         ],
  //       ),
  //     ),
  //   );
    

  // }


  
  // Widget _title() {
  //   return RichText(
  //     textAlign: TextAlign.center,
  //     text: TextSpan(
  //         text: 'd',
  //         style: GoogleFonts.portLligatSans(
  //           textStyle: Theme.of(context).textTheme.display1,
  //           fontSize: 30,
  //           fontWeight: FontWeight.w700,
  //           color: Color(0xffe46b10),
  //         ),
  //         children: [
  //           TextSpan(
  //             text: 'ev',
  //             style: TextStyle(color: Colors.black, fontSize: 30),
  //           ),
  //           TextSpan(
  //             text: 'rnz',
  //             style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
  //           ),
  //         ]),
  //   );
  // }