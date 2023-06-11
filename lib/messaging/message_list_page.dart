
import 'package:flutter/material.dart';

import '../services/smartApiService.dart';
import '../ui/widget/list_view.dart';
import '../util/shared_preference.dart';
// Page


class MessageListPage extends StatelessWidget {

  const MessageListPage({super. key});

 
 @override
  Widget build(BuildContext context) {
   return NgListView(
      dataLoader: (context) =>loadData(),
      itemBuilder: (context,row, index,loadDataFun) =>_buildRow(context, row) ,
    );

  }

  Future<ApiListResults<NotificationModel>> loadData() async{
   final data=await UserPreferences.getNotificationList();
  return ApiListResults(success: true, data: data);
  }

Widget _buildRow(BuildContext context,NotificationModel row) {
 return _ListRowView(
              item: row,
              callback: () {
                // smartSuccessToast(context, 'الحالة', row.getAriaValue());
              }
              );
       
}
 

  
}
class _ListRowView extends StatelessWidget {
  const _ListRowView({
    required this.item,
   required this.callback,
    // super.key,
  });
  final VoidCallback callback;

  final NotificationModel item;
  
  @override
  Widget build(BuildContext context) {
      return ListTile(
      
            title: Text(
              semanticsLabel: item.title,
                item.title),
            subtitle:
                Text(item.msg,semanticsLabel: item.msg),
            onTap:callback,
            trailing:  Text(item.date??"",semanticsLabel: item.date),
            
          );
  }
  }
