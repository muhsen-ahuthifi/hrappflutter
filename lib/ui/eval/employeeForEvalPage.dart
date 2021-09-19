import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrapp/ui/widget/commonWidget.dart';
import 'package:hrapp/util/app_url.dart';
import '../../model/eval/emp_for_eval_panal.dart';
import '../../services/smartApiService.dart';
import 'package:hrapp/ui/widget/AppTheme.dart';

import 'evalFormPage.dart';


class EmployeeForEvalPage extends StatefulWidget {
 const EmployeeForEvalPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EmployeeForEvalPageState();
  }
}
class _EmployeeForEvalPageState extends State<EmployeeForEvalPage> {
ApiListResults<EmployeeForEvalPanel> response;

Future _getData() {
   return fetchPanelData(AppUrl.EmployeeForEvalPanel,(row)=>new EmployeeForEvalPanel.fromJson(row))
  .then((_response) {

           if (mounted) {
    setState(() {
      response = _response;
    });
}
    //
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
          List<EmployeeForEvalPanel> data = response.data;//??new List();
      //     data.add(EmployeeForEvalPanel(
            
      //       department_id: 1,descendantEmp_Id: 127,emp_id: 130,emp: "muh",evalcycle_id: 1,
    
      // department: 'غير محدد',
      // evaldoc: 'غير محدد',
      // job: 'غير محدد',
      //  weight: 50,
      // job_id: 0,
      //   period_id: 0,
     

      // period: 'غير محدد',
      //  evaldoc_id: 19,
   
          
          
      //     ));
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

  ListView _smartListView(BuildContext context,List<EmployeeForEvalPanel> data) {
 
    return ListView.builder(
      
        itemCount: data.length,
         scrollDirection: Axis.vertical,
           padding: EdgeInsets.only( left:4,right: 4,bottom: 62 + MediaQuery.of(context).padding.bottom, ),
        itemBuilder: (context, index) {
          return _ListRowView(data: data[index],
           callback: () async {
         final row=data[index];
                final result = await  Navigator.push(context, CupertinoPageRoute(builder: (context) => EvalFormPage(vm: row)));
           if(result!=null&&result){
            smartSuccessToast(context,"التقييم","تمت العملية بنجاح");
            _getData();
          }
          // var dd=data[index];
         //  print(dd.monitortype);
          });
        });
  }


 
}



class _ListRowView extends StatelessWidget {

  final EmployeeForEvalPanel data;

  const _ListRowView({Key key, this.data,this.callback})
      : super(key: key);
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    
        return Semantics(
      label: data.getAriaLabel(),
       value: data.getAriaValue(),

      excludeSemantics: true,
      link: true,
      onTap: callback,
   child:  InkWell(
                splashColor: Colors.transparent,
                onTap: callback,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 8, right: 8, top: 16, bottom: 8),
              child: Container(
                decoration: cardBoxDecoration(),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 4, right: 4),
                      child: Row(
                        children: <Widget>[
                          Expanded(                            
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 2, right:2, top: 4),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        height: 48,
                                        width: 2,
                                        decoration: BoxDecoration(
                                          color: Color(4287078629)
                                              .withOpacity(0.5),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0)),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4, bottom: 2),
                                              child: Text(
                                                data.emp,                                             
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                   fontFamily: SmartAppTheme.fontName,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  letterSpacing: -0.1,
                                                  color: SmartAppTheme.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
     
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 2, bottom: 3),
                                                  child: Text(
                                                    data.department,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                       fontFamily: SmartAppTheme.fontName,
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 12,
                                                      color: SmartAppTheme.darkerText,
                                                    ),
                                                  ),
                                                ),
                                          
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        height: 48,
                                        width: 2,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF56E98)
                                              .withOpacity(0.5),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0)),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0, bottom: 2),
                                              child: Text(
                                                data.period,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                   fontFamily: SmartAppTheme.fontName,
                                                   //fontFamily:
                                                    //  SmartAppTheme.fontName,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 11,
                                                  letterSpacing: -0.1,
                                                  color: SmartAppTheme.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
                                         
                                                Padding(
                                                  padding:
                                                 const EdgeInsets.only(left: 2, bottom: 3),
                                                  child: Text(
                                                   data.evaldoc,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                       fontFamily: SmartAppTheme.fontName,
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 14,
                                                      color: SmartAppTheme.darkerText,
                                                    ),
                                                  ),
                                                ),
                                            
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                       
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, top: 8, bottom: 8),
                      child: Container(
                        height: 2,
                        decoration: BoxDecoration(
                          color: SmartAppTheme.background,
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
                                  'الوزن',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                     fontFamily: SmartAppTheme.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    letterSpacing: -0.2,
                                    color: SmartAppTheme.darkText,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Container(
                                    height: 4,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color:
                                          Color(4287078629).withOpacity(0.2),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4.0)),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          width: ((70 / 1.1) * 1),
                                          height: 4,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                              Color(4287078629),
                                              Color(4287078629)
                                                  .withOpacity(0.5),
                                            ]),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4.0)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 6),
                                  child: Text(
                                    data.weight.toString(),
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
                         
                        
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          
        ));
      
    
  }
}
