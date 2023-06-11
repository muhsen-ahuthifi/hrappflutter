// import 'package:flutter/material.dart';
// import 'package:hrapp/ui/home/homePage.dart';
// import 'package:hrapp/ui/widget/AppTheme.dart';
// import '../../util/homeSysKey.dart';

// class AppsPage extends StatefulWidget {
//   AppsPage({super. key, required this.title});

//   final String title;

//   @override
//   _AppsPageState createState() => _AppsPageState();
// }

// class _AppsPageState extends State<AppsPage> {
//   Widget _appButton(String title, HomeSysKey uiType) => new Padding(
//         padding: const EdgeInsets.all(1.0),
//         child: ElevatedButton(
//           child: Text(title,
//               style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold)),

//           onPressed: () {
//             //    Navigator.push(
//             // context,
//             // MaterialPageRoute(
//             //     builder: (context) =>  HomeLightPage(uiType: uiType)));
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => HomePage(uiType: uiType)));
//           },
//           //  elevation: 4.0, MediaQuery.of(context).size.width
//           style: ButtonStyle(
//               // padding: MaterialStateProperty.all(EdgeInsets.only(left:20.0,right:20)),
//               elevation: MaterialStateProperty.all(0.0),
//               minimumSize: MaterialStateProperty.all(Size(140, 120)),
//               foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
//               backgroundColor:
//                   MaterialStateProperty.all<Color>(SmartAppTheme.btnPrimary),
//               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                   RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(24)),
//               ))),
//         ),
//       );

//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //       backgroundColor: SmartAppTheme.white,

//   //       body: Center (
//   //        child: Column(
//   //         mainAxisAlignment: MainAxisAlignment.center,
//   //        // crossAxisAlignment:  CrossAxisAlignment.center,
//   //        // mainAxisSize: ,
//   //         children: <Widget>[

//   //            _appButton("الاجازات", HomeSysKey.Vacation),
//   //              SizedBox(height:25),
//   //           _appButton("التقييمات", HomeSysKey.Eval),
//   //             SizedBox(height:25),
//   //           _appButton("الاعتماد", HomeSysKey.Manager)

//   //         ],
//   //       )));
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         backgroundColor: SmartAppTheme.white,
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Expanded(
//               child: TabBarView(children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [_appButton("الاجازات", HomeSysKey.Vacation)],
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [_appButton("التقييمات", HomeSysKey.Eval)],
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [_appButton("الاعتماد", HomeSysKey.Manager)],
//                 ),
//               ]),
//             ),
//             // Expanded(
//             ExcludeSemantics(
//               child: const TabPageSelector(),
//             ),

//             SizedBox(height: 20)
//           ],
//         ),
//         //   ),
//       ),
//     );
//   }
// }
