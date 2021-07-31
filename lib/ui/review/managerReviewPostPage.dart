import 'package:flutter/material.dart';
import 'package:hrapp/model/vacations/managerPostVM.dart';
import 'package:hrapp/model/vacations/vacationsPostVM.dart';
import 'package:hrapp/services/smartApiService.dart';
import 'package:hrapp/ui/widget/AppTheme.dart';
import 'package:hrapp/ui/widget/commonWidget.dart';
import 'package:hrapp/ui/widget/formFields.dart';
import 'package:hrapp/util/app_url.dart';
// import 'package:hrapp/model/ManagerReview/ManagerReviewPostVM.dart';

// class ManagerReviewPostPage extends StatefulWidget {
//   const ManagerReviewPostPage({Key key,@required this.vm,@required this.postType,@required this.rejected}) : super(key: key);

//   final dynamic vm;
//   final String postType;
//   final bool rejected;

//   @override
//   _ManagerReviewPostPageState createState() => _ManagerReviewPostPageState(vm: this.vm,postType:this.postType,rejected:this.rejected);
// }


class ManagerReviewPostPage extends StatefulWidget {
  const ManagerReviewPostPage({Key key, @required this.vm, @required this.postType})
      : super(key: key);

  final ManagerVacTransPostVM vm;
  final String postType;
 //final bool rejected;
  @override
  _ManagerReviewPostPageState createState() =>
      _ManagerReviewPostPageState(vm: this.vm, postType: this.postType);
}

class _ManagerReviewPostPageState extends State<ManagerReviewPostPage> {
  _ManagerReviewPostPageState({@required this.vm, @required this.postType});
  final ManagerVacTransPostVM vm;
  final String postType;

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
      this._sparEmpInput.text = this.vm.spareEmp;
        this._empInput.text= this.vm.emp;
        this._fromDateInput.text = this.vm.fromDate; //set the initial value of text field
        this._toDateInput.text  = this.vm.toDate;
        // this._fromDateInputValue.text = "";
        // this._toDateInputValue.text = "";

  }

  @override
  Widget build(BuildContext context) {
    //final height = MediaQuery.of(context).size.height;
    final isTimePost = this.postType == VactionPostType.Permission;
    return Scaffold(
      backgroundColor: SmartAppTheme.white,
      body: Container(
        //  height: height,

        child: SingleChildScrollView(
          // child: Form(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .1),
          child: Form(
              key: formKey,
              // padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //  navBackButton(context),
                  const SizedBox(height: 20),
                  Image.asset(
                    'res/img/ic_cup.png',
                    alignment: Alignment.center,
                    height: 80,
                    color:
                        isTimePost ? Colors.orange : SmartAppTheme.colorPrimary,
                  ),
                  Text(this.vm.monitortype, style: SmartAppTheme.title),
                  const SizedBox(height: 5),

                  Text(isTimePost ? "اجازة ساعية" : "اجازة يومية",
                      style: SmartAppTheme.caption),

                  //  const Divider(),
                  const SizedBox(height: 10),
                  isTimePost
                      ? smartTimeInput(this._fromDateInput,"من الساعة", this.vm.fromDate)
                      : smartDateInput(this._fromDateInput,"من تاريخ", this.vm.fromDate),
                  const SizedBox(height: 10),
                  isTimePost
                      ? smartTimeInput(this._toDateInput,"الى الساعة", this.vm.toDate)
                      : smartDateInput(this._toDateInput,  "الى تاريخ", this.vm.toDate),
                  const SizedBox(height: 10),
                  TextFormField(
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
              )),
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
        //print("state:"+this.vm.appreoved.toString());

    if (form.validate()) {
      form.save();
      _reset(resetControllers: false);
      setState(() => this._pending = true);

      final String url = this.postType == VactionPostType.Permission
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
      'Id': this.vm.id,
      // 'EndDate': this._toDateInputValue.text,
      'RejectReason': this._noteInput.text,
      'RejectReq': this.vm.appreoved?0:1,
      // 'MonitorType_Id': this.vm.id,

      
    };
  }

  smartDateInput(TextEditingController dateInput,
          String label,String val) =>
      Center(
          child: TextFormField(
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
        controller: dateInput,
             //   initialValue: val,
        decoration: InputDecoration(
            suffixIcon: Icon(Icons.access_time),
            border: UnderlineInputBorder(),
            labelText: label),
        readOnly: true,
      ));
}
