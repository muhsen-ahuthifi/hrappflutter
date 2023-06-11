// import 'package:flutter/material.dart';
// import 'package:hrapp/providers/user_provider.dart';
// import 'package:hrapp/ui/widget/AppTheme.dart';
// import 'package:hrapp/ui/widget/commonWidget.dart';
// import 'package:hrapp/util/shared_preference.dart';
// import 'package:provider/provider.dart';
// import '../../util/homeSysKey.dart';
// import '../vacations/vacationsbalPage.dart';
// import '../vacations/vacationtransPage.dart';
// import '../vacations/managerVacTransPage.dart';
// import '../vacations/spareVacationPage.dart';
// import '../permissions/permissionTransPage.dart';
// import '../permissions/sparePermissionPage.dart';
// import '../permissions/managerPermissionPage.dart';
// import '../eval/employeeForEvalPage.dart';
// import '../eval/employeeTermEvalPage.dart';
// import '../eval/recivedEvalPage.dart';
// import '../eval/sentEvalPage.dart';
// import '../eval/periodEvalPage.dart';

// class HomePage extends StatelessWidget {
//  const HomePage({super.key, required this.uiType});

//   final HomeSysKey uiType;

//   @override
//   Widget build(BuildContext context) {
//     //  var tabs=getTabs();
//     var title = this.uiType == HomeSysKey.Vacation
//         ? 'الاجازات'
//         : this.uiType == HomeSysKey.Manager
//             ? 'اعتماد الاجازات'
//             : 'التقييمات';
//     return DefaultTabController(
//       length: this.uiType == HomeSysKey.Vacation
//           ? 5
//           : this.uiType == HomeSysKey.Manager
//               ? 2
//               : 5,
//       child: Scaffold(
//         backgroundColor: SmartAppTheme.background,
//         appBar: AppBar(
//           title: Text(title, style: SmartAppTheme.lightHeadline),
//           backgroundColor: SmartAppTheme.background,
//           elevation: 0,
//           automaticallyImplyLeading: false,
//           iconTheme: IconThemeData(color: SmartAppTheme.iconColor),
//           actions: [
//             PopupMenuButton(
//               itemBuilder: (BuildContext context) {
//                 return [
//                   const PopupMenuItem(value: 'Aboute', child: Text('عنا')),
//                   const PopupMenuItem(
//                       value: 'Logout', child: Text('تسجيل خروج'))
//                 ];
//               },
//               onSelected: (value) => _onMenuOptionSelected(context, value),
//             ),
//           ],
//           bottom: this.uiType == HomeSysKey.Vacation
//               ? const TabBar(
//                   isScrollable: true,
//                   labelColor: SmartAppTheme.darkText,
//                   unselectedLabelColor: SmartAppTheme.lightText,
//                   labelStyle: SmartAppTheme.tabLabel,
//                   indicatorSize: TabBarIndicatorSize.label,
//                   //  indicator: BoxDecoration(
//                   //         color: SmartAppTheme.grey,

//                   //         borderRadius: BorderRadius.only(
//                   //             topRight: Radius.circular(20.0),
//                   //             bottomRight: Radius.circular(20.0),
//                   //             bottomLeft: Radius.circular(20.0),
//                   //             topLeft: Radius.circular(20.0)),

//                   //       ),
//                   tabs: [
//                       Tab(text: 'رصيد الاجازات'),
//                       Tab(text: 'طلبات الاجازات'),
//                       Tab(text: 'طلبات الاذونات'),
//                       Tab(text: 'المناوبات'),
//                       Tab(text: 'مناوبات الاذونات'),
//                     ])
//               : this.uiType == HomeSysKey.Manager
//                   ? const TabBar(
//                       isScrollable: true,
//                       labelColor: SmartAppTheme.darkText,
//                       unselectedLabelColor: SmartAppTheme.lightText,
//                       labelStyle: SmartAppTheme.tabLabel,
//                       indicatorSize: TabBarIndicatorSize.label,
//                       tabs: [
//                           Tab(text: 'الموافقة على الاجازات'),
//                           Tab(text: 'الموافقة على الاذونات'),
//                         ])
//                   : const TabBar(
//                       isScrollable: true,
//                       labelColor: SmartAppTheme.darkText,
//                       unselectedLabelColor: SmartAppTheme.lightText,
//                       labelStyle: SmartAppTheme.tabLabel,
//                       indicatorSize: TabBarIndicatorSize.label,
//                       tabs: [
//                           Tab(text: 'التقييمات الواردة'),
//                           Tab(text: 'التقييمات الصادرة'),
//                           Tab(text: 'تقييمات قيد الانتظار'),
//                           Tab(text: 'التقييمات الواردة تفصيلي'),
//                           Tab(text: 'تقييم لفترات'),
//                         ]),
//         ),
//         // bottomNavigationBar:
//         body: this.uiType == HomeSysKey.Vacation
//             ? const SafeArea(
//                 bottom: false,
//                 child: TabBarView(
//                   children: [
//                     VacationsBalPage(),
//                     VacationTransPage(),
//                     PermissionTransPage(),
//                     SpareVacationPage(),
//                     SparePermissionPage()
//                   ],
//                 ),
//               )
//             : this.uiType == HomeSysKey.Manager
//                 ? const SafeArea(
//                     bottom: false,
//                     child: TabBarView(
//                       children: [
//                         ManagerVacTransPage(),
//                         ManagerPermissionPage()
//                       ],
//                     ),
//                   )
//                 : const SafeArea(
//                     bottom: false,
//                     child: TabBarView(
//                       children: [
//                         RecivedEvalPage(),
//                         SentEvalPage(),
//                         EmployeeForEvalPage(),
//                         EmployeeTermEvalPage(),
//                         PeriodEvalPage()
//                       ],
//                     ),
//                   ),
//       ),
//     );
//   }

//   _onMenuOptionSelected(BuildContext context, value) {
//     {
//       if (value == 'Logout') {
//         smartConfirmDialog(
//             context,
//             "تسجيل الخروج",
//             "تاكيد تسجيل الخروج",
//             () => {
//                   UserPreferences.removeUser(),
//                   Provider.of<UserProvider>(context, listen: false)
//                       .removeUser(),
//                   Navigator.pushReplacementNamed(context, '/login'),
//                 });
//         //showToastMsg(context,'menu',value.toString())
//       } else {
//         smartErrorToast(context, 'menu', value.toString());
//       }
//     }
//     ;
//   }
// }
