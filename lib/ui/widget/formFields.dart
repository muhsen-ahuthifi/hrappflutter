import 'package:flutter/material.dart';
import 'package:hrapp/ui/widget/AppTheme.dart';


  Widget entryField(String title,Function onSaveFn,Function validatorFn,  {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
              obscureText: isPassword,
               validator: validatorFn,
               style: SmartAppTheme.defaultTextStyle,
               onSaved: onSaveFn,//(value) => _password = value,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  
                  //fillColor: Color(0xfff3f3f4),
                    labelText: title,
                  filled: false))
        ],
      ),
    );
  }


  Widget submitButton(BuildContext context,String title,Function fun) {
     
     return InkWell(
      onTap: fun,
      child:Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.lightBlue.shade700, Colors.lightBlue.shade700])),
      child: Text( title,style: TextStyle(fontSize: 16, color: Colors.white,fontFamily: SmartAppTheme.fontName),
      ),
          ),
    );
  }


Widget smartLoadingButton(String title)=>  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Text(" ... يرجى الانتظار",style: TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.w500,fontFamily: SmartAppTheme.fontName))
      ],
    );

   Widget smartSubmitButton(BuildContext context,String title,Function fun)=> 
    new Padding(
              padding: const EdgeInsets.all(1.0),
              child: ElevatedButton(
                
                child:Text( title,style: TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.w500,fontFamily: SmartAppTheme.fontName)),
                onPressed: fun,
                
              //  elevation: 4.0, MediaQuery.of(context).size.width
                 style: ButtonStyle(
                   
                  // padding: MaterialStateProperty.all(EdgeInsets.only(left:20.0,right:20)),
                   elevation:MaterialStateProperty.all(0.0),
                   minimumSize:MaterialStateProperty.all(Size(200,52)) ,
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(SmartAppTheme.btnPrimary),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          //  side: BorderSide(color: Colors.red)
          )
        )
      ),
              //  minWidth: double.infinity,
              //  height: 52.0,
              //  color: Colors.blue,
              ),
            );






            