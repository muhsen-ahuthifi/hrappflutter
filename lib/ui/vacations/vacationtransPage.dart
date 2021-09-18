import 'package:flutter/material.dart';
// import 'package:hrapp/model/vacations/vacationsPostVM.dart';
// import 'package:hrapp/model/vacations_bal.dart';
// import 'package:hrapp/ui/vacations/vacationsPostPage.dart';
import 'package:hrapp/ui/widget/AppTheme.dart';
import 'package:hrapp/ui/widget/commonVacTransWidget.dart';
import 'package:hrapp/ui/widget/commonWidget.dart';
import 'package:hrapp/util/app_url.dart';
import '../../model/vacations/vacation_trans_panal.dart';
import '../../services/smartApiService.dart';

class VacationTransPage extends StatefulWidget {
 const VacationTransPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _VacationTransPageState();
  }
}
class _VacationTransPageState extends State<VacationTransPage> {
ApiListResults<VacationTransPanel> response;

Future _getData() {
   return fetchPanelData(AppUrl.VacationTransPanel,(row)=>new VacationTransPanel.fromJson(row))
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
          List<VacationTransPanel> data = response.data;
         
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

  ListView _smartListView(BuildContext context,List<VacationTransPanel> data) {
 
    return ListView.builder(
      
        itemCount: data.length,
         scrollDirection: Axis.vertical,
           padding: EdgeInsets.only( left:16,right: 16,bottom: 62 + MediaQuery.of(context).padding.bottom, ),
        itemBuilder: (context, index) {
          return _ListRowView(data: data[index],
           callback: () {

             var row=data[index];
            smartSuccessToast(context,'الحالة',row.getAriaValue());

          //  smartStateDialog(context,row.monitortype,
          //    [
          //     DialogOptions(key:"1",label:'موافقة المدير المباشر',checked:row.manager_appreoved,reject: row.req_reject&&!row.manager_appreoved),
          //     DialogOptions(key:"2",label:'اعتماد الطلب',checked:row.hr_appreoved,reject: row.req_reject&&row.manager_appreoved)

          //    ],
          //   [
          //    Divider(),
          // //  Padding(padding:const EdgeInsets.only(top: 4, left: 16, right: 16), child:Text('المدير المباشر : '+ row.spareEmp)),
          //  //   Divider(),
          //   Padding(padding:const EdgeInsets.only(top: 4, left: 16, right: 16), child:Text('سبب الرفض')),
          //    Divider(),
          //    Padding(padding:const EdgeInsets.only(top: 8, left: 16, right: 16),child:Text(row.rejectNote)),
              
          //   ]
          //    );
            
          });
        });
  }


}

  // @override
  // Widget build(BuildContext context) {

  //   return FutureBuilder<ApiListResults<VacationTransPanel>>(
  //     future:fetchPanelData(AppUrl.VacationTransPanel,(row)=>new VacationTransPanel.fromJson(row)),
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //         if(!snapshot.data.success){
  //         return  errorView(snapshot.data.message);

  //         }
  //         List<VacationTransPanel> data = snapshot.data.data;
  //         if(data.length==0){
  //         return  noResultViewView();
  //         }else{
  //         return _smartListView(context,data);
  //         }
  //       } else if (snapshot.hasError) {
  //         return  errorView(snapshot.error);
  //       }
  //        return loadingView();
      
  //     },
  //   );
  // }


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
        value: data.getAriaValue(),

      excludeSemantics: true,
      link: true,
     // onTap: callback,
child: 
   InkWell(
               splashColor: Colors.transparent,
                onTap: callback,
                child:Container(
      
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
                             smartVacTransState(data.appreoved,data.req_reject,data.appreoveState),
                            ],
                          ),
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
                      padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16),
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