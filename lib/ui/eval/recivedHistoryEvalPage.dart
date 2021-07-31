import 'package:flutter/material.dart';
import 'package:hrapp/ui/eval/evalDetailsPage.dart';
import 'package:hrapp/ui/widget/AppTheme.dart';
import 'package:hrapp/ui/widget/commonWidget.dart';
import 'package:hrapp/util/app_url.dart';
import '../../model/eval/recived_eval_panal.dart';
import '../../services/smartApiService.dart';

class RecivedHistoryEvalPage extends StatefulWidget {
 const RecivedHistoryEvalPage({Key key,@required this.period_id,@required this.period_n}) : super(key: key);
  final int period_id;
  final String period_n;

  @override
  State<StatefulWidget> createState() {
    return _RecivedHistoryEvalPageState(period_id:this.period_id,period_n:period_n);
  }
}

class _RecivedHistoryEvalPageState extends State<RecivedHistoryEvalPage> {
  _RecivedHistoryEvalPageState({@required this.period_id,@required this.period_n});

ApiListResults<RecivedEvalPanal> response;
  final int period_id;
  final String period_n;

  double topBarOpacity = 1.0;

Future _getData() {
   return fetchPanelData(AppUrl.RecivedHistoryEvalPanal+"?period="+this.period_id.toString(),(row)=>new RecivedEvalPanal.fromJson(row))
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
// return RefreshIndicator(
//     onRefresh: _getData,
//     child: getCurrentView(context));
       return Scaffold(
       backgroundColor: SmartAppTheme.background,
      //  appBar: AppBar(
      //      title:  Text( this.period_n, style: SmartAppTheme.title),
      //      backgroundColor: SmartAppTheme.white,
      //     // elevation: 0,
      //       iconTheme: IconThemeData(color: SmartAppTheme.iconColor),
            
      //  ),
    //     body: RefreshIndicator(
    // onRefresh: _getData,
    // child: getCurrentView(context))
       body: Stack(
          children: <Widget>[
         
           getAppBarUI(),
               Padding(
              padding:EdgeInsets.only(top: 100),
              child:   RefreshIndicator(
             
     onRefresh: _getData,
    child: getCurrentView(context)) ,
            ),
        
            
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
    );
  }

  Widget getCurrentView(BuildContext context) {


     if (response!=null) {
          if(!response.success){
          return  errorView(response.message);

          }
          List<RecivedEvalPanal> data = response.data;
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
  ListView _smartListView(BuildContext context,List< RecivedEvalPanal> data) {
 
    return ListView.builder(
      
        itemCount: data.length,
         scrollDirection: Axis.vertical,
           padding: EdgeInsets.only( left:4,top:2,right: 4,bottom: 62 + MediaQuery.of(context).padding.bottom, ),
        itemBuilder: (context, index) {
          return _ListRowView(data: data[index],
           callback: () {
         Navigator.push(context, MaterialPageRoute(builder: (context) => EvalDetailsPage(vm: data[index])));

          // var dd=data[index];
         //  print(dd.monitortype);
          });
        });
  }

Widget getAppBarUI() {
    return Column(
      children: <Widget>[
         SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
            Container(
               margin: EdgeInsets.only(left: 4, right: 4),

                  decoration: BoxDecoration(
                    color: SmartAppTheme.white.withOpacity(topBarOpacity),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: SmartAppTheme.grey
                              .withOpacity(0.4 * topBarOpacity),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      // SizedBox(
                      //   height: MediaQuery.of(context).padding.top,
                      // ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 18,
                            bottom: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                 this.period_n,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16 + 6 - 6 * topBarOpacity,
                                    letterSpacing: 1.2,
                                    color: SmartAppTheme.darkerText,
                                  ),
                                ),
                              ),
                            ),
                          
                          
                        
                          ],
                        ),
                      )
                    ],
                  ),
               
             
           
        )
      ],
    );
  }
 
}



class _ListRowView extends StatelessWidget {

  final  RecivedEvalPanal data;

  const _ListRowView({Key key, this.data,this.callback})
      : super(key: key);
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    
        return   InkWell(
               splashColor: Colors.transparent,
                onTap: callback,
   
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 8),
              child: Container(
                decoration:cardBoxDecoration(),
              child:  Column(
                  
                  children: [
                    Padding(
                      
                      padding:const EdgeInsets.only(top: 16, left: 4, right: 4),
                      child: Row(
                        children: [
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
                                              child: Text(
                                                data.evaldoc,                                             
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
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
                                                  child: 
                                                  Container(
                                                 width: 200,
                                                 child:
                                                  Text(
                                                    data.period,
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 12,
                                                      color: SmartAppTheme.darkerText,
                                                    ),
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
                                       //fontFamily: SmartAppTheme.fontName,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'الدرجة المحققة',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        letterSpacing: -0.2,
                                        color: SmartAppTheme.darkText,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 0, top: 4),
                                      child: Container(
                                        height: 4,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF1B440)
                                              .withOpacity(0.2),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0)),
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              width: ((70 / 2.5) *
                                                 1),
                                              height: 4,
                                              decoration: BoxDecoration(
                                                gradient:
                                                    LinearGradient(colors: [
                                                  Color(0xFFF1B440)
                                                      .withOpacity(0.1),
                                                  Color(0xFFF1B440),
                                                ]),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4.0)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: Text(
                                        data.pgw.toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
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
            ),
            
        );
      
    
  }
}