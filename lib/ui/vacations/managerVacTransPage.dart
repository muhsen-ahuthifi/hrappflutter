import 'package:flutter/material.dart';
import 'package:hrapp/model/vacations/managerPostVM.dart';
import 'package:hrapp/model/vacations/manager_vactrans_panel.dart';
import 'package:hrapp/model/vacations/vacationsPostVM.dart';
import 'package:hrapp/ui/review/managerReviewPostPage.dart';
import 'package:hrapp/ui/widget/commonWidget.dart';
import 'package:hrapp/util/app_url.dart';
import '../../services/smartApiService.dart';
import 'package:hrapp/ui/widget/AppTheme.dart';


class ManagerVacTransPage extends StatelessWidget {
    const ManagerVacTransPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<ApiListResults<ManagerVacTransPanel>>(
      future:fetchPanelData(AppUrl.ManagerVacTransPanel,(row)=>new ManagerVacTransPanel.fromJson(row)),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
             if(!snapshot.data.success){
          return  errorView(snapshot.data.message);

          }
          List<ManagerVacTransPanel> data = snapshot.data.data;
          if(data.length==0){
          return  noResultViewView();
          }else{
          return _smartListView(context,data);
          }
        } else if (snapshot.hasError) {
          return  errorView(snapshot.error);
        }
         return loadingView();
      
      },
    );
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
             (key)=>{
                 Navigator.push(context, MaterialPageRoute(builder: (context) => ManagerReviewPostPage(vm: data[index],postType:VactionPostType.Vacation,rejected: key==VactionApproveType.Reject)))
          //  smartErrorToast(context, key, data[index].monitortype)
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
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 4, bottom: 8, top: 16),
                            child: Text(
                              data.monitortype,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                
                                  fontFamily: SmartAppTheme.fontName,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  letterSpacing: -0.1,
                                  color: SmartAppTheme.darkText),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 4, bottom: 3),
                                    child: Text(
                                      data.period.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: SmartAppTheme.fontName,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 32,
                                        color: SmartAppTheme.nearlyDarkBlue,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8, bottom: 8),
                                    child: Text(
                                      'يوم',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: SmartAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        letterSpacing: -0.2,
                                        color: SmartAppTheme.nearlyDarkBlue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      data.appreoved?
                                      Icon(Icons.thumb_up, color: Colors.blueGrey,size: 30)
                                      : Icon(Icons.access_time, color: Colors.orange,size: 30),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4, bottom: 14),
                                    child: Text(
                                      data.appreoveState,
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
                          ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                              children:[ 
                             
                         Padding(
                            padding: const EdgeInsets.only(left:4,right: 4, bottom: 8),
                            child: Text(
                              data.emp,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: SmartAppTheme.fontName,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  letterSpacing: -0.1,
                                  color: SmartAppTheme.lightText),
                            ),
                         
                      ),
                         Padding(
                                    padding: const EdgeInsets.only(
                                        right: 2, bottom: 8),
                                    child: Text(
                                      'الموظف',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: SmartAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                         fontSize: 12,
                                        letterSpacing: -0.2,
                                        color: SmartAppTheme.nearlyDarkBlue,
                                      ),
                                    ),
                                  ),
                                
                      ],
                      ),
                          Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                              children:[ 
                         Padding(
                            padding: const EdgeInsets.only(left:4,right: 4, bottom: 2),
                            child: Text(
                              data.spareEmp,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: SmartAppTheme.fontName,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  letterSpacing: -0.1,
                                  color: SmartAppTheme.lightText),
                            ),
                         
                      ),
                         Padding(
                                    padding: const EdgeInsets.only(
                                        right: 2, bottom: 2),
                                    child: Text(
                                      ' المناوب',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: SmartAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                         fontSize: 12,
                                        letterSpacing: -0.2,
                                        color: SmartAppTheme.nearlyDarkBlue,
                                      ),
                                    ),
                                  ),
                                
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
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, top: 8, bottom: 16),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  data.fromDate.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: SmartAppTheme.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    letterSpacing: -0.2,
                                    color: SmartAppTheme.darkText,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 6),
                                  child: Text(
                                    'من تاريخ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: SmartAppTheme.fontName,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color:
                                          SmartAppTheme.grey.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      data.toDate.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: SmartAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: -0.2,
                                        color: SmartAppTheme.darkText,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: Text(
                                        'الى تاريخ',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: SmartAppTheme.fontName,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: SmartAppTheme.grey
                                              .withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      data.bal.toString(),
                                      style: TextStyle(
                                        fontFamily: SmartAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: -0.2,
                                        color: Colors.green,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: Text(
                                        'الرصيد',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: SmartAppTheme.fontName,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: SmartAppTheme.grey
                                              .withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                ),
              );
  }
}