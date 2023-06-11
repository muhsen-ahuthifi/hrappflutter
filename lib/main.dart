
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
import 'messaging/firebase_options.dart';
import 'messaging/messaging.dart';
import 'model/user.dart';
// import 'package:http/http.dart' as http;

// import 'ui/splash/splashPage.dart';

// void main() {
//   runApp(SmartApp());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    await setupFlutterNotifications();
  }

  runApp(SmartApp());
}

class SmartApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Future<User> getUserData() => UserPreferences.getUser();
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
          locale:
              Locale('ar', 'SA'), // OR Locale('ar', 'SA') OR Other RTL locales,


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
                    else if (snapshot.data?.token == null)
                      return const LoginPage();
                    else

                      {
                      Provider.of<UserProvider>(context, listen: false).setUserSession(snapshot.data!);
                       return const AppsLightPage();
                      } // SplashPage(title: 'Flutter Demo Home Page');
                  // Welcome(user: snapshot.data);
                }
              }),
          routes: {
            // '/splash': (context) => SplashPage(),
            '/login': (context) =>const LoginPage(),
            '/apps': (context) => const AppsLightPage(),
          }),
    );
  }
}



// https://console.firebase.google.com/project/alaman-2d492/messaging
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   // Set the background messaging handler early on, as a named top-level function
//   FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

//   if (!kIsWeb) {
//     await setupFlutterNotifications();
//   }

//   runApp(MessagingExampleApp());
// }





