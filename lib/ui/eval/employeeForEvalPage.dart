import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrapp/ui/widget/commonWidget.dart';
import 'package:hrapp/util/app_url.dart';
import '../../model/eval/emp_for_eval_panal.dart';
import '../../services/smartApiService.dart';
import 'package:hrapp/ui/widget/AppTheme.dart';

import 'evalFormPage.dart';
import 'widget/eval_weight_view.dart';
import '../widget/list_view.dart';



class EmployeeForEvalPage extends StatelessWidget {
 const EmployeeForEvalPage({super.key});



  @override
  Widget build(BuildContext context) {
   return NgListView(
      dataLoader: (context) =>
      fetchPanelData(AppUrl.EmployeeForEvalPanel,
      (row)=>new EmployeeForEvalPanel.fromJson(row)) ,
      itemBuilder: (context,row, index,loadDataFun) =>
      _buildRow(context, row,loadDataFun) ,
    );

  }

  Widget _buildRow(BuildContext context,EmployeeForEvalPanel row,VoidCallback loadDataFun) {
     return _ListRowView(data:row,
           callback: () async {
                final result = await  Navigator.push(context, CupertinoPageRoute(builder: (context) => EvalFormPage(vm: row)));
           if(result!=null&&result){
            smartSuccessToast(context,"التقييم","تمت العملية بنجاح");
            loadDataFun();
          }
          // var dd=data[index];
         //  print(dd.monitortype);
          });
  }
 





 
}



class _ListRowView extends StatelessWidget {

  final EmployeeForEvalPanel data;

   const _ListRowView({required this.data, required this.callback});

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
                          child: EvalWeightView(weight: data.weight.toString())

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
