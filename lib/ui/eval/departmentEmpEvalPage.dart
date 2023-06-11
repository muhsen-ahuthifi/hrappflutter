


import 'package:flutter/material.dart';
import 'package:hrapp/model/eval/department_emp_eval_panal.dart';
import 'package:hrapp/ui/widget/commonWidget.dart';
import 'package:hrapp/util/app_url.dart';
import '../../services/smartApiService.dart';
import 'package:hrapp/ui/widget/AppTheme.dart';

import '../widget/list_view.dart';


class DepartmentEmpEvalPage extends StatelessWidget {
 const DepartmentEmpEvalPage({super.key});




  

  @override
  Widget build(BuildContext context) {
   return NgListView(
      dataLoader: (context) =>
      fetchPanelData(AppUrl.DepartmentEmpEvalPanal,
      (row)=>new DepartmentEmpEvalPanal.fromJson(row)) ,
      itemBuilder: (context,row, index,loadDataFun) =>
      _buildRow(context, row,loadDataFun) ,
    );

  }

  Widget _buildRow(BuildContext context,DepartmentEmpEvalPanal row,VoidCallback loadDataFun) {
    return _ListRowView(data:row,
           callback: () {
         //    final row=data[index];
      //  Navigator.push(context, CupertinoPageRoute(builder: (context) => RecivedHistoryEvalPage(period_id:row.id,period_n: row.period )));

          // var dd=data[index];
         //  print(dd.monitortype);
          });
        
  }
 
 


 
}



class _ListRowView extends StatelessWidget {

  final DepartmentEmpEvalPanal data;

  const _ListRowView({required this.data, required this.callback});

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    
        return  Semantics(
      label: data.getAriaLabel(),
            value: data.getAriaValue(),

      excludeSemantics: true,
      link: true,
      onTap: callback,
   child: InkWell(
                splashColor: Colors.transparent,
                onTap: callback,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 8, right: 8, top: 8, bottom: 8),
              child: Container(
                decoration:cardFlatBoxDecoration(),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8, left: 4, right: 4),
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
                                          color: Color(0xFFF56E98)
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
                                              child: 
                                              Container(
                                            width: 200,
                                            child: Text(
                                                data.emp,   
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                   fontFamily: SmartAppTheme.fontName,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  letterSpacing: -0.1,
                                                  color: SmartAppTheme.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            )),
                                         
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
     
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 2, bottom: 3),
                                                  child: Text(
                                                    data.job,
                                                  
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
                               
                              
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: Center(
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: SmartAppTheme.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(60.0),
                                        ),
                                        border: new Border.all(
                                            width: 3,
                                            color: SmartAppTheme.nearlyDarkBlue
                                                .withOpacity(0.2)),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            '${(data.pg.toInt())}%',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                               fontFamily: SmartAppTheme.fontName,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16,
                                              letterSpacing: 0.0,
                                              color: SmartAppTheme.nearlyDarkBlue,
                                            ),
                                          ),
               
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: CustomPaint(
                                      painter: CurvePainter(
                                      
                                          angle: 360*data.pg/100),
                                      child: SizedBox(
                                        width: 68,
                                        height: 68,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  
                 
                  ],
                ),
              ),
            ),
          
        ));
      
    
  }
}
