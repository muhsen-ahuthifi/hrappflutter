
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrapp/model/eval/emp_for_eval_panal.dart';
import 'package:hrapp/model/eval/evalFormVM.dart';
import 'package:hrapp/services/smartApiService.dart';
import 'package:hrapp/ui/widget/AppTheme.dart';
import 'package:hrapp/ui/widget/commonWidget.dart';
import 'package:hrapp/util/app_url.dart';
import 'package:status_change/status_change.dart';

import 'evalFormPostPage.dart';

extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
      <K, List<E>>{},
      (Map<K, List<E>> map, E element) =>
          map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));
}
const inProgressColor = Colors.black87;
const todoColor = Color(0xffd1d2d7);



class EvalFormPage extends StatefulWidget {
 const EvalFormPage({Key key, @required this.vm})
      : super(key: key);

  final EmployeeForEvalPanel vm;
  //EmployeeForEvalPanel
  @override
  State<StatefulWidget> createState() {
    return new _EvalFormPageState();
  }
}

class _EvalFormPageState extends State<EvalFormPage> {

ApiListResults<DocumentTermForEval> response;
int _processIndex = 0;
 // String pages = '';

Map<String,List<DocumentTermForEval> >  _steps;
Future _getData() {
   return fetchEvalDocTermsData(AppUrl.DocumentTermForEval+'?evaldoc='+this.widget.vm.evaldoc_id.toString(),(row)=>new DocumentTermForEval.fromJson(row))
  .then((_response) {

           if (mounted) {
    setState(() {
      response = _response;
    });
}
    //
  });
}

  //static var _focusNode = new FocusNode();
  //GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
 // static MyData data = new MyData();

  @override
  void initState() {
    super.initState();
    // _focusNode.addListener(() {
    //   setState(() {});
    //   print('Has focus: $_focusNode.hasFocus');
    // });
      this._getData();

  }


