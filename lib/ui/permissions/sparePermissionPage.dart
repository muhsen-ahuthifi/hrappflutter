import 'package:flutter/material.dart';
import 'package:hrapp/model/permissions/spare_permission_panel.dart';
import 'package:hrapp/ui/widget/commonVacTransWidget.dart';
import 'package:hrapp/ui/widget/commonWidget.dart';
import 'package:hrapp/util/app_url.dart';
import '../../services/smartApiService.dart';
import 'package:hrapp/ui/widget/AppTheme.dart';



class SparePermissionPage extends StatefulWidget {
 const SparePermissionPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SparePermissionPageState();
  }
}
class _SparePermissionPageState extends State<SparePermissionPage> {
ApiListResults<SparePermissionPanel> response;

Future _getData() {
   return fetchPanelData(AppUrl.SparePermissionPanel,(row)=>new SparePermissionPanel.fromJson(row))
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
          List<SparePermissionPanel> data = response.data;
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
  ListView _smartListView(BuildContext context,List<SparePermissionPanel> data) {
 
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
              
          //    ],
          //   [
          //  Padding(padding:const EdgeInsets.only(top: 20,bottom: 5, left: 16, right: 16), child:Text('المدير المباشر : '+ row.manager,style: SmartAppTheme.subtitle)),
          //    Divider(),
          //   Padding(padding:const EdgeInsets.only(top: 5,bottom: 5, left: 16, right: 16), child:Text('ملاحظات',style: SmartAppTheme.subtitle,)),

          //    Padding(padding:const EdgeInsets.only(top: 8, left: 16, right: 16),child:Text(row.note)),
              
          //   ]
          //    );
          });
        });
  }


}



class _ListRowView extends StatelessWidget {

  final SparePermissionPanel data;

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
    //  link: true,
    //  onTap: callback,
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
                          // Padding(
                          //   padding: const EdgeInsets.only(
                          //       right: 4, bottom: 8, top: 16),
                          //   child: Text(
                          //     data.monitortype,
                          //     textAlign: TextAlign.center,
                          //     style: TextStyle(
                                
                          //         fontFamily: SmartAppTheme.fontName,
                          //         fontWeight: FontWeight.w500,
                          //         fontSize: 16,
                          //         letterSpacing: -0.1,
                          //         color: SmartAppTheme.darkText),
                          //   ),
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                          smartBadgTitle("ساعة",data.period.toString()),

                            ],
                          ),
                           smartVacSubTitle('الموظف',data.emp),

                         
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
              ));
  }
}