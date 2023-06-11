import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrapp/model/eval/eval_base.dart';
import 'package:hrapp/ui/widget/commonWidget.dart';
import 'package:hrapp/util/app_url.dart';
import '../../model/eval/emp_term_eval_panal.dart';
import '../../services/smartApiService.dart';
import 'package:hrapp/ui/widget/AppTheme.dart';

import 'evalNoteDetailPage.dart';

class EvalDetailsPage extends StatefulWidget {
 const EvalDetailsPage({super.key,required this.vm});
  final BaseEvalPanal vm;
  @override
  State<StatefulWidget> createState() {
    return _EvalDetailsPageState();
  }
}
 
class _EvalDetailsPageState extends State<EvalDetailsPage> {
 //   _EvalDetailsPageState({@required this.vm});

  //final BaseEvalPanal vm;
  ApiListResults<EmployeeTermEvalPanal>? response;
  double topBarOpacity = 1.0;

Future _getData() {
   return fetchPanelData(AppUrl.EvalPostDetilsPanal+"?evalpost="+widget.vm.id.toString(),(row)=>new EmployeeTermEvalPanal.fromJson(row))
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
       return CupertinoPageScaffold(
       backgroundColor: SmartAppTheme.scaffoldBackground,
      
           navigationBar: CupertinoNavigationBar(
//border:null ,
           middle:  Text( widget.vm.emp,style: SmartAppTheme.defaultIosTextStype, ),
         
         // leading: Text( widget.vm.emp,style: SmartAppTheme.defaultIosTextStype, ),
// trailing:Icon(
//               CupertinoIcons.info_circle_fill,
//               semanticLabel: 'نقاط القوة والضعف',
              
//             //  color: SmartAppTheme.searchIconColor,
//             )
               trailing: GestureDetector(
              onTap: (){
                 Navigator.push(context, CupertinoPageRoute(builder: (context) => EvalNoteDetailPage(vm: widget.vm)));

              //    Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => EvalNoteDetailPage(vm: widget.vm)));
              // //  smartSuccessToast(context,'نقاط القوة',widget.vm.strongth);

              },
              child: 
         const Icon(
                CupertinoIcons.info_circle_fill,
               semanticLabel: 'نقاط القوة والضعف',

               // color: SmartAppTheme.searchIconColor,
              ),
            ),
           ),
        
           child:
               SafeArea(
          bottom: false,
            child:
           Material(
             child: RefreshIndicator(
             
     onRefresh: _getData,
    child: getCurrentView(context)),
           ) ,
               )
     
    );
  }


 Widget getCurrentView(BuildContext context) {
 
  if(response==null)
  return loadingView();

     
        if(response?.success==false)
          return  errorView(response?.message??"Error");

          
          List<EmployeeTermEvalPanal> data = response!.data;
         
          if(data.length==0)
          return  noResultViewView();
          else return _smartListView(context,data);
          
          
        
      
 
  }


  ListView _smartListView(BuildContext context,List<EmployeeTermEvalPanal> data) {
 
    return ListView.builder(
      
        itemCount: data.length,
         scrollDirection: Axis.vertical,
           padding: EdgeInsets.only( left:4,right: 4,top:8,bottom: 62 + MediaQuery.of(context).padding.bottom, ),
        itemBuilder: (context, index) {
          return _ListRowView(data: data[index],
           callback: () {
         
          });
        });
  }

// Widget getAppBarUI() {
//     return Column(
//       children: <Widget>[
//          SizedBox(
//                         height: MediaQuery.of(context).padding.top,
//                       ),
//             Container(
//               margin: EdgeInsets.only(left: 4, right: 4),
//                   decoration: BoxDecoration(
//                     color: SmartAppTheme.white.withOpacity(topBarOpacity),
//                     borderRadius: const BorderRadius.all(
//                       Radius.circular(32.0),
//                     ),
//                     boxShadow: <BoxShadow>[
//                       BoxShadow(
//                           color: SmartAppTheme.grey
//                               .withOpacity(0.4 * topBarOpacity),
//                           offset: const Offset(1.1, 1.1),
//                           blurRadius: 10.0),
//                     ],
//                   ),
//                   child: Column(
//                     children: <Widget>[
//                       // SizedBox(
//                       //   height: MediaQuery.of(context).padding.top,
//                       // ),
//                       Padding(
//                         padding: EdgeInsets.only(
//                             left: 16,
//                             right: 16,
//                             top: 18,
//                             bottom: 18),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Expanded(
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text(
//                                  widget.vm.emp,
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                      fontFamily: SmartAppTheme.fontName,
//                                     fontWeight: FontWeight.w700,
//                                     fontSize: 16 + 6 - 6 * topBarOpacity,
//                                     letterSpacing: 1.2,
//                                     color: SmartAppTheme.darkerText,
//                                   ),
//                                 ),
//                               ),
//                             ),
                          
                          
                        
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
               
             
           
//         )
//       ],
//     );
//   }
 
 
}




class _ListRowView extends StatelessWidget {

  final EmployeeTermEvalPanal data;

  const _ListRowView({required this.data, required this.callback});

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    
        return  Semantics(
      label: data.getAriaLabel(),
       value: data.getAriaValue(),

      excludeSemantics: true,
      link: true,
      
    //  onTap: callback,
   child: InkWell(
                splashColor: Colors.transparent,
              //  onTap: callback,
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
                                                data.term,   
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
                                                    data.aspect,
                                                  
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
