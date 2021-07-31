import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'AppTheme.dart';

//errorView(String msg) => Text("${msg}");
loadingView()=> Center(child:CircularProgressIndicator());
//noResultViewView() => Center(child: Text("no result"));


  Widget noResultViewView() {
     
     return ListView( children:[ Center(child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
       children:[
     Image.asset('res/img/bg_no_item_cactus.png',alignment: Alignment.center),
          ] ))]
    );
  }
  Widget errorView(String msg) {
     
     return  ListView( children:[ Column(
       children:[
      Container(
    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
         // borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
         color: Colors.red,
              ),
      child: Text( msg,style: TextStyle(fontSize: 16, color: Colors.white),
      ),
          ),] 
    )]);
  }


cardBoxDecoration()=>
 BoxDecoration(
                color: SmartAppTheme.cardBackground,
              //   backgroundBlendMode: BlendMode.dstOver,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      topLeft: Radius.circular(68.0)),
                  boxShadow:[
                    BoxShadow(
                        color: SmartAppTheme.grey.withOpacity(0.2),
                        offset: Offset(1.1, 1.1),
                        blurRadius: 5.0),
                  ],
                );

cardFlatBoxDecoration()=>
 BoxDecoration(
                color: SmartAppTheme.cardBackground,
              //   backgroundBlendMode: BlendMode.dstOver,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      topLeft: Radius.circular(8.0)),
                  boxShadow:[
                    BoxShadow(
                        color: SmartAppTheme.grey.withOpacity(0.2),
                        offset: Offset(1.1, 1.1),
                        blurRadius: 2.0),
                  ],
                );



smartErrorToast(BuildContext context,String title,String msg)=> Flushbar( title: title,message:msg,duration: Duration(seconds: 3),backgroundColor: Colors.redAccent,).show(context);
smartSuccessToast(BuildContext context,String title,String msg)=> Flushbar( title: title,message:msg,duration: Duration(seconds: 3),backgroundColor: Colors.blue,).show(context);


    smartConfirmDialog(BuildContext context,String title,String msg,Function okFn) {
    showDialog(
      context: context,
      
      builder: (context) => AlertDialog(
      title:Text(title),
       content:Text(msg,textAlign: TextAlign.center),
       actions: [
         TextButton(onPressed: okFn, child: const Text('موافق')),

       ],

      ),
    );
}
class DialogOptions {
  String key;
  String label;
  bool checked;
   bool reject;
    DialogOptions({this.key, this.label,this.checked,this.reject});

  }

    smartOptionsDialog(BuildContext context,String title,List<DialogOptions> options,Function(String key) callbackFn) {
    showDialog(
      context: context,      
      builder: (context) => 
      SimpleDialog(
      title:Text(title),
     //  content:Text(msg,textAlign: TextAlign.center),
     children:options.map((option) =>  ListTile(title:Text(option.label),onTap:()=>Navigator.pop(context,option.key))).toList(),

      ),
    ).then((value) => {
      if(value!=null){
        callbackFn(value)
      }
    });
}

smartStateDialog(BuildContext context,String title,List<DialogOptions> options,final List<Widget> children) {
    showModalBottomSheet(
      context: context,  
          
      builder: (context) => 
      ListView(
        
    //  title:Text(title),
     //  content:Text(msg,textAlign: TextAlign.center),
     children:[...options.map((option) =>  ListTile(title:Text(option.label),leading:option.reject?const Icon(Icons.close,color:Colors.red): option.checked?const Icon(Icons.check_circle,color:Colors.blue):const Icon(Icons.access_time,color: Colors.orange),)).toList(),...children],

      ),
    );
}


  Widget navBackButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
    

  }

smartOptionsBottomSheet(BuildContext context,String title,List<DialogOptions> options,Function(String key) callbackFn) {
    showModalBottomSheet(
      context: context,      
      builder: (context) => 
      ListView(
     // title:Text(title),
     //  content:Text(msg,textAlign: TextAlign.center),
     children:options.map((option) =>  ListTile(title:Text(option.label),onTap:()=>Navigator.pop(context,option.key))).toList(),

      ),
    ).then((value) => {
      if(value!=null){
        callbackFn(value)
      }
    });
}
class CurvePainter extends CustomPainter {
  final double angle;
  //final List<Color> colors;

