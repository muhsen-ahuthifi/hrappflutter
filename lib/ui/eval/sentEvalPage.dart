import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrapp/ui/eval/evalDetailsPage.dart';
import 'package:hrapp/ui/widget/AppTheme.dart';
import 'package:hrapp/ui/widget/commonWidget.dart';
import 'package:hrapp/util/app_url.dart';
import '../../model/eval/sent_eval_panal.dart';
import '../../services/smartApiService.dart';
import 'widget/eval_weight_view.dart';
import '../widget/list_view.dart';



class SentEvalPage extends StatelessWidget {

 const SentEvalPage({super.key});





  @override
  Widget build(BuildContext context) {
   return NgListView(
      dataLoader: (context) =>
      fetchPanelData(AppUrl.SentEvalPanal,
      (row)=>new SentEvalPanal.fromJson(row)) ,
      itemBuilder: (context,row, index,loadDataFun) =>
      _buildRow(context, row,loadDataFun) ,
    );

  }

  Widget _buildRow(BuildContext context,SentEvalPanal row,VoidCallback loadDataFun) {
    return _ListRowView(data: row,
           callback: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => EvalDetailsPage(vm: row)));

          // var dd=data[index];
         //  print(dd.monitortype);
          });
  }
 

 
}



class _ListRowView extends StatelessWidget {

  final SentEvalPanal data;

  const _ListRowView({required this.data, required this.callback});

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    
        return  
        Semantics(
      label: data.getAriaLabel(),
       value: data.getAriaValue(),
      excludeSemantics: true,
      link: true,
      onTap: callback,
   child:
         InkWell(
                splashColor: Colors.transparent,
                onTap: callback,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 8, right: 8, top: 16, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: SmartAppTheme.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      topLeft: Radius.circular(68.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: SmartAppTheme.grey.withOpacity(0.2),
                        offset: Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 4, right: 4),
                      child: Row(
                        children: [
                          Expanded(                            
                            child: 
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 2, right:2, top: 4),
                              child: Column(
                                children:[
                             
                                EvalTitleView(title: data.emp,subtitle: data.department,
                                borderColor:  Color(4287078629).withOpacity(0.5),
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
                                              child:
                                             Container(
                                                 width: 220,
                                                 child:
                                               Text(
                                                data.period,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                   fontFamily: SmartAppTheme.fontName,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 11,
                                                  letterSpacing: -0.1,
                                                  color: SmartAppTheme.grey
                                                      .withOpacity(0.5),
                                                ),
                                              )),
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
                        children: [
                          Expanded(
                            child: EvalWeightView(weight: data.weight.toString())
                          ),
                         
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                               EvalPercentageView(pg: data.pgw.toString())
                              ],
                            ),
                          )
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
