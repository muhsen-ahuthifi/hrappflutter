import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrapp/ui/eval/employeeForEvalPage.dart';
import 'package:hrapp/ui/eval/employeeTermEvalPage.dart';
import 'package:hrapp/ui/eval/periodEvalPage.dart';
import 'package:hrapp/ui/eval/sentEvalPage.dart';
import 'package:hrapp/ui/permissions/managerPermissionPage.dart';
import 'package:hrapp/ui/permissions/permissionTransPage.dart';
import 'package:hrapp/ui/permissions/sparePermissionPage.dart';
import 'package:hrapp/ui/vacations/spareVacationPage.dart';
import 'package:hrapp/ui/vacations/vacationtransPage.dart';
import 'package:hrapp/ui/widget/AppTheme.dart';
import '../../util/homeSysKey.dart';
import '../vacations/vacationsbalPage.dart';
import '../vacations/managerVacTransPage.dart';

import '../eval/recivedEvalPage.dart';

class HomeLightPage extends StatelessWidget {
  const HomeLightPage({Key key,@required this.navItem}) : super(key: key);

  final NavItem navItem;

  @override
  Widget build(BuildContext context) {
    //  var tabs=getTabs();
     final page=getPage();
    var title=this.navItem.title;//==HomeSysKey.Vacation ? 'الاجازات':this.uiType==HomeSysKey.Manager ?  'اعتماد الاجازات': 'التقييمات';
    return  CupertinoPageScaffold(
     backgroundColor: SmartAppTheme.scaffoldBackground,
        navigationBar: CupertinoNavigationBar(
//border:null ,
           middle:  Text( title,style: SmartAppTheme.defaultIosTextStype, ),
         //  backgroundColor:SmartAppTheme.background,
          
         //  elevation: 0,
           //automaticallyImplyLeading: false,
           
         //   iconTheme: IconThemeData(color: SmartAppTheme.iconColor),
            
         
            
        ),
        child:
         SafeArea(
          bottom: false,
            child:Material(
     child: page
            )
        
      
      ));
   
  }
 
Widget getPage(){
  switch (this.navItem.key){
    case AppFromKey.VacationsBal:
    return VacationsBalPage();

       case AppFromKey.VacationTransPanel:
    return VacationTransPage();

       case AppFromKey.PermissionTransPanel:
    return PermissionTransPage();

       case AppFromKey.SpareVacationPanel:
    return SpareVacationPage();

       case AppFromKey.SparePermissionPanel:
    return SparePermissionPage();

    case AppFromKey.ManagerVacTransPanel:
    return ManagerVacTransPage();

       case AppFromKey.ManagerPermissionPanel:
    return ManagerPermissionPage();

      case AppFromKey.RecivedEvalPanal:
    return RecivedEvalPage();
      case AppFromKey.SentEvalPanal:
    return SentEvalPage();
      case AppFromKey.EmployeeForEvalPanel:
    return EmployeeForEvalPage();
      case AppFromKey.EmployeeTermEvalPanal:
    return EmployeeTermEvalPage();
      case AppFromKey.PeriodEvalPanal:
    return PeriodEvalPage();
    default:  return VacationsBalPage();
  }
}
}
       

       