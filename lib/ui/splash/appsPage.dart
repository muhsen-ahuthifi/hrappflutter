import 'package:flutter/material.dart';
import 'package:hrapp/ui/widget/AppTheme.dart';
import '../home/homePage.dart';
import '../../util/homeSysKey.dart';

class AppsPage extends StatefulWidget {
  AppsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AppsPageState createState() => _AppsPageState();
}

class _AppsPageState extends State<AppsPage> {



   Widget _appButton(String title,HomeSysKey uiType)=> 
    new Padding(
              padding: const EdgeInsets.all(1.0),
              child: ElevatedButton(
                
                child:Text( title,style: TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.bold)),
              
             onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage(uiType: uiType)));
      },
              //  elevation: 4.0, MediaQuery.of(context).size.width
                 style: ButtonStyle(
                  // padding: MaterialStateProperty.all(EdgeInsets.only(left:20.0,right:20)),
                   elevation:MaterialStateProperty.all(0.0),
                   minimumSize:MaterialStateProperty.all(Size(160,160)) ,
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(SmartAppTheme.btnPrimary),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          )
        )
      ),
              ),
            );


  @override
  Widget build(BuildContext context) {
     
    return DefaultTabController(
      length: 3,
      child:Scaffold(
        backgroundColor: SmartAppTheme.white,
      body:  Column(
        
         crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             Expanded(
               child:  TabBarView(
                 
             children: [
                Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.center,
                  children:[_appButton("الاجازات",HomeSysKey.Vacation)],
                ),
                  Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.center,
                  children:[_appButton("التقييمات",HomeSysKey.Eval)],
                ),
                  Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.center,
                  children:[ _appButton("الاعتماد",HomeSysKey.Manager)],
                ),
                  
                  ]),
             ),
              // Expanded(
         const TabPageSelector(),
         SizedBox(height:20)
            
            ],
          ),
     //   ),
     ),
    );
  }
 
}







//  @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor:SmartAppTheme.white,
//       body:SingleChildScrollView(
//         child:Container(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             height: MediaQuery.of(context).size.height,
//             width:  MediaQuery.of(context).size.width,
          
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 _appButton("الاجازات",HomeSysKey.Vacation),
//                 SizedBox(height: 20),
//                 _appButton("التقييمات",HomeSysKey.Eval),
//                 SizedBox( height: 20),
//                 _appButton("الاعتماد",HomeSysKey.Manager),
               
//               ],
//             ),
//           ),
//       ),
//     );
//   }