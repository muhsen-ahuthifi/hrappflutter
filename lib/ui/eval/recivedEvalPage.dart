import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrapp/ui/eval/evalDetailsPage.dart';
import 'package:hrapp/ui/widget/AppTheme.dart';
import 'package:hrapp/ui/widget/commonWidget.dart';
import 'package:hrapp/util/app_url.dart';
import '../../model/eval/recived_eval_panal.dart';
import '../../services/smartApiService.dart';
import 'widget/eval_weight_view.dart';
import '../widget/list_view.dart';



class RecivedEvalPage extends  StatelessWidget {
 const RecivedEvalPage({super.key});

 

  @override
  Widget build(BuildContext context) {
   return NgListView(
      dataLoader: (context) =>
      fetchPanelData(AppUrl.RecivedEvalPanal,
      (row)=>new RecivedEvalPanal.fromJson(row)) ,
      itemBuilder: (context,row, index,loadDataFun) =>
      _buildRow(context, row,loadDataFun) ,
    );

  }

  Widget _buildRow(BuildContext context,RecivedEvalPanal row,VoidCallback loadDataFun) {
     return _ListRowView(
              data:row,
              callback: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) =>
                            EvalDetailsPage(vm:row)));

                // var dd=data[index];
                //  print(dd.monitortype);
              });
       
  }
 


 
 
 
 
}

class _ListRowView extends StatelessWidget {
  final RecivedEvalPanal data;

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
        child: InkWell(
          splashColor: Colors.transparent,
          onTap: callback,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 8),
            child: Container(
              decoration: cardBoxDecoration(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, left: 4, right: 4),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 2, right: 2, top: 4),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 48,
                                      width: 2,
                                      decoration: BoxDecoration(
                                        color:
                                            Color(0xFFF56E98).withOpacity(0.5),
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
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4, bottom: 2),
                                            child: Text(data.evaldoc,
                                                textAlign: TextAlign.center,
                                                style: HrSmartAppTheme
                                                    .evalTitleStyle),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 2, bottom: 3),
                                                child: Container(
                                                    width: 200,
                                                    child: Text(
                                                      data.period,
                                                      textAlign: TextAlign.start,
                                                      style: HrSmartAppTheme
                                                          .evalsubTitleLightStyle,
                                                    )),
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
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Center(
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
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
                                      children: [
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
                                        angle: 360 * data.pg / 100),
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
                            child:
                                EvalWeightView(weight: data.weight.toString())),
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
