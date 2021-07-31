
import 'package:flutter/material.dart';
import 'package:hrapp/ui/widget/commonVacTransWidget.dart';
import 'package:hrapp/ui/widget/commonWidget.dart';
import 'package:hrapp/util/app_url.dart';
import '../../model/permissions/permission_trans_panal.dart';
import '../../services/smartApiService.dart';
import 'package:hrapp/ui/widget/AppTheme.dart';


class PermissionTransPage extends StatefulWidget {
 const PermissionTransPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PermissionTransPageState();
  }
}
class _PermissionTransPageState extends State<PermissionTransPage> {
ApiListResults<PermissionTransPanel> response;

Future _getData() {
   return fetchPanelData(AppUrl.PermissionTransPanel,(row)=>new PermissionTransPanel.fromJson(row))
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
          List<PermissionTransPanel> data = response.data;
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

  ListView _smartListView(BuildContext context,List<PermissionTransPanel> data) {
 
    return ListView.builder(
      
        itemCount: data.length,
         scrollDirection: Axis.vertical,
           padding: EdgeInsets.only( left:16,right: 16,bottom: 62 + MediaQuery.of(context).padding.bottom, ),
        itemBuilder: (context, index) {
          return _ListRowView(data: data[index],
           callback: () {
                  var row=data[index];
           smartStateDialog(context,row.monitortype,
             [

              DialogOptions(key:"1",label:'موافقة المدير المباشر',checked:row.manager_appreoved,reject: row.req_reject&&!row.manager_appreoved),
              DialogOptions(key:"2",label:'اعتماد الطلب',checked:row.hr_appreoved,reject: row.req_reject&&row.manager_appreoved)
             ],
            [
            Padding(padding:const EdgeInsets.only(top: 4, left: 16, right: 16), child:Text('سبب الرفض')),
              Divider(),
             Padding(padding:const EdgeInsets.only(top: 8, left: 16, right: 16),child:Text(row.rejectNote)),
              
            ]
             );
          });
        });
  }


}



class _ListRowView extends StatelessWidget {

  final PermissionTransPanel data;

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
                decoration:  cardBoxDecoration(),
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
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, top: 8, bottom: 16),
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
              );
  }
}