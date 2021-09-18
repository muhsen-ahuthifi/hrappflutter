import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrapp/model/vacations/vacation_trans_panal.dart';
import 'package:hrapp/model/vacations/vacationsPostVM.dart';
import 'package:hrapp/model/vacations_bal.dart';
import 'package:hrapp/ui/eval/employeeForEvalPage.dart';
import 'package:hrapp/ui/eval/employeeTermEvalPage.dart';
import 'package:hrapp/ui/eval/periodEvalPage.dart';
import 'package:hrapp/ui/eval/sentEvalPage.dart';
import 'package:hrapp/ui/permissions/managerPermissionPage.dart';
import 'package:hrapp/ui/permissions/permissionTransPage.dart';
import 'package:hrapp/ui/permissions/sparePermissionPage.dart';
import 'package:hrapp/ui/vacations/spareVacationPage.dart';
import 'package:hrapp/ui/vacations/vacationsPostPage.dart';
import 'package:hrapp/ui/vacations/vacationtransPage.dart';
import 'package:hrapp/ui/widget/AppTheme.dart';
import 'package:hrapp/ui/widget/commonVacTransWidget.dart';
import 'package:hrapp/ui/widget/commonWidget.dart';

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
border:null ,
           middle:  Text( title, ),
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
       

       
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        ListView(
        
    //  title:Text(title),
     //  content:Text(msg,textAlign: TextAlign.center),
     children:[
_ListRowView(data: 
VacationTransPanel(
      id: 1,
      spareEmp: 'ali',
      monitortype: 'monitortype',
      period: 10,
      bal: 10,
      fromDate: '12/12/2020',
      toDate: '12/12/2020',
      //manager: json['monitortype']??'',
      hr_appreoved:false,
      manager_appreoved:false,
      appreoved:false,
      req_reject:false,
appreoveState:
" قيد الانتظار",
rejectNote:'',
note: 'note',

    ),
           callback: () {
                                     Navigator.push(context, MaterialPageRoute(builder: (context) => VacationsPostPage(vm:  VacationsBal(id:1,monitortype: 'test'),postType:VactionPostType.Vacation)));

           }),
   _ListRowView(data: 
VacationTransPanel(
      id: 1,
      spareEmp: 'ali',
      monitortype: 'monitortype',
      period: 10,
      bal: 10,
      fromDate: '12/12/2020',
      toDate: '12/12/2020',
      //manager: json['monitortype']??'',
      hr_appreoved:false,
      manager_appreoved:false,
      appreoved:false,
      req_reject:false,
appreoveState:
" قيد الانتظار",
rejectNote:'',
note: 'note',

    ),
           callback: () {
                                     Navigator.push(context, MaterialPageRoute(builder: (context) => VacationsPostPage(vm:  VacationsBal(id:1,monitortype: 'test'),
                                     postType:VactionPostType.Vacation)));

           }),
       Center(
        child: CupertinoButton(
          onPressed: () {
            showCupertinoModalPopup<void>(
              context: context,
              builder: (BuildContext context) => CupertinoActionSheet(
                title: const Text('اختيار نوع الاجازة'),
                cancelButton: CupertinoActionSheetAction(
                    child: const Text('الغاء'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
              // message: const Text('Message'),
                actions: <CupertinoActionSheetAction>[
                  CupertinoActionSheetAction(
                    child: const Text('اجازة يومية'),
                    onPressed: () {
                       Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => VacationsPostPage(vm:  VacationsBal(id:1,monitortype: 'test'),postType:VactionPostType.Vacation)));

                      //  openVacForm(key:VactionPostType.Vacation,vm:data[index]);
                    },
                  ),
                  CupertinoActionSheetAction(
                    child: const Text('اجازة ساعية'),
                    onPressed: () {
                        Navigator.pop(context);
                       Navigator.push(context, MaterialPageRoute(builder: (context) => VacationsPostPage(vm:  VacationsBal(id:1,monitortype: 'test'),postType:VactionPostType.Permission)));
                     //    openVacForm(key:VactionPostType.Permission,vm:data[index]);
                    },
                  )
                ],
              ),
            );
         
          },
          child: const Text('CupertinoActionSheet'),
        ),
      ),
   
     ],

      )
    );
  }
}



class _ListRowView extends StatelessWidget {

  final VacationTransPanel data;

  const _ListRowView({Key key, this.data,this.callback})
      : super(key: key);
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return
    Semantics(
      label: data.getAriaLabel(),
      excludeSemantics: true,
      link: true,
      
     // button: true,
     // focusable: true,
     //focused: true,
      onTap: callback,
      child:  InkWell(
        
              // splashColor: Colors.transparent,
                onTap: callback,
                
                child: 
     Container(
      
       margin:  EdgeInsets.only(top: 8, bottom: 8),
              decoration: cardBoxDecoration(),
                child: Column(
                  
                  children: <Widget>[
                  
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 16, right: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                         
                         smartVacTypeTitle(data.monitortype),
                          SizedBox(height:5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              smartBadgTitle("day",data.period.toString()),
                             smartVacTransState(data.appreoved,data.req_reject,data.appreoveState),

                          
                            ],
                          ),
                          smartVacSubTitle('shift',data.spareEmp),
                        
                        ],
                      ),
                    ),
                    
                   
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, top: 8, bottom: 8),
                      child: Container(
                        height: 2,
                        decoration: BoxDecoration(
                          color: SmartAppTheme.divider,
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16),
                      child: Row(
                        children: <Widget>[
 
                        smartBadgLabel( 'from ',data.fromDate.toString(),CrossAxisAlignment.start),
                         smartBadgLabel('to data ',data.toDate.toString(),CrossAxisAlignment.center),
                         smartBadgLabel('bal',data.bal.toString(),CrossAxisAlignment.end),
                         
                        ],
                      ),
                    )
                  ],
                ),
               ),
              ) );
  }
}