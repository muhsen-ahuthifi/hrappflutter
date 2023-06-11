import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrapp/model/vacations/managerPostVM.dart';
import 'package:hrapp/model/vacations/vacationsPostVM.dart';
import 'package:hrapp/services/smartApiService.dart';
import 'package:hrapp/ui/widget/AppTheme.dart';
import 'package:hrapp/ui/widget/commonWidget.dart';
import 'package:hrapp/ui/widget/formFields.dart';
import 'package:hrapp/util/app_url.dart';


class ManagerReviewPostPage extends StatefulWidget {
  const ManagerReviewPostPage({super.key, required this.vm, required this.postType})
      ;

  final ManagerVacTransPostVM vm;
  final String postType;
 //final bool rejected;
  @override
  _ManagerReviewPostPageState createState() =>
      _ManagerReviewPostPageState();
}

class _ManagerReviewPostPageState extends State<ManagerReviewPostPage> {
  // _ManagerReviewPostPageState({});
  // final ManagerVacTransPostVM vm;
  // final String postType;

  final formKey = new GlobalKey<FormState>();

  TextEditingController _fromDateInput = TextEditingController();
  TextEditingController _toDateInput = TextEditingController();
  TextEditingController _noteInput = TextEditingController();
  TextEditingController _sparEmpInput = TextEditingController();

  TextEditingController _empInput = TextEditingController();

  //String _responseBody = '<empty>';
  //String _error = '<none>';
  bool _pending = false;

  @override
  void initState() {
    super.initState();
  //  this._sparEmpInput.text = this.vm.spareEmp;
  //       this._empInput.text=this.vm.emp;
  //       //this._noteInput.text = "";
  //       this._fromDateInput.text = this.vm.fromDate; //set the initial value of text field
  //       this._toDateInput.text = this.vm.toDate;
    _reset();
      this._sparEmpInput.text = widget.vm.spareEmp;
        this._empInput.text= widget.vm.emp;
        this._fromDateInput.text = widget.vm.fromDate; //set the initial value of text field
        this._toDateInput.text  = widget.vm.toDate;
        // this._fromDateInputValue.text = "";
        // this._toDateInputValue.text = "";

  }

