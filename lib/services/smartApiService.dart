import 'dart:async';
import 'dart:convert';
import 'package:hrapp/util/shared_preference.dart';
import 'package:http/http.dart' as http;

typedef dataRowJson<T> = T Function(Map<String, dynamic> json);

class NgUnAuthorizedException implements Exception {

  NgUnAuthorizedException();

}
class ApiListResults<T> {
  ApiListResults({required this.success, required this.data, this.message});
 final bool success;
  final String? message;
 final List<T> data;
}

Future<ApiListResults<T>> fetchPanelData<T>(
    String url, dataRowJson<T> rowFactory) async {
  final String token = await UserPreferences.getToken();
  final response =
      await http.get(Uri.parse(url), headers: {'authorization': 'Bearer ' + token});
   
   if(response.statusCode==401) 
  return Future.error(NgUnAuthorizedException());
        
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body)['results']['rows'];
    return ApiListResults<T>(
        success: true,
        data: jsonResponse.map((row) => rowFactory(row)).toList());
  } else {
    // return AsyncSnapshot.withError(ConnectionState.done, 'Failed to load data from API')
    return ApiListResults<T>(
        success: false,
        data: [],
        message: json.decode(response.body)['message']);
  }
}

Future<ApiListResults<T>> featchItemSelectData<T>(
    String url, dataRowJson<T> rowFactory) async {
  final String token = await UserPreferences.getToken();
  
  final response =
      await http.get(Uri.parse(url), headers: {'authorization': 'Bearer ' + token});

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body)['results'];
    return ApiListResults<T>(
        success: true,
        data: jsonResponse.map((row) => rowFactory(row)).toList());
  } else {
    return ApiListResults<T>(
        success: false,
        data: [],
        message: json.decode(response.body)['message']);
  }
}

Future<Map<String, dynamic>> postFormData(
    String url, Map<String, dynamic> formData) async {
  final String token = await UserPreferences.getToken();
  return await http
      .post(Uri.parse(url), body: json.encode(formData), headers: {
        'Content-Type': 'application/json',
        'authorization': 'Bearer ' + token
      })
      
      .then(onValue)
      .catchError(onError);
  //   print('go1111111111111');
}

Future<Map<String, dynamic>> putFormData(
    String url, Map<String, dynamic> formData) async {
  final String token = await UserPreferences.getToken();
  return await http
      .put(Uri.parse(url), body: json.encode(formData), headers: {
        'Content-Type': 'application/json',
        'authorization': 'Bearer ' + token
      })
      .then(onValue)
      .catchError(onError);
  //   print('go1111111111111');
}

Future<ApiListResults<T>> fetchEvalDocTermsData<T>(
    String url, dataRowJson<T> rowFactory) async {
  final String token = await UserPreferences.getToken();
  final response =
      await http.get(Uri.parse(url), headers: {'authorization': 'Bearer ' + token});
   
   if(response.statusCode==401) 
  return Future.error(NgUnAuthorizedException());
       
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body)['results']['details'];
    return ApiListResults<T>(
        success: true,
        data: jsonResponse.map((row) => rowFactory(row)).toList());
  } else {
    // return AsyncSnapshot.withError(ConnectionState.done, 'Failed to load data from API')
    return ApiListResults<T>(
        success: false,
        data: [],
        message: json.decode(response.body)['message']);
  }
}

Future<Map<String, dynamic> > onValue(http.Response response) async {
  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = json.decode(response.body);
    return responseData;
  } else {
    //print(json.decode(response.body)["message"]);
//      if (response.statusCode == 401) Get.toNamed("/login");
    return {
      'success': false,
      'message': json.decode(response.body)["message"] ?? 'Post failed',
    };
  }
}

onError(error) {
  return {'success': false, 'message': 'Failed to add a post: $error'};
}
