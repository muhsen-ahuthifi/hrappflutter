import 'package:flutter/material.dart';
import 'package:hrapp/model/vacations/vacationsPostVM.dart';
import 'package:hrapp/ui/vacations/vacationsPostPage.dart';
import 'package:hrapp/ui/widget/AppTheme.dart';
import 'package:hrapp/ui/widget/commonVacTransWidget.dart';
import 'package:hrapp/ui/widget/commonWidget.dart';
import 'package:hrapp/util/app_url.dart';
import '../../model/vacations_bal.dart';
import '../../services/smartApiService.dart';

//VacationsPostPage
class VacationsBalPage extends StatefulWidget {
      const VacationsBalPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _VacationsBalPageState();
  }
}
class _VacationsBalPageState extends State<VacationsBalPage> {
ApiListResults<VacationsBal> response;

Future _getData() {
   return fetchPanelData(AppUrl.VacationsBal,(row)=>new VacationsBal.fromJson(row))
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
          List<VacationsBal> data = response.data;
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

  ListView _smartListView(BuildContext context,List<VacationsBal> data) {
 
    return ListView.builder(
      
        itemCount: data.length,
         scrollDirection: Axis.vertical,
           padding: EdgeInsets.only( left:16,right: 16,bottom: 62 + MediaQuery.of(context).padding.bottom, ),
        itemBuilder: (context, index) {
          return _ListRowView(data: data[index],
           callback: () async {
             if(data[index].allowHourTrans){
            smartOptionsDialog(context,data[index].monitortype,
             [
              DialogOptions(key:VactionPostType.Vacation,label:'طلب اجازة'),
              DialogOptions(key:VactionPostType.Permission,label:'طلب اجازة ساعية')

             ],
             (key) async{

                final result = await   Navigator.push(context, MaterialPageRoute(builder: (context) => VacationsPostPage(vm: data[index],postType:key)));
           if(result!=null&&result){
                smartSuccessToast(context,"الاجازات","تمت العملية بنجاح");
            _getData();
          }
          //  smartErrorToast(context, key, data[index].monitortype)

             });
             }
             else{
         final result = await     Navigator.push(context, MaterialPageRoute(builder: (context) => VacationsPostPage(vm: data[index],postType:VactionPostType.Vacation)));
                if(result!=null&&result){
                smartSuccessToast(context,"الاجازات","تمت العملية بنجاح");
            _getData();
          }
             }
            
          // var dd=data[index];
         //  print(dd.monitortype);
          }
          );
        });
  }


}



class _ListRowView extends StatelessWidget {

  final VacationsBal data;

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
              );
  }
}