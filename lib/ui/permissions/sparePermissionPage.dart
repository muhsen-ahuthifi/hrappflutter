import 'package:flutter/material.dart';
import 'package:hrapp/model/permissions/spare_permission_panel.dart';
import 'package:hrapp/ui/widget/commonVacTransWidget.dart';
import 'package:hrapp/ui/widget/commonWidget.dart';
import 'package:hrapp/util/app_url.dart';
import '../../services/smartApiService.dart';
import 'package:hrapp/ui/widget/AppTheme.dart';

import '../widget/list_view.dart';


class SparePermissionPage extends StatelessWidget {

 const SparePermissionPage({super.key});



 @override
  Widget build(BuildContext context) {
   return NgListView(
      dataLoader: (context) =>fetchPanelData(AppUrl.SparePermissionPanel,
        (row) => new SparePermissionPanel.fromJson(row)) ,
      itemBuilder: (context,row, index,loadfun) =>_buildRow(context, row) ,
    );

  }

  

Widget _buildRow(BuildContext context,SparePermissionPanel row) {

       return _ListRowView(
              data:row,
              callback: () {
                smartSuccessToast(context, 'الحالة', row.getAriaValue());

      
              });
}
 

 


 
}

class _ListRowView extends StatelessWidget {
  final SparePermissionPanel data;

  const _ListRowView({required this.data, required this.callback});
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Semantics(
        label: data.getAriaLabel(),
        value: data.getAriaValue(),
        excludeSemantics: true,
        //  link: true,
        //  onTap: callback,
        child: InkWell(
          splashColor: Colors.transparent,
          onTap: callback,
          child: Container(
            margin: EdgeInsets.only(top: 8, bottom: 8),
            decoration: cardBoxDecoration(),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //       right: 4, bottom: 8, top: 16),
                      //   child: Text(
                      //     data.monitortype,
                      //     textAlign: TextAlign.center,
                      //     style: TextStyle(

                      //         fontFamily: SmartAppTheme.fontName,
                      //         fontWeight: FontWeight.w500,
                      //         fontSize: 16,
                      //         letterSpacing: -0.1,
                      //         color: SmartAppTheme.darkText),
                      //   ),
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          smartBadgTitle("ساعة", data.period.toString()),
                        ],
                      ),
                      smartVacSubTitle('الموظف', data.emp),
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
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 8, bottom: 16),
                  child: Row(
                    children: <Widget>[
                      smartBadgLabel('من الساعة', data.fromHour.toString(),
                          CrossAxisAlignment.start),
                      smartBadgLabel('الى الساعة', data.toHour.toString(),
                          CrossAxisAlignment.center),
                      smartBadgLabel('بتاريخ', data.atDate.toString(),
                          CrossAxisAlignment.end),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
