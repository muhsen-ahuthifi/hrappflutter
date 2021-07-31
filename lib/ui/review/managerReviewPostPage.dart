import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hrapp/ui/widget/AppTheme.dart';
import 'package:hrapp/ui/widget/formFields.dart';
// import 'package:hrapp/model/ManagerReview/ManagerReviewPostVM.dart';
import 'package:http/http.dart' as http;

class ManagerReviewPostPage extends StatefulWidget {
  const ManagerReviewPostPage({Key key,@required this.vm,@required this.postType,@required this.rejected}) : super(key: key);

  final dynamic vm;
  final String postType;
  final bool rejected;

  @override
  _ManagerReviewPostPageState createState() => _ManagerReviewPostPageState(vm: this.vm,postType:this.postType,rejected:this.rejected);
}

class _ManagerReviewPostPageState extends State<ManagerReviewPostPage> {
   _ManagerReviewPostPageState({@required this.vm,@required this.postType,@required this.rejected}) ;
    final dynamic vm;
    final String postType;
  final bool rejected;


  TextEditingController _titleController;
  TextEditingController _contentController;
  TextEditingController _userIdController;
  String _responseBody = '<empty>';
  String _error = '<none>';
  bool _pending = false;

  @override
  void initState() {
    super.initState();
    this._contentController = TextEditingController();
    this._titleController = TextEditingController();
    this._userIdController = TextEditingController();
    _reset();
  }

  @override
  Widget build(BuildContext context) {
     //   final height = MediaQuery.of(context).size.height;

    return Scaffold(
       backgroundColor: SmartAppTheme.white,
       appBar: AppBar(
         //  title:  Text( this.vm.monitortype, style: SmartAppTheme.headline),
           backgroundColor: SmartAppTheme.white,
           elevation: 0,
            iconTheme: IconThemeData(color: SmartAppTheme.iconColor),
       ),
        body: Container(
     // height: height,
      child: Stack(
        children: [
             
 //Positioned(top: 40, left: 0, child: navBackButton(context)),
          // Positioned(top: -height * .15,right: -MediaQuery.of(context).size.width * .4,child: BezierContainer()),
          Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .1 ),
            child: SingleChildScrollView(
        child:Container(
     // padding: const EdgeInsets.all(16.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
      children:  [
      //  navBackButton(context),
             const SizedBox(height: 10),
     Text( this.vm.monitortype, style: SmartAppTheme.lightHeadline),
        const Divider(),
      const SizedBox(height: 10),
  
        TextField(
          controller: this._titleController,
          decoration: const InputDecoration(
            labelText: 'Title',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: this._contentController,
          maxLines: null,
          decoration: const InputDecoration(
            labelText: 'Content',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: this._userIdController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'UserId',
            border: OutlineInputBorder(),
          ),
        ),
                const SizedBox(height: 20),

             smartSubmitButton(context,'ارسال الطلب',_pending
                  ? null
                  : () => this._httpPost(
                        _titleController.text,
                        _contentController.text,
                        _userIdController.text,
                      )),

   
      //  Text('Response body=$_responseBody'),
        //const Divider(),
      //  Text('Error=$_error'),
      ],
      )

        ),
            ),
          ),
        ]
      ),
      ),
         
           
            
    );
  }

  void _reset({bool resetControllers = true}) {
    setState(() {
      if (resetControllers) {
        this._titleController.text = 'Lorem Ipsum Title';
        this._contentController.text =
            '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Egestas congue quisque egestas diam in arcu. Quis imperdiet massa tincidunt nunc pulvinar. ''';
        this._userIdController.text = '1';
      }
      this._responseBody = '<empty>';
      this._error = '<none>';
      this._pending = false;
    });
  }

  Future<void> _httpPost(String title, String body, String userId) async {
    _reset(resetControllers: false);
    setState(() => this._pending = true);
    try {
      final http.Response response = await http.post(
        'https://jsonplaceholder.typicode.com/posts',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'title': title,
          'body': body,
          'userId': userId,
        }),
      );
      // If the server did return a 201 CREATED response.
      if (response.statusCode == 201) {
        setState(() => this._responseBody = response.body);
      } else {
        setState(() => this._error = 'Failed to add a post: $response');
      }
    } catch (e) {
      setState(() => this._error = 'Failed to add a post: $e');
    }
    setState(() => this._pending = false);
  }
}