  @override
  void dispose() {
   // _focusNode.dispose();
    super.dispose();
  }

  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return Colors.green;
    } else {
      return todoColor;
    }
  }
  Future<bool> _onWillPop() async {
    if(this._processIndex>0){
      setState(() {
        _processIndex--;
      });
return false;
    }else{
 return (
        await  showCupertinoModalPopup<bool>(
              context: context,
              builder: (BuildContext context) => CupertinoActionSheet(
                title: const Text('هل تريد الغاء عملية التقييم',style: SmartAppTheme.defaultIosTextStype),
                  cancelButton: CupertinoActionSheetAction(
                    child: const Text('الاستمرار',style: SmartAppTheme.defaultIosTextStype),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
              // message: const Text('Message'),
                actions: <CupertinoActionSheetAction>[
                  CupertinoActionSheetAction(
                    
                    child: const Text('الغاء التقييم',style: SmartAppTheme.defaultIosTextStype),
                    onPressed: () {
                       Navigator.of(context).pop(true);
                    },
                  ),
                
                ],
              ),
            ))?? false;
   
   
  //  await showDialog(
  //     context: context,
  //     builder: (context) => new AlertDialog(
  //       title: new Text('تنبيه?'),
  //       content: new Text('هل تريد الغاء عملية التقييم '),
  //       actions: <Widget>[
  //           TextButton(
  //           onPressed: () => Navigator.of(context).pop(false),
  //           child: new Text('الاستمرار'),
  //         ),
  //         TextButton(
  //           onPressed: () => Navigator.of(context).pop(true),
  //           child: new Text('الغاء التقييم'),
  //         ),
  //       ],
  //     ),
  //   )) 
  
    }
   
  }


  @override
  Widget build(BuildContext context) {
    return
     new WillPopScope(
      onWillPop: _onWillPop,
      child:
     Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: SmartAppTheme.colorPrimary,
        elevation: 0.0,
       title:  Text( widget.vm.emp,style: SmartAppTheme.defaultIosTextStype,),
           //automaticallyImplyLeading: false,
           // iconTheme: IconThemeData(color: SmartAppTheme.iconColor),
      ),
     
      backgroundColor: Colors.white,
      body:getCurrentView(context),
      
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: 1,
            backgroundColor: SmartAppTheme.nearlyWhite,
            onTap: (value) async {
              
if(this._steps!=null&&this._steps.length>0){

if(value==1){
final dataIndex=_processIndex+1;

            if (dataIndex < this._steps.length) {
                  setState(() {
             _processIndex++;
                  });
            } 

            else if (dataIndex >=this._steps.length) {
                   
                final result = await Navigator.push(context, CupertinoPageRoute(builder: (context) => EvalFormPostPage(vm:this.widget.vm,termsGroup:_steps)));
          //         Navigator.pop(context, true); smartErrorToast(context, key, data[index].monitortype)
          if(result!=null&&result){ 
            Navigator.pop(context, true);
          }
            
            }
}else if(value==0 &&_processIndex>0){
     setState(() {
             _processIndex--;
                  });
              
           
}
  
} ;
            },
       //currentIndex: 0, // this will be set when a new tab is tapped
       items: [
        
         BottomNavigationBarItem(
           icon: new Icon(Icons.navigate_before),
           label: 'السابق',
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.navigate_next),
            label: 'التالي',
            
         )
       ],
     ),
     )
    );
  }
 
 Widget getSteperView(){
   return  Column(
     
      //  mainAxisAlignment:    MainAxisAlignment.spaceBetween,
      //                                     crossAxisAlignment:
      //                                         CrossAxisAlignment.start,
        children: [
          Semantics(
            label:  _steps.keys.elementAt(_processIndex).toString(),
          excludeSemantics: true,
            child:
          
          Container(
            height: 70,
            child: StatusChange.tileBuilder(
              
              theme: StatusChangeThemeData(
                direction: Axis.horizontal,
                
                connectorTheme: ConnectorThemeData(space: 1.0, thickness: 1.0),
              ),
              builder: StatusChangeTileBuilder.connected(
                itemWidth: (_) =>
                    MediaQuery.of(context).size.width / _steps.length,
                //    itemWidth:(_)=>60,
                    
                nameWidgetBuilder: (context, index) {
                  return Padding(
                    
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                    
                      (index+1).toString(),
                        
                    //  _steps[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                         fontFamily: SmartAppTheme.fontName,
                        color: getColor(index),
                      ),
                    ),
                  );
                },
                indicatorWidgetBuilder: (_, index) {
                  if (index <= _processIndex) {
                    return DotIndicator(
                      size: 25.0,
                      
                      border: Border.all(color: Colors.green, width: 1),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return OutlinedDotIndicator(
                      size: 30,
                      
                      borderWidth: 1.0,
                      color: todoColor,
                    );
                  }
                },
                lineWidgetBuilder: (index) {
                  if (index > 0) {
                    if (index == _processIndex) {
                      final prevColor = getColor(index - 1);
                      final color = getColor(index);
                      var gradientColors;
                      gradientColors = [
                        prevColor,
                        Color.lerp(prevColor, color, 0.5)
                      ];
                      return DecoratedLineConnector(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: gradientColors,
                          ),
                        ),
                      );
                    } else {
                      return SolidLineConnector(
                        color: getColor(index),
                      );
                    }
                  } else {
                    return null;
                  }
                },
                itemCount: _steps.length,
              ),
            ),
          )),
          // pages == Pages.DeliveryTime
          //     ? DeliveryTime()
          //     : pages == Pages.AddAddress
          //         ? AddAddress()
          //         : Summary()
         EvalGroupsPage(title: _steps.keys.elementAt(_processIndex).toString(),items:_steps.values.elementAt(_processIndex),)
        ],
      );
 }
    Widget getCurrentView(BuildContext context) {


     if (response!=null) {
          if(!response.success){
          return  errorView(response.message);

          }
          List<DocumentTermForEval> data = response.data;
          if(data.length==0){
          return  noResultViewView();
          }else{
            this._steps=response.data.groupBy((m) => m.aspect);
          return getSteperView();
          }
          }
        //  else if (snapshot.hasError) {
        //   return  errorView(snapshot.error);
        // }
         return loadingView();
      
 
  }
  
}

// final _steps = [
//   'Delivery',
//   'Address',
//   'Summer',
//    'Delivery2',
//   'Address2',
//   'Summer2',
// ];



class EvalGroupsPage extends StatefulWidget {
    EvalGroupsPage({@required this.title,@required this.items });
       final String title;
final List<DocumentTermForEval> items;
      @override
  State<StatefulWidget> createState() {
    return new _EvalGroupsPageState();
  }
  }
class   _EvalGroupsPageState extends State<EvalGroupsPage> {
 
