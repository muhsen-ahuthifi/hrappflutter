import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'colorUtlit.dart';

class SmartAppTheme {
  SmartAppTheme._();
  static const Color colorPrimary =Color(0xFF1976d2);
   static const Color btnPrimary=Color(0xFF1976d2);
  static const Color nearlyWhite = Color(0xFFFAFAFA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color background =Color(0xFFF2F3F8);
  static const Color nearlyDarkBlue = Color(0xFF2633C5);
  static const Color cardBackground =Color(0xFFFFFFFF);
  static const Color divider = Color(0xFFF2F3F8);
  static const Color iconColor = Color(0xFF4A6572);

  static const Color nearlyBlue = Color(0xFF00B6F0);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color spacer = Color(0xFFF2F2F2);
  static const String fontName = 'Tajawal Regular';

  static const TextTheme textTheme = TextTheme(
    headline4:  display1,
    headline5: headline,
    headline6: title,
    subtitle2: subtitle,
    bodyText2: body2,
    bodyText1: body1,
    caption: caption,
    
  );
   static const CupertinoTextThemeData cupertinoTextTheme = CupertinoTextThemeData(
    // headline4:  display1,
    // headline5: headline,
    // headline6: title,
    // subtitle2: subtitle,
    // bodyText2: body2,
    // bodyText1: body1,
    // caption: caption,
    textStyle: defaultIosTextStype,
    //actionTextStyle: defaultIosTextStype,
   // navActionTextStyle: defaultIosTextStype,
    
    //navTitleTextStyle: 
  );
  static const TextStyle defaultIosTextStype = TextStyle(
    // color: Color.fromRGBO(0, 0, 0, 1),
    // fontSize: 14,
    // fontStyle: FontStyle.normal,
    // fontWeight: FontWeight.normal,
      fontFamily: fontName,
  );
  static const TextStyle display1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkerText,
  );
  static const TextStyle defaultTextStyle = TextStyle(
  
      fontFamily: fontName,
  );
  static const TextStyle headline = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: darkerText,
    
  );
  static const TextStyle lightHeadline = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.27,
    color: lightText,
    
  );
  static const TextStyle title = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkText,
  );

  static const TextStyle body2 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: darkText,
  );

  static const TextStyle body1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: darkText,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );

    static const TextStyle tabLabel = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    
  //  letterSpacing: -0.05,
    color: darkText,
  );


  static const TextStyle searchText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
      fontFamily: fontName,
  );
    static const Color scaffoldBackground = Color(0xfff0f0f0);

  static const Color searchBackground = Color(0xffe0e0e0);

  static const Color searchCursorColor = Color.fromRGBO(0, 122, 255, 1);

  static const Color searchIconColor = Color.fromRGBO(128, 128, 128, 1);
    static const Color menuRowDivider = Color(0xFFD9D9D9);

  static const TextStyle menuRowItemName = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.8),
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
      fontFamily: fontName,

  );
    

}