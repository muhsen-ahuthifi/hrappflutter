import 'package:flutter/material.dart';

import 'package:hrapp/ui/widget/AppTheme.dart';
import 'package:hrapp/ui/widget/commonVacTransWidget.dart';
import 'package:hrapp/ui/widget/commonWidget.dart';
import 'package:hrapp/util/app_url.dart';
import '../../model/vacations/vacation_trans_panal.dart';
import '../../services/smartApiService.dart';
import '../widget/list_view.dart';


class VacationTransPage extends StatelessWidget {
 const VacationTransPage({super.key});






  @override
  Widget build(BuildContext context) {
   return NgListView(
      dataLoader: (context) =>fetchPanelData(AppUrl.VacationTransPanel,
        (row) => new VacationTransPanel.fromJson(row)) ,
      itemBuilder: (context,row, index,loadDataFun) =>_buildRow(context, row,loadDataFun) ,
    );

  }
 
Widget _buildRow(BuildContext context,VacationTransPanel row,VoidCallback loadDataFun) {
   return _ListRowView(data: row,
           callback: () {
            smartSuccessToast(context,'الحالة',row.getAriaValue());
          });
}

}



class _ListRowView extends StatelessWidget {

  final VacationTransPanel data;

  const _ListRowView({required this.data,required this.callback});
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return
     Semantics(
      label: data.getAriaLabel(),
        value: data.getAriaValue(),

      excludeSemantics: true,
      link: true,
     // onTap: callback,
child: 
   InkWell(
               splashColor: Colors.transparent,
                onTap: callback,
                child:Container(
      
       margin:  EdgeInsets.only(top: 8, bottom: 8),
              decoration: cardBoxDecoration(),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 16, right: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                         smartVacTypeTitle(data.monitortype),
                          SizedBox(height:5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              smartBadgTitle("يوم",data.period.toString()),
                             smartVacTransState(data.appreoved,data.req_reject,data.appreoveState),
                            ],
                          ),
                          smartVacSubTitle('المناوب',data.spareEmp),
                        
                        ],
                      ),
                    ),
                    
                   
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, top: 8, bottom: 8),
                      child: Container(
                        height: 2,
                        decoration: BoxDecoration(
                          color: SmartAppTheme.divider,
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16),
                      child: Row(
                        children: <Widget>[
                        smartBadgLabel( 'من تاريخ',data.fromDate.toString(),CrossAxisAlignment.start),
                         smartBadgLabel('الى تاريخ',data.toDate.toString(),CrossAxisAlignment.center),
                         smartBadgLabel('الرصيد',data.bal.toString(),CrossAxisAlignment.end),
                        ],
                      ),
                    )
                  ],
                ),
               ),
               ));
  }
}