  @override
  Widget build(BuildContext context) {
    return 
   
                    //            SizedBox(height:14),
      
    Expanded(

      child:  Stack(

           // mainAxisAlignment:
                                //              MainAxisAlignment.spaceBetween,
                                 //       crossAxisAlignment:
                                //           CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.start,
       
        children: [
         
         // SizedBox(height:14),
          Row(
      
      // padding: const EdgeInsets.all(6.0),
mainAxisAlignment: MainAxisAlignment.center,
            children:[ 
              
             Padding(padding: const EdgeInsets.all(6.0),
             
             child:
              Text(
              
            widget.title,
             textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.orange, fontFamily: SmartAppTheme.fontName,),
            )
             )
            ]
            
          ),
                  Padding(
                    
              padding:EdgeInsets.only(top: 50),
              child:
          _smartListView(context)),
//             ListView(
//       padding: EdgeInsets.only( left:4,right: 4,top:8,bottom: 62 + MediaQuery.of(context).padding.bottom, ),          
//            //   shrinkWrap: true,
// scrollDirection: Axis.vertical ,
//      children:widget.items.map((option) =>  
   
//      ).toList(),

//       ),
        ],
     ),
     );
  }



  ListView _smartListView(BuildContext context) {
 
    return ListView.builder(
      
        itemCount: widget.items.length,
         scrollDirection: Axis.vertical,
           padding: EdgeInsets.only( left:8,right: 8,top:4,bottom: 62 + MediaQuery.of(context).padding.bottom, ),
        itemBuilder: (context, index) {
          
          return _ListRowView(option: widget.items[index]
         );
        });
  }


 
}


class _ListRowView extends StatefulWidget {
    _ListRowView({@required this.option });
      
final DocumentTermForEval option;
      @override
  State<StatefulWidget> createState() {
    return new __ListRowViewState();
  }
  }






class __ListRowViewState extends State<_ListRowView> {



  @override
  Widget build(BuildContext context) {
    
    return 
         Padding(
          
                      padding:
                          const EdgeInsets.only(top: 8, left: 8, right: 8,bottom: 8),
                      child: Column(
        
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                                
                       Text(widget.option.name.toString(), 
                       style:  TextStyle(color: widget.option.evalvalue>0?Colors.black:Colors.red,fontSize: 18, fontFamily: SmartAppTheme.fontName,), ),
                          SizedBox(height:10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                      ElevatedButton(
      child: Text( "1", style:  TextStyle(color: widget.option.evalvalue==1?Colors.white:Colors.black), ),
      style: roundedButtonStyle(widget.option.evalvalue==1),
   onPressed:()=> setState(() { widget.option.evalvalue=1; }),

      ),
      ElevatedButton(
      child: Text( "2", style:  TextStyle(color: widget.option.evalvalue==2?Colors.white:Colors.black,), ),
      style: roundedButtonStyle(widget.option.evalvalue==2),
   onPressed:()=> setState(() { widget.option.evalvalue=2; }),

      ),
                      ElevatedButton(
      child: Text( "3", style:  TextStyle(color: widget.option.evalvalue==3?Colors.white:Colors.black), ),
      style: roundedButtonStyle(widget.option.evalvalue==3),
   onPressed:()=> setState(() { widget.option.evalvalue=3; }),

      ),
                   ElevatedButton(
      child: Text( "4", style:  TextStyle(color: widget.option.evalvalue==4?Colors.white:Colors.black), ),
      style: roundedButtonStyle(widget.option.evalvalue==4),
   onPressed:()=> setState(() { widget.option.evalvalue=4; }),

      ),
       ElevatedButton(
         
      child: Text( "5",  style:  TextStyle(color: widget.option.evalvalue==5?Colors.white:Colors.black), ),
      style: roundedButtonStyle(widget.option.evalvalue==5),
   onPressed:()=> setState(() { widget.option.evalvalue=5; }),
      )                 
                            ],
                          ),
                         
         SizedBox(height:10),                    
Divider(),
                        ],
                      ));
 
    //  ListTile(title:Text(option.emp),onTap:()=>
    
    //    setState(() {
    //         option.emp=option.emp+"t";

    // }),;
  }


   roundedButtonStyle(bool active)=>
  ButtonStyle(
            elevation:MaterialStateProperty.all(2.0),
                   minimumSize:MaterialStateProperty.all(Size(52,52)) ,
        foregroundColor: MaterialStateProperty.all<Color>(SmartAppTheme.white),
        backgroundColor: MaterialStateProperty.all<Color>(active?SmartAppTheme.colorPrimary:SmartAppTheme.white),
        shape: MaterialStateProperty.all<CircleBorder>( CircleBorder()),
        
      );
}




// class __ListRowViewState extends State<_ListRowView> {

