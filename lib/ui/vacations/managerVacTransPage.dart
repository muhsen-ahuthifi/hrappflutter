import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrapp/model/vacations/managerPostVM.dart';
import 'package:hrapp/model/vacations/manager_vactrans_panel.dart';
import 'package:hrapp/model/vacations/vacationsPostVM.dart';
import 'package:hrapp/ui/review/managerReviewPostPage.dart';
import 'package:hrapp/ui/widget/commonVacTransWidget.dart';
import 'package:hrapp/ui/widget/commonWidget.dart';
import 'package:hrapp/util/app_url.dart';
import '../../services/smartApiService.dart';
import 'package:hrapp/ui/widget/AppTheme.dart';

import '../widget/list_view.dart';



class ManagerVacTransPage extends StatelessWidget {
 const ManagerVacTransPage({super. key});



  @override
  Widget build(BuildContext context) {
   return NgListView(
      dataLoader: (context) =>
      fetchPanelData(AppUrl.ManagerVacTransPanel,
      (row)=>new ManagerVacTransPanel.fromJson(row)) ,
      itemBuilder: (context,row, index,loadDataFun) =>
      _buildRow(context, row,loadDataFun) ,
    );

  }

  Widget _buildRow(BuildContext context,ManagerVacTransPanel row,VoidCallback loadDataFun) {
    
      return _ListRowView(data: row,
           callback: () {
                 showCupertinoModalPopup<void>(
              context: context,
              builder: (BuildContext context) => CupertinoActionSheet(
                title: const Text('اختيار نوع الاجراء',style: SmartAppTheme.defaultIosTextStype),
                  cancelButton: CupertinoActionSheetAction(
                    child: const Text('الغاء',style: SmartAppTheme.defaultIosTextStype),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
              // message: const Text('Message'),
                actions: <CupertinoActionSheetAction>[
                  CupertinoActionSheetAction(
                    
                    child: const Text('الموافقة على الطلب',style: SmartAppTheme.defaultIosTextStype),
                    onPressed: () {
                       openVacApproveForm(context,loadDataFun,key:VactionApproveType.Apporve,row:row);
                      
                    },
                  ),
                  CupertinoActionSheetAction(
                    child: const Text('رفض الطلب',style: SmartAppTheme.defaultIosTextStype),
                    onPressed: () {
                         openVacApproveForm(context,loadDataFun,key:VactionApproveType.Reject,row:row);
                    },
                  )
                ],
              ),
            );
         
          
          });
       
  }

  
 
  void openVacApproveForm(BuildContext context,VoidCallback loadDataFun,{ required String key,required ManagerVacTransPanel row}) async{
       Navigator.pop(context);
                final result = await Navigator.push(context, CupertinoPageRoute(builder: (context) => ManagerReviewPostPage(vm: ManagerVacTransPostVM(id: row.id,emp: row.emp,spareEmp: row.spareEmp,period: row.period,fromDate: row.fromDate,toDate: row.toDate,monitortype: row.monitortype,bal: row.bal,note: row.note,appreoved: key==VactionApproveType.Apporve),postType:VactionPostType.Vacation)));
            if(result!=null&&result){
            smartSuccessToast(context,"الاعتماد","تمت العملية بنجاح");
           loadDataFun();
          }
 }
}



class _ListRowView extends StatelessWidget {

  final ManagerVacTransPanel data;
  const _ListRowView({required this.data, required this.callback});

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
                child: Column(
                  
                  children: <Widget>[
                  
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 16, right: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                               
                         smartVacTypeTitle(data.monitortype),
                          SizedBox(height:5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                         
                              smartBadgTitle("يوم",data.period.toString()),
                             smartVacTransState(data.appreoved,false,data.appreoveState),

                           
                            ],
                          ),
                            smartVacSubTitle('الموظف',data.emp),
                            SizedBox(height:6),
                            smartVacSubTitle('المناوب',data.spareEmp),

                         
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
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, top: 8, bottom: 16),
                      child: Row(
                        children: <Widget>[
                        smartBadgLabel( 'من تاريخ',data.fromDate.toString(),CrossAxisAlignment.start),
                         smartBadgLabel('الى تاريخ',data.toDate.toString(),CrossAxisAlignment.center),
                         smartBadgLabel('الرصيد',data.bal.toString(),CrossAxisAlignment.end),
                         
                        
                        ],
                      ),
                    )
                  ],
                ),
                ),
              ));
  }
}