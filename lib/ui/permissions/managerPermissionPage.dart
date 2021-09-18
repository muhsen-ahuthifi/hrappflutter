import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrapp/model/permissions/manager_permission_panel.dart';
import 'package:hrapp/model/vacations/managerPostVM.dart';
import 'package:hrapp/model/vacations/vacationsPostVM.dart';
import 'package:hrapp/ui/review/managerReviewPostPage.dart';
import 'package:hrapp/ui/widget/commonVacTransWidget.dart';
import 'package:hrapp/ui/widget/commonWidget.dart';
import 'package:hrapp/util/app_url.dart';
import '../../services/smartApiService.dart';
import 'package:hrapp/ui/widget/AppTheme.dart';


class ManagerPermissionPage extends StatefulWidget {
 const ManagerPermissionPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ManagerPermissionPageState();
  }
}
class _ManagerPermissionPageState extends State<ManagerPermissionPage> {
ApiListResults<ManagerPermissionPanel> response;

Future _getData() {
   return fetchPanelData(AppUrl.ManagerPermissionPanel,(row)=>new ManagerPermissionPanel.fromJson(row))
  .then((_response) {
      if (mounted) {
    setState(() {
      response = _response;
    });
}
  });
}

@override
void initState() {
super.initState();
  this._getData();
}
  @override
  Widget build(BuildContext context) {
return RefreshIndicator(
    onRefresh: _getData,
    child: getCurrentView(context));
  
  }

  Widget getCurrentView(BuildContext context) {


     if (response!=null) {
          if(!response.success){
          return  errorView(response.message);

          }
          List<ManagerPermissionPanel> data = response.data;
          if(data.length==0){
          return  noResultViewView();
          }else{
          return _smartListView(context,data);
          }
          }
        //  else if (snapshot.hasError) {
        //   return  errorView(snapshot.error);
        // }
         return loadingView();
      
 
  }

  ListView _smartListView(BuildContext context,List<ManagerPermissionPanel> data) {
 
    return ListView.builder(
      
        itemCount: data.length,
         scrollDirection: Axis.vertical,
           padding: EdgeInsets.only( left:16,right: 16,bottom: 62 + MediaQuery.of(context).padding.bottom, ),
        itemBuilder: (context, index) {
          return _ListRowView(data: data[index],
           callback: () {
            showCupertinoModalPopup<void>(
              context: context,
              builder: (BuildContext context) => CupertinoActionSheet(
                title: const Text('اختيار نوع الاجراء'),
                  cancelButton: CupertinoActionSheetAction(
                    child: const Text('الغاء'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
              // message: const Text('Message'),
                actions: <CupertinoActionSheetAction>[
                  CupertinoActionSheetAction(
                    
                    child: const Text('موافقة'),
                    onPressed: () {
                       openVacApproveForm(key:VactionApproveType.Apporve,row:data[index]);
                      
                    },
                  ),
                  CupertinoActionSheetAction(
                    child: const Text('رفض'),
                    onPressed: () {
                    
                         openVacApproveForm(key:VactionApproveType.Reject,row:data[index]);
                    },
                  )
                ],
              ),
            );
         
          //    smartOptionsDialog(context,data[index].monitortype,
          //    [
          //     DialogOptions(key:VactionApproveType.Apporve,label:'موافقة'),
          //     DialogOptions(key:VactionApproveType.Reject,label:'رفض')

          //    ],
          //    (key) async {
          //     final row=data[index];
          //    openVacApproveForm(key:key,row:row);
          // //  smartErrorToast(context, key, data[index].monitortype)
          //    });
          });
        });
  }

   openVacApproveForm({key:String,row}) async{
       Navigator.pop(context);
                final result = await  Navigator.push(context, MaterialPageRoute(builder: (context) => ManagerReviewPostPage(vm: ManagerVacTransPostVM(id: row.id,emp: row.emp,spareEmp: row.spareEmp,period: row.period,fromDate: row.fromHour,toDate: row.toHour,monitortype: row.monitortype,bal: row.bal,note: row.note,appreoved: key==VactionApproveType.Apporve),postType:VactionPostType.Permission)));
            if(result!=null&&result){
            smartSuccessToast(context,"الاعتماد","تمت العملية بنجاح");
            _getData();
          }
 }
}



class _ListRowView extends StatelessWidget {

  final ManagerPermissionPanel data;

  const _ListRowView({Key key, this.data,this.callback})
      : super(key: key);
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
                        children: <Widget>[
                               
                         smartVacTypeTitle(data.monitortype),
                          SizedBox(height:5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                                         
                           smartBadgTitle("ساعة",data.period.toString()),
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
                      padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
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
         
                       smartBadgLabel( 'من الساعة',data.fromHour.toString(),CrossAxisAlignment.start),
                         smartBadgLabel('الى الساعة',data.toHour.toString(),CrossAxisAlignment.center),
                        smartBadgLabel('بتاريخ',data.atDate.toString(),CrossAxisAlignment.end),
 
                        ],
                      ),
                    )
                  ],
                ),
                ),
    ));
  }
}