  @override
  Widget build(BuildContext context) {
    //final height = MediaQuery.of(context).size.height;
    final isTimePost = widget.postType == VactionPostType.Permission;
    return CupertinoPageScaffold(
       backgroundColor: SmartAppTheme.white,
        navigationBar: CupertinoNavigationBar(

     backgroundColor: SmartAppTheme.white,
      border: null,
         // iconTheme: IconThemeData(color: SmartAppTheme.iconColor),
        ),
    //      appBar: AppBar(
          
    //  //  title:  Text( this.title, style: SmartAppTheme.lightHeadline),
    //    // automaticallyImplyLeading: false,
    //  backgroundColor: SmartAppTheme.white,
    //   elevation: 0,
    //       iconTheme: IconThemeData(color: SmartAppTheme.iconColor),
    //     ),
    //  backgroundColor: SmartAppTheme.white,
      child: Container(
        //  height: height,

        child: SingleChildScrollView(
          // child: Form(
          padding: EdgeInsets.symmetric(vertical: 0,
              horizontal: MediaQuery.of(context).size.width * .1),
           child:Material(
   color: Colors.white,
          child: Form(
              key: formKey,
              // padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //  navBackButton(context),
               //   const SizedBox(height: 20),
                  Image.asset(
                    'res/img/ic_cup.png',
                    alignment: Alignment.center,
                    
                     height: 70,
                   // scale: 2,
                    width: 70,
                     excludeFromSemantics: true,
                    color:
                        isTimePost ? Colors.orange : SmartAppTheme.colorPrimary,
                  ),
                  
                     ExcludeSemantics(
                  child: Text(widget.vm.monitortype, style: SmartAppTheme.title),
                ),
                 
                  const SizedBox(height: 5),
   ExcludeSemantics(
                  child:    Text(isTimePost ? "اجازة ساعية" : "اجازة يومية",
                      style: SmartAppTheme.caption),
                ),
                 
               

                  //  const Divider(),
                  const SizedBox(height: 10),
                  isTimePost
                      ? smartTimeInput(this._fromDateInput,"من الساعة", widget.vm.fromDate)
                      : smartDateInput(this._fromDateInput,"من تاريخ", widget.vm.fromDate),
                  const SizedBox(height: 10),
                  isTimePost
                      ? smartTimeInput(this._toDateInput,"الى الساعة", widget.vm.toDate)
                      : smartDateInput(this._toDateInput,  "الى تاريخ", widget.vm.toDate),
                  const SizedBox(height: 10),
                  TextFormField(
                     style:SmartAppTheme.defaultTextStyle ,
                    controller: this._empInput,
                    readOnly: true,
                      // initialValue: this.vm.emp,
                    decoration: const InputDecoration(
                      labelText: 'الموظف',
                      border: UnderlineInputBorder(),
                      
                    ),
                   
                  ),
                  const SizedBox(height: 10),

                  TextFormField(
                     style:SmartAppTheme.defaultTextStyle ,
                    controller: this._sparEmpInput,
                    readOnly: true,
                     //  initialValue: this.vm.spareEmp,
                    decoration: const InputDecoration(
                      labelText: 'الموظف المناوب',
                      border: UnderlineInputBorder(),
                      
                      
                    ),
                   
                  ),
                  const SizedBox(height: 4),
                  TextFormField(
                    controller: this._noteInput,
                  style:SmartAppTheme.defaultTextStyle ,
                    maxLines: 2,
                    decoration: const InputDecoration(
                      labelText: 'ملاحظات / سبب الرفض',
                      border: UnderlineInputBorder(),
                    ),
                  // validator:this.vm.appreoved? (value) => value.isEmpty ? "يرجى ادخال سبب الرفض" : null:null,

                  ),

                  const SizedBox(height: 20),
                  _pending
                      ? smartLoadingButton(' ... جاري الحفظ ')
                      : smartSubmitButton(
                          context, 'حفظ', () => this._post()),
                ],
              ))),
        ),
        //   ),
        //  ]
        //),
      ),
    );
  }

  void _reset({bool resetControllers = true}) {
    setState(() {
      // if (resetControllers) {
      //   this._sparEmpInput.text = "";
      //   this._empInput.text="";
      //   this._noteInput.text = "";
      //   this._fromDateInput.text = ""; //set the initial value of text field
      //   this._toDateInput.text = "";
      //   // this._fromDateInputValue.text = "";
      //   // this._toDateInputValue.text = "";

       
      // }
      // this._responseBody = '<empty>';
      // this._error = '<none>';
      this._pending = false;
    });
  }

  Future<void> _post() async {
    final form = formKey.currentState;
   if(form==null)
   return;
    if (form.validate()) {
      form.save();
      _reset(resetControllers: false);
      setState(() => this._pending = true);

      final String url = widget.postType == VactionPostType.Permission
          ? AppUrl.ManagerPermissionTransPost
          : AppUrl.ManagerVacationTransPost;

      final Map<String, dynamic> response =await putFormData(url, _getFormData());
      if (response['success']) {
        Navigator.pop(context, true);
      } else {
        smartErrorToast(context, "لم تتم العملية", response['message'].toString());
      }
      setState(() => this._pending = false);
    }
  }

  Map<String, dynamic> _getFormData() {
    return <String, dynamic>{
      'Id': widget.vm.id,
      // 'EndDate': this._toDateInputValue.text,
      'RejectReason': this._noteInput.text,
      'RejectReq': widget.vm.appreoved?0:1,
      // 'MonitorType_Id': this.vm.id,

      
    };
  }

  smartDateInput(TextEditingController dateInput,
          String label,String val) =>
      Center(
          child: TextFormField(
             style:SmartAppTheme.defaultTextStyle ,
        controller: dateInput,
       //initialValue: val,
        decoration: InputDecoration(
            suffixIcon: Icon(Icons.calendar_today),
            border: UnderlineInputBorder(),
            labelText: label),
        readOnly: true,
    
      ));

  smartTimeInput(TextEditingController dateInput,
       String label,String val) =>
      Center(
          child: TextFormField(
             style:SmartAppTheme.defaultTextStyle ,
        controller: dateInput,
             //   initialValue: val,
        decoration: InputDecoration(
            suffixIcon: Icon(Icons.access_time),
            border: UnderlineInputBorder(),
            labelText: label),
        readOnly: true,
      ));
}
