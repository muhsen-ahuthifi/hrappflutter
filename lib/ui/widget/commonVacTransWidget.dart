
import 'package:flutter/material.dart';
import 'AppTheme.dart';
smartBadgLabel(String title,String val,CrossAxisAlignment crossAxisAlignment)=>
 Expanded(
                            child:      Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:crossAxisAlignment ,
                         
                                  children: <Widget>[
                                    Text(
                                      val,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: -0.2,
                                        color: SmartAppTheme.darkText,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: Text(
                                       title,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: SmartAppTheme.grey
                                              .withOpacity(0.8),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                             
                          );
smartBadgTitle(String title,String val)=>
 
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 4, bottom: 3),
                                    child: Text(
                                      val,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 32,
                                        color: SmartAppTheme.colorPrimary,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8, bottom: 8),
                                    child: Text(
                                      title,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: -0.2,
                                        color: SmartAppTheme.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              );




      smartVacTransState(bool appreoved,bool reject,String appreoveState)=>
         
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                     reject? Icon(Icons.close, color: Colors.red,size: 30): appreoved?
                                      Icon(Icons.thumb_up, color: Colors.blue,size: 30)
                                      : Icon(Icons.access_time, color: Colors.orange,size: 30),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4, bottom: 14),
                                    child: Text(
                                      appreoveState,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        letterSpacing: 0.0,
                                        color: SmartAppTheme.nearlyDarkBlue,
                                      ),
                                    ),
                                  ),
                                ],
                              ) ;                        


            smartVacSubTitle(String title,String val)=>
                   Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                              children:[ 
                             
                         Padding(
                            padding: const EdgeInsets.only(left:4,right: 4, bottom: 2),
                            child: Text(
                              val,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  letterSpacing: -0.1,
                                  color: SmartAppTheme.lightText),
                            ),
                         
                      ),
                         Padding(
                                    padding: const EdgeInsets.only(
                                        right: 2, bottom: 8),
                                    child: Text(
                                      title,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                         fontSize: 12,
                                        letterSpacing: -0.2,
                                        color: SmartAppTheme.nearlyDarkBlue,
                                      ),
                                    ),
                                  ),
                                
                      ],
                      );
                                            


                smartVacTypeTitle(String val)=>
                    Row(
                                    children: <Widget>[
                                      Container(
                                        height: 20,
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
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4,top: 2, bottom: 2),
                                              child: Text(
                                                val,                                             
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18,
                                                  letterSpacing: -0.1,
                                                  color: SmartAppTheme.darkText
                                                      
                                                ),
                                              ),
                                            ),
                                        
                                          ],
                                        ),
                                      )
                                    ],
                                  );
                                