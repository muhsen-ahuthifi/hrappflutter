import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrapp/model/vacations/vacationsPostVM.dart';
import 'package:hrapp/ui/vacations/vacationsPostPage.dart';
import 'package:hrapp/ui/widget/AppTheme.dart';
import 'package:hrapp/ui/widget/commonVacTransWidget.dart';
import 'package:hrapp/ui/widget/commonWidget.dart';
import 'package:hrapp/util/app_url.dart';
import '../../model/vacations_bal.dart';
import '../../services/smartApiService.dart';
import '../widget/list_view.dart';

//VacationsPostPage

class VacationsBalPage extends StatelessWidget {

      const VacationsBalPage({super.key});






 

 @override
  Widget build(BuildContext context) {
   return NgListView(
      dataLoader: (context) =>fetchPanelData(AppUrl.VacationsBal,
        (row) => new VacationsBal.fromJson(row)) ,
      itemBuilder: (context,row, index,loadDataFun) =>_buildRow(context, row,loadDataFun) ,
    );

  }

Widget _buildRow(BuildContext context,VacationsBal row,VoidCallback loadDataFun) {
  
  return _ListRowView(data: row,
           callback: () async {
             if(row.allowHourTrans){
              showCupertinoModalPopup<void>(
              context: context,
              builder: (BuildContext context) => CupertinoActionSheet(
                title: const Text('اختيار نوع الاجازة',style: SmartAppTheme.defaultIosTextStype),
                  cancelButton: CupertinoActionSheetAction(
                    child: const Text('الغاء',style: SmartAppTheme.defaultIosTextStype),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
              // message: const Text('Message'),
                actions: <CupertinoActionSheetAction>[
                  CupertinoActionSheetAction(
                    
                    child: const Text('اجازة يومية',style: SmartAppTheme.defaultIosTextStype),
                    onPressed: () {
                        openVacForm(context,loadDataFun,key:VactionPostType.Vacation,vm:row);
                    },
                  ),
                  CupertinoActionSheetAction(
                    child: const Text('اجازة ساعية',style: SmartAppTheme.defaultIosTextStype),
                    onPressed: () {
                         openVacForm(context,loadDataFun,key:VactionPostType.Permission,vm:row);
                    },
                  )
                ],
              ),
            );
         
          
             }
             else{
         final result = await Navigator.push(context, CupertinoPageRoute(builder: (context) => VacationsPostPage(vm: row,postType:VactionPostType.Vacation)));
                if(result!=null&&result){
                smartSuccessToast(context,"الاجازات","تمت العملية بنجاح");
                  loadDataFun();
          }
             }
            
          // var dd=data[index];
         //  print(dd.monitortype);
          }
          );
        
       
}




 void  openVacForm(BuildContext context,VoidCallback loadDataFun,{required String key,vm}) async{
       Navigator.pop(context);
          final result = await   Navigator.push(context, CupertinoPageRoute(builder: (context) => VacationsPostPage(vm: vm,postType:key)));
           if(result!=null&&result){
            smartSuccessToast(context,"الاجازات","تمت العملية بنجاح");
            loadDataFun();
          }
 }
}



class _ListRowView extends StatelessWidget {

  final VacationsBal data;

  const _ListRowView({ required this.data,required this.callback});
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return
    Semantics(
      label: data.getAriaLabel(),
       value: data.getAriaValue(),

      excludeSemantics: true,
      link: true,
      onTap: callback,
   child:
     InkWell(
       
                splashColor: Colors.transparent,
                onTap: callback,
                child: 
     Container(
       margin:  EdgeInsets.only(top: 8, bottom: 8),
                decoration: cardBoxDecoration(),
                child: 
                
                Column(
                  
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
                           
                           smartBadgTitle("يوم",data.remainderbal.toString()),

                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                   
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 4.0),
                                        child: Text(
                                         data.availableafter.toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: SmartAppTheme.fontName,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            letterSpacing: 0.0,
                                            color: Colors.orange,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4, bottom: 14),
                                    child: Text(
                                      'متاح بعد',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: SmartAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        letterSpacing: 0.0,
                                        color: SmartAppTheme.nearlyDarkBlue,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
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
                      padding: const EdgeInsets.only( left: 24, right: 24, top: 8, bottom: 16),
                      child: Row(
                        children: <Widget>[
                
                        smartBadgLabel('افتتاحي',data.begbal.toString(),CrossAxisAlignment.start),
                         smartBadgLabel('مستخدم',data.usedbal.toString(),CrossAxisAlignment.center),
                         smartBadgLabel('متبقي',data.remainderbal.toString(),CrossAxisAlignment.end),
                         
                        ],
                      ),
                    )
                  ],
                ),
                ),
              ));
  }
}