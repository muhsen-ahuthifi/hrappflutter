import 'package:flutter/material.dart';
import 'package:hrapp/model/vacations/spare_vacation_panel.dart';
import 'package:hrapp/ui/widget/commonVacTransWidget.dart';
import 'package:hrapp/ui/widget/commonWidget.dart';
import 'package:hrapp/util/app_url.dart';
import 'package:hrapp/ui/widget/AppTheme.dart';
import '../../services/smartApiService.dart';


class SpareVacationPage extends StatefulWidget {
 const SpareVacationPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SpareVacationPageState();
  }
}
class _SpareVacationPageState extends State<SpareVacationPage> {
ApiListResults<SpareVacationPanel> response;

Future _getData() {
   return fetchPanelData(AppUrl.SpareVacationPanel,(row)=>new SpareVacationPanel.fromJson(row))
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
          List<SpareVacationPanel> data = response.data;
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



  ListView _smartListView(BuildContext context,List<SpareVacationPanel> data) {
 
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
              
             ],
            [
           Padding(padding:const EdgeInsets.only(top: 20,bottom: 5, left: 16, right: 16), child:Text('المدير المباشر : '+ row.manager,style: SmartAppTheme.subtitle)),
             Divider(),
            Padding(padding:const EdgeInsets.only(top: 5,bottom: 5, left: 16, right: 16), child:Text('ملاحظات',style: SmartAppTheme.subtitle,)),

             Padding(padding:const EdgeInsets.only(top: 8, left: 16, right: 16),child:Text(row.note)),
              
            ]
             );
          });
        });
  }


}



class _ListRowView extends StatelessWidget {

  final SpareVacationPanel data;

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
       margin: EdgeInsets.only(top: 8, bottom: 8),
                decoration: cardBoxDecoration(),
                child: Column(
                  children:[
                    Padding(
                      padding:const EdgeInsets.only(top: 16, left: 16, right: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          // Padding(
                          //   padding: const EdgeInsets.only(right: 4, bottom: 8, top: 16),
                          //   child: Text(
                          //     data.monitortype,
                          //     textAlign: TextAlign.center,
                          //     style: TextStyle(
                          //        fontWeight: FontWeight.w500,
                          //         fontSize: 16,
                          //         letterSpacing: -0.1,
                          //         color: SmartAppTheme.darkText),
                          //   ),
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                           smartBadgTitle("يوم",data.period.toString()),


                            ],
                          ),
                         smartVacSubTitle('الموظف',data.emp),

                          
                        ],
                      ),
                    ),
                    
                   
                    Padding(
                      padding: const EdgeInsets.only( left: 24, right: 24, top: 8, bottom: 8),
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
                        
                        smartBadgLabel( 'من تاريخ',data.fromDate.toString(),CrossAxisAlignment.center),
                         smartBadgLabel('الى تاريخ',data.toDate.toString(),CrossAxisAlignment.center),
                         
                        ],
                      ),
                    )
                  ],
                ),
                ),
              );
  }
}