// void _showPicker(BuildContext ctx) {
//     showCupertinoModalPopup(
//         context: ctx,
//         builder: (_) => Container(
//               width: 220,
//               height: 220,
//               child: 
//                new GestureDetector(
//           // Blocks taps from propagating to the modal sheet and popping.
//           onTap: () { Navigator.of(context).pop();},
//           child:
//               CupertinoPicker(
//                 backgroundColor: Colors.white,
//                 itemExtent: 30,
                
//                 scrollController: FixedExtentScrollController(initialItem: 4),
//                 children: [
//                   Text('1'),
//                   Text('2'),
//                   Text('3'),
//                    Text('4'),
//                     Text('5'),
//                 ],
//                 onSelectedItemChanged: (value) {
//                   setState(() {
//                      widget.option.evalvalue = value+1.0 ;
//                   });
//                 },
//               ),
//             )));
//   }
//   @override
//   Widget build(BuildContext context) {
//     final row = SafeArea(
//       top: false,
      
//       bottom: false,
//       minimum: const EdgeInsets.only(
//         left: 16,
//         top: 8,
//         bottom: 8,
//         right: 8,
//       ),
     
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 6),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: <Widget>[
               
//                     Text(widget.option.name.toString(), 
//                        style:  TextStyle(color: widget.option.evalvalue>0?Colors.black:Colors.red,fontSize: 18, fontFamily: SmartAppTheme.fontName,), ),
//                   const Padding(padding: EdgeInsets.only(top: 4)),
//                     // Text(item.subtitle,style:SmartAppTheme.subtitle),
//                 ],
//               ),
//             ),
        
        
      
    
//     );

//     // if (lastItem) {
//     //   return row;
//     // }

//     return
//        Material(
//           child: InkWell(
//             onTap: () {
//               _showPicker(context);
//             //  Navigator.push(
//             //     context,
//             //     CupertinoPageRoute(
//             //         builder: (context) =>  HomeLightPage(navItem: item)));
            
//           },
//        child:
//      Column(
      
//       children: <Widget>[
//         row,
//         Padding(
//           padding: const EdgeInsets.only(
//             left: 16,
//             right: 16,
//           ),
//           child: Container(
//             height: 1,
//             color: SmartAppTheme.menuRowDivider,
//           ),
//         ),
//       ],
//     )));
//   }

//   @override
//   Widget build(BuildContext context) {
    
//     return 
//          Padding(
          
//                       padding:
//                           const EdgeInsets.only(top: 8, left: 8, right: 8,bottom: 8),
//                       child: Column(
        
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
                                
//                        Text(widget.option.name.toString(), 
//                        style:  TextStyle(color: widget.option.evalvalue>0?Colors.black:Colors.red,fontSize: 18, fontFamily: SmartAppTheme.fontName,), ),
//                           SizedBox(height:10),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: <Widget>[
//                       ElevatedButton(
//       child: Text( "1", style:  TextStyle(color: widget.option.evalvalue==1?Colors.white:Colors.black), ),
//       style: roundedButtonStyle(widget.option.evalvalue==1),
//    onPressed:()=> setState(() { widget.option.evalvalue=1; }),

//       ),
//       ElevatedButton(
//       child: Text( "2", style:  TextStyle(color: widget.option.evalvalue==2?Colors.white:Colors.black,), ),
//       style: roundedButtonStyle(widget.option.evalvalue==2),
//    onPressed:()=> setState(() { widget.option.evalvalue=2; }),

//       ),
//                       ElevatedButton(
//       child: Text( "3", style:  TextStyle(color: widget.option.evalvalue==3?Colors.white:Colors.black), ),
//       style: roundedButtonStyle(widget.option.evalvalue==3),
//    onPressed:()=> setState(() { widget.option.evalvalue=3; }),

//       ),
//                    ElevatedButton(
//       child: Text( "4", style:  TextStyle(color: widget.option.evalvalue==4?Colors.white:Colors.black), ),
//       style: roundedButtonStyle(widget.option.evalvalue==4),
//    onPressed:()=> setState(() { widget.option.evalvalue=4; }),

//       ),
//        ElevatedButton(
//       child: Text( "5", style:  TextStyle(color: widget.option.evalvalue==5?Colors.white:Colors.black), ),
//       style: roundedButtonStyle(widget.option.evalvalue==5),
//    onPressed:()=> setState(() { widget.option.evalvalue=5; }),
//       )                 
//                             ],
//                           ),
                         
//          SizedBox(height:10),                    
// Divider(),
//                         ],
//                       ));
 
//     //  ListTile(title:Text(option.emp),onTap:()=>
    
//     //    setState(() {
//     //         option.emp=option.emp+"t";

//     // }),;
//   }



//}