  CurvePainter({ this.angle = 140});

  @override
  void paint(Canvas canvas, Size size) {
   List<Color> colors = [
                                             Colors.red,
                                           
                                           Colors.blue,
                                             Colors.green,
                                            // Color(0xFF8A98E8),
                                            // Color(0xFF8A98E8),
                                            // SmartAppTheme.nearlyDarkBlue

                                          ];
    // if (colors = null) {
    //   colorsList = colors ?? [];
    // } else {
    //   colorsList.addAll([Colors.white, Colors.white]);
    // }
     // colorsList.addAll([Colors.white, Colors.white]);
//colorsList=colors;
    // final shdowPaint = new Paint()
    //   ..color = Colors.black.withOpacity(0.4)
    //   ..strokeCap = StrokeCap.round
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 8;
    // final shdowPaintCenter = new Offset(size.width / 2, size.height / 2);
    // final shdowPaintRadius =
    //     math.min(size.width / 2, size.height / 2) - (8 / 2);
    // canvas.drawArc(
    //     new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
    //     degreeToRadians(278),
    //     degreeToRadians(360 - (365 - angle)),
    //     false,
    //     shdowPaint);

    // shdowPaint.color = Colors.grey.withOpacity(0.3);
    // shdowPaint.strokeWidth = 8;
    // canvas.drawArc(
    //     new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
    //     degreeToRadians(278),
    //     degreeToRadians(360 - (365 - angle)),
    //     false,
    //     shdowPaint);

    // shdowPaint.color = Colors.grey.withOpacity(0.2);
    // shdowPaint.strokeWidth = 6;
    // canvas.drawArc(
    //     new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
    //     degreeToRadians(278),
    //     degreeToRadians(360 - (365 - angle)),
    //     false,
    //     shdowPaint);

    // shdowPaint.color = Colors.grey.withOpacity(0.1);
    // shdowPaint.strokeWidth = 8;
    // canvas.drawArc(
    //     new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
    //     degreeToRadians(278),
    //     degreeToRadians(360 - (365 - angle)),
    //     false,
    //     shdowPaint);

    final rect = new Rect.fromLTWH(0.0, 0.0, size.width, size.width);
    final gradient = new SweepGradient(
      startAngle: degreeToRadians(268),
      endAngle: degreeToRadians(270.0 + 360),
      tileMode: TileMode.repeated,
      colors: colors,
    );
    final paint = new Paint()
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.butt // StrokeCap.round is not recommended.
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;
    final center = new Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2) - (6 / 2);

    canvas.drawArc(
        new Rect.fromCircle(center: center, radius: radius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle)),
        false,
        paint);

    // final gradient1 = new SweepGradient(
    //   tileMode: TileMode.repeated,
    //   colors: [Colors.white, Colors.white],
    // );

    // var cPaint = new Paint();
    // cPaint..shader = gradient1.createShader(rect);
    // cPaint..color = Colors.white;
    // cPaint..strokeWidth = 14 / 2;
    //
    //canvas.save();

    // final centerToCircle = size.width / 2;
    // canvas.save();

    //  canvas.translate(centerToCircle, centerToCircle);
    //  canvas.rotate(degreeToRadians(angle+ 2));

  //   canvas.save();
    //  canvas.translate(0.0, -centerToCircle + 14 / 2);
  // canvas.drawCircle(new Offset(0, 0), 14 / 5, cPaint);
  //   canvas.restore();
   // canvas.restore();
    // canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  double degreeToRadians(double degree) {
    var redian = (math.pi / 180) * degree;
    return redian;
  }
}
//,MainAxisAlignment mainAxisAlignment,CrossAxisAlignment crossAxisAlignment
    //      MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    // CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
