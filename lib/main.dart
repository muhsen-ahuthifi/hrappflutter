import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
// import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hrapp/providers/auth.dart';
import 'package:hrapp/providers/user_provider.dart';
import 'package:hrapp/ui/login/loginPage.dart';
// import 'package:hrapp/ui/splash/appsPage.dart';
import 'package:hrapp/ui/splash/appsLightPage.dart';
import 'package:hrapp/ui/widget/AppTheme.dart';
// import 'package:hrapp/ui/widget/AppTheme.dart';
import 'package:hrapp/util/shared_preference.dart';
import 'package:provider/provider.dart';
import 'model/user.dart';
import 'ui/splash/appsLightPage.dart';
// import 'ui/splash/splashPage.dart';

void main() {
  runApp(SmartApp());
}

class SmartApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   Future<User> getUserData() => UserPreferences().getUser();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
         // !kIsWeb && 
          Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
     return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: CupertinoApp(
      title: 'Alaman_HR',
      
      //showSemanticsDebugger: true,
      
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
    GlobalCupertinoLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
  ],
  supportedLocales: [
    Locale('ar', 'SA'), // OR Locale('ar', 'SA') OR Other RTL locales
  ],
  locale:  Locale('ar', 'SA'),// OR Locale('ar', 'SA') OR Other RTL locales,
  
//       theme: ThemeData(
//             textTheme: SmartAppTheme.textTheme,
//             fontFamily: 'Tajawal Regular',
//    //  platform: TargetPlatform.iOS,

//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//        //primarySwatch:new MaterialColor(Colors.white) ,
//              primarySwatch: Colors.blue,
             
// // primarySwatch:MaterialColor(
// //     0xFFFFFFFF,
// //     <int, Color>{
// //        50: Colors.white,
// //       100: Colors.white,
// //       200: Colors.white,
// //       300: Colors.white,
// //       400: Colors.white,
// //       500: Colors.white,
// //       600: Colors.white,
// //       700: Colors.white,
// //       800: Colors.white,
// //       900:Colors.white,
// //     },
// //   ),
//         // This makes the visual density adapt to the platform that you run
//         // the app on. For desktop platforms, the controls will be smaller and
//         // closer together (more dense) than on mobile platforms.
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
        theme: CupertinoThemeData(
          brightness: Brightness.light,
          
          textTheme: SmartAppTheme.cupertinoTextTheme,
        //  primaryColor: Colors.blue,
        ),
      //home: SplashPage(title: 'Flutter Demo Home Page'),
            home: FutureBuilder(
              future: getUserData(),
              builder: (context, snapshot) {
               // print(HexColor.getColorFromHex('#8A98E8'));
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return CircularProgressIndicator();
                  default:
                    if (snapshot.hasError)
                      return Text('Error: ${snapshot.error}');
                    else if (snapshot.data.token == null)
                      return LoginPage();
                    else
                    
                     // UserPreferences().removeUser();
                    return AppsLightPage();// SplashPage(title: 'Flutter Demo Home Page');
                   // Welcome(user: snapshot.data);
                }
              }
              ),
            routes: {
           // '/splash': (context) => SplashPage(),
            '/login': (context) => LoginPage(),
            '/apps': (context) => AppsLightPage(),
          }
       ),
    );
  }
}

