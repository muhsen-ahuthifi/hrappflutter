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

class ManagerVacTransPage extends StatefulWidget {
 const ManagerVacTransPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ManagerVacTransPageState();
  }
}
class _ManagerVacTransPageState extends State<ManagerVacTransPage> {
ApiListResults<ManagerVacTransPanel> response;

Future _getData() {
   return fetchPanelData(AppUrl.ManagerVacTransPanel,(row)=>new ManagerVacTransPanel.fromJson(row))
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
          List<ManagerVacTransPanel> data = response.data;
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
  ListView _smartListView(BuildContext context,List<ManagerVacTransPanel> data) {
 
    return ListView.builder(
      
        itemCount: data.length,
         scrollDirection: Axis.vertical,
           padding: EdgeInsets.only( left:16,right: 16,bottom: 62 + MediaQuery.of(context).padding.bottom, ),
        itemBuilder: (context, index) {
          return _ListRowView(data: data[index],
           callback: () {
              smartOptionsDialog(context,data[index].monitortype,
             [
              DialogOptions(key:VactionApproveType.Apporve,label:'موافقة'),
              DialogOptions(key:VactionApproveType.Reject,label:'رفض')

             ],
             (key) async{
               final row=data[index];
                final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => ManagerReviewPostPage(vm: ManagerVacTransPostVM(id: row.id,emp: row.emp,spareEmp: row.spareEmp,period: row.period,fromDate: row.fromDate,toDate: row.toDate,monitortype: row.monitortype,bal: row.bal,note: row.note,appreoved: key==VactionApproveType.Apporve),postType:VactionPostType.Vacation)));
          //         Navigator.pop(context, true); smartErrorToast(context, key, data[index].monitortype)
          if(result!=null&&result){ 
            smartSuccessToast(context,"الاعتماد","تمت العملية بنجاح");
            _getData();
          }
             });
          // var dd=data[index];
         //  print(dd.monitortype);
          });
        });
  }


}



class _ListRowView extends StatelessWidget {

  final ManagerVacTransPanel data;

  const _ListRowView({Key key, this.data,this.callback})
      : super(key: key);
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return
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
              );
  }
}