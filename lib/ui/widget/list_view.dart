import 'package:flutter/material.dart';
import 'package:hrapp/services/smartApiService.dart';
import 'package:provider/provider.dart';

import '../../messaging/permissions.dart';
import '../../providers/user_provider.dart';
import '../../util/shared_preference.dart';
import 'commonWidget.dart';
enum NgListBodyType {
  loading,
  // no_result,
  results,
  error,
}
typedef NgListDataLoaderFun<T> = Future<ApiListResults<T>> Function(
    BuildContext context);
typedef NgListRowWidgetBuilder<TRow> = Widget Function(
    BuildContext context, TRow row, int index,VoidCallback loadDataFun);


class NgListView<T> extends StatefulWidget {
 const NgListView({super. key,
 required this.dataLoader,
 required this.itemBuilder});
  final NgListDataLoaderFun<T> dataLoader;
  final NgListRowWidgetBuilder<T> itemBuilder;

  @override
  State<StatefulWidget> createState() {
    return _NgListViewState<T>();
  }
}
class _NgListViewState<T> extends State<NgListView<T>> {
ApiListResults<T>? response;
  Object? _activeCallbackIdentity;
NgListBodyType ?_currentBody=NgListBodyType.loading;
  Object? _error;

// Future<T> _getData() {
//    return widget.dataLoader(context)
//   .then((result) {
//        if (mounted) {
//     setState(() {
//       response = result;
//     });
// }
//   });
// }
    @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  if (_activeCallbackIdentity != null) 
    _futureUnsubscribe();
      
    // if(widget.dataSource._currentBody!=NgListBodyType.results)  
    _futureSubscribe();
  }

  void _setResponse(BuildContext context,ApiListResults<T> result) {
    // setResult(context, response);
      setState(() {
      response = result;
        _currentBody = result.success==true
              ? NgListBodyType.results
              : NgListBodyType.error;
              _error=result.message;
    });

 
  }
  void _onError(Object error) {
    _currentBody = NgListBodyType.error;
  _error=error;
  }
  
  Future<void> _loadData(bool asRefresh) async {
    final Object callbackIdentity = Object();
    _activeCallbackIdentity = callbackIdentity;
   
     await widget.dataLoader(context)
    .then<void>((result) {
      if (mounted && _activeCallbackIdentity == callbackIdentity) {
        _setResponse(context,result);
   
      }
    }, onError: (Object error) {
      if (mounted && _activeCallbackIdentity == callbackIdentity) {
        _onError(error);
      if(error is NgUnAuthorizedException){
       
         UserPreferences.removeUser();
        final empId=Provider.of<UserProvider>(context, listen: false).removeUser();
         NgNotificationManager.unSubscribe(empId);
        //  Navigator.pushReplacementNamed(context, '/login');
           Navigator.of(context, rootNavigator: true).pushReplacementNamed(
            '/login');
      }
        // print(error);
      }
    });

  
  }
  void _futureUnsubscribe() {
    _activeCallbackIdentity = null;
  }
    void _futureSubscribe() {
     _loadData(false);
     _onLoading();
  }

void _onLoading() {
    _currentBody= NgListBodyType.loading;

  }

// @override
// void initState() {
// super.initState();
//   this._getData();
// }

  @override
  Widget build(BuildContext context) {
return RefreshIndicator(
    onRefresh: _onRefresh,
    child: getCurrentView(context));
  
  }

  Future<void> _onRefresh() async{
  //  if(widget.dataSource.currentBody==NgListBodyType.error)
    return _loadData(true);
  }
  void loadDataFun(){
       _loadData(true);

  }
  Widget getCurrentView(BuildContext context) {
 
  if(response==null||_currentBody==NgListBodyType.loading)
  return loadingView();

     
        if(_currentBody==NgListBodyType.error)
          return  errorView(_error?.toString()??"Error");

          
          List<T> data = response!.data;
         
          if(data.length==0)
          return  noResultViewView();
          else return _smartListView(context,data);
          
          
        
      
 
  }
 @override
  void dispose() {
    _futureUnsubscribe();
   
    super.dispose();
  }

  ListView _smartListView(BuildContext context,List<T> data) {
 
    return ListView.builder(
      
        itemCount: data.length,
         scrollDirection: Axis.vertical,
           padding: EdgeInsets.only( left:16,right: 16,bottom: 62 + MediaQuery.of(context).padding.bottom, ),
        itemBuilder: (context, index) {
        return widget.itemBuilder(context,data[index],index,loadDataFun);
        });
  }

  
}

