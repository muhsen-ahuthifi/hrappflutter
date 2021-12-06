
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrapp/model/eval/eval_base.dart';
import 'package:hrapp/ui/widget/AppTheme.dart';

class EvalNoteDetailPage extends StatelessWidget {
    final BaseEvalPanal vm;

  EvalNoteDetailPage({Key key, this.vm}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final levelIndicator = Container(
    //   child: Container(
    //     child: LinearProgressIndicator(
    //         backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
    //         value: lesson.indicatorValue,
    //         valueColor: AlwaysStoppedAnimation(Colors.green)),
    //   ),
    // );

    // final coursePrice = Container(
    //   padding: const EdgeInsets.all(7.0),
    //   decoration: new BoxDecoration(
    //       border: new Border.all(color: Colors.white),
    //       borderRadius: BorderRadius.circular(5.0)),
    //   child: new Text(
    //     "\%" + vm.pg.toString(),
    //     style: TextStyle(color: Colors.white),
    //   ),
    // );

  
    // final topContent = Stack(
    //   children: <Widget>[
    //     Container(
    //         padding: EdgeInsets.only(left: 10.0),
    //         height: MediaQuery.of(context).size.height * 0.5,
    //         decoration: new BoxDecoration(
    //           image: new DecorationImage(
    //             image: new AssetImage("drive-steering-wheel.jpg"),
    //             fit: BoxFit.cover,
    //           ),
    //         )),
    //     // Container(
    //     //   height: MediaQuery.of(context).size.height * 0.5,
    //     //   padding: EdgeInsets.all(40.0),
    //     //   width: MediaQuery.of(context).size.width,
    //     //   decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
    //     //   child: Center(
    //     //     child: topContentText,
    //     //   ),
    //     // ),
    //     Positioned(
    //       left: 8.0,
    //       top: 60.0,
    //       child: InkWell(
    //         onTap: () {
    //           Navigator.pop(context);
    //         },
    //         child: Icon(Icons.arrow_back, color: Colors.white),
    //       ),
    //     )
    //   ],
    // );

    final strongthContentTitle =
     Padding(
     padding: const EdgeInsets.only(left: 2, bottom: 10), 
    child: Text(
      "مواطن القوة",
      style:SmartAppTheme.lightHeadline,
       textAlign: TextAlign.start,
    ));

      final strongthContentText = Text(
      vm.strongth,
      style: SmartAppTheme.defaultIosTextStype,
        textAlign: TextAlign.start,
    );

       final weaknessContentTitle =
     Padding(
     padding: const EdgeInsets.only(left: 2, bottom: 10), 
    child: Text(
      "نقاط الضعف ",
      style:SmartAppTheme.lightHeadline,
       textAlign: TextAlign.start,
    ));

      final weaknessContentText = Text(
      vm.weakness,
      style: SmartAppTheme.defaultIosTextStype,
        textAlign: TextAlign.start,
    );

          final noteContentTitle =
     Padding(
     padding: const EdgeInsets.only(left: 2, bottom: 10), 
    child: Text(
      "ملاحظات",
      style:SmartAppTheme.lightHeadline,
       textAlign: TextAlign.start,
    ));

      final noteContentText = Text(
      vm.advice,
      style: SmartAppTheme.defaultIosTextStype,
        textAlign: TextAlign.start,
    );
    // final readButton = Container(
    //     padding: EdgeInsets.symmetric(vertical: 16.0),
    //     width: MediaQuery.of(context).size.width,
    //     child: RaisedButton(
    //       onPressed: () => {},
    //       color: Color.fromRGBO(58, 66, 86, 1.0),
    //       child:
    //           Text("TAKE THIS LESSON", style: TextStyle(color: Colors.white)),
    //     ));
    final bottomContent = Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // color: Theme.of(context).primaryColor,
      padding: EdgeInsets.all(24.0),
      
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[strongthContentTitle,strongthContentText,
          //  SizedBox(height: 20),
                 Padding(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, top: 22, bottom: 22),
                      child: Container(
                        height: 2,
                        decoration: BoxDecoration(
                          color: SmartAppTheme.background,
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                      ),
                    ),
          weaknessContentTitle,weaknessContentText,
           Padding(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, top: 22, bottom: 22),
                      child: Container(
                        height: 2,
                        decoration: BoxDecoration(
                          color: SmartAppTheme.background,
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                      ),
                    ),
          noteContentTitle,noteContentText
          ],
        ),
     
    );

    return CupertinoPageScaffold(
       backgroundColor: SmartAppTheme.scaffoldBackground,
      
           navigationBar: CupertinoNavigationBar(
//border:null ,
           middle:  Text( vm.emp,style: SmartAppTheme.defaultIosTextStype, ),
           ),
      child: 
           SafeArea(
          bottom: false,
            child:
      Material(
     child: Column(
        children: <Widget>[ bottomContent],
      ),
      )  ));
  }
}