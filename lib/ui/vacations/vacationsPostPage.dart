import 'package:flutter/material.dart';
import 'package:hrapp/model/itemSelectVM.dart';
import 'package:hrapp/model/vacations/vacationsPostVM.dart';
import 'package:hrapp/services/smartApiService.dart';
import 'package:hrapp/ui/itemSelect/itemSelectPage.dart';
import 'package:hrapp/ui/widget/AppTheme.dart';
import 'package:hrapp/ui/widget/commonWidget.dart';
import 'package:hrapp/ui/widget/formFields.dart';
import 'package:hrapp/util/app_url.dart';
import '../../model/vacations_bal.dart';
import 'package:intl/intl.dart';

class VacationsPostPage extends StatefulWidget {
  const VacationsPostPage({Key key, @required this.vm, @required this.postType})
      : super(key: key);

  final VacationsBal vm;
  final String postType;

  @override
  _VacationsPostPageState createState() =>
      _VacationsPostPageState();
}

class _VacationsPostPageState extends State<VacationsPostPage> {
  // _VacationsPostPageState({@required this.vm, @required this.postType});
  // final VacationsBal vm;
  // final String postType;

  final formKey = new GlobalKey<FormState>();

  TextEditingController _fromDateInput = TextEditingController();
  TextEditingController _toDateInput = TextEditingController();
  TextEditingController _fromDateInputValue = TextEditingController();
  TextEditingController _toDateInputValue = TextEditingController();
  TextEditingController _noteInput = TextEditingController();
  TextEditingController _sparEmpInput = TextEditingController();
  ItemSelectVM _sparEmpInputValue = ItemSelectVM();

  //String _responseBody = '<empty>';
  //String _error = '<none>';
  bool _pending = false;

  @override
  void initState() {
    super.initState();

    _reset();
  }

  @override
  Widget build(BuildContext context) {
    //final height = MediaQuery.of(context).size.height;
    final isTimePost = this.widget.postType == VactionPostType.Permission;
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
                  const SizedBox(height: 40),
                  Image.asset(
                    'res/img/ic_cup.png',
                    alignment: Alignment.center,
                    height: 100,
                    color:
                        isTimePost ? Colors.orange : SmartAppTheme.colorPrimary,
                  ),
                  Text(this.widget.vm.monitortype, style: SmartAppTheme.title),
                  const SizedBox(height: 5),

                  Text(isTimePost ? "اجازة ساعية" : "اجازة يومية",
                      style: SmartAppTheme.caption),

                  //  const Divider(),
                  const SizedBox(height: 10),
                  isTimePost
                      ? smartTimeInput(this._fromDateInput,
                          this._fromDateInputValue, "من الساعة")
                      : smartDateInput(this._fromDateInput,
                          this._fromDateInputValue, "من تاريخ"),
                  const SizedBox(height: 10),
                  isTimePost
                      ? smartTimeInput(this._toDateInput,
                          this._toDateInputValue, "الى الساعة")
                      : smartDateInput(this._toDateInput,
                          this._toDateInputValue, "الى تاريخ"),
                  const SizedBox(height: 10),

                  TextFormField(
                    controller: this._sparEmpInput,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: 'الموظف المناوب',
                      border: UnderlineInputBorder(),
                      suffixIcon: Icon(Icons.search),
                    ),
                    onTap: () async {
                      final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ItemSelectPage(
                                  title: 'الموظف المناوب',
                                  url: AppUrl.EmployeeFilter)));
                      if (result != null) {
                        this._sparEmpInput.text = result.name;
                        _sparEmpInputValue = ItemSelectVM(id: result.id, name: result.name);
                      }
                    },
                  ),
                  const SizedBox(height: 4),
                  TextFormField(
                    controller: this._noteInput,
                    maxLines: 2,
                    decoration: const InputDecoration(
                      labelText: 'ملاحظات',
                      border: UnderlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 20),
                  _pending
                      ? smartLoadingButton(' ...  ارسال الطلب')
                      : smartSubmitButton(
                          context, 'ارسال الطلب', () => this._post()),
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
      if (resetControllers) {
        this._sparEmpInput.text = "";
        this._noteInput.text = "";
        this._fromDateInput.text = ""; //set the initial value of text field
        this._toDateInput.text = "";
        this._fromDateInputValue.text = "";
        this._toDateInputValue.text = "";

        this._sparEmpInputValue = ItemSelectVM();
      }
      // this._responseBody = '<empty>';
      // this._error = '<none>';
      this._pending = false;
    });
  }

  Future<void> _post() async {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      _reset(resetControllers: false);
      setState(() => this._pending = true);

      final String url = this.widget.postType == VactionPostType.Permission
          ? AppUrl.PermissionTransPost
          : AppUrl.VacationTransPost;

      final Map<String, dynamic> response =await postFormData(url, _getFormData());
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
      'StartDate': this._fromDateInputValue.text,
      'EndDate': this._toDateInputValue.text,
      'Trans_Remark': this._noteInput.text,
      'Employee_IdSpare': this._sparEmpInputValue.id,
      'MonitorType_Id': this.widget.vm.id,

      
    };
  }

  smartDateInput(TextEditingController dateInput,
          TextEditingController valueInput, String label) =>
      Center(
          child: TextFormField(
        validator: (value) => value.isEmpty ? "يرجى اختيار التاريخ " : null,
        controller: dateInput,
        decoration: InputDecoration(
            suffixIcon: Icon(Icons.calendar_today),
            border: UnderlineInputBorder(),
            labelText: label),
        readOnly: true,
        onTap: () async {
          int currentYear = DateTime.now().year;
          DateTime pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(currentYear -
                  1), //DateTime.now() - not to allow to choose before today.
              lastDate: DateTime(currentYear + 1));

          if (pickedDate != null) {
            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
            setState(() {
              valueInput.text =formattedDate; //set output date to TextField value.
              dateInput.text = formattedDate; //set output date to TextField value.
            });
          }
        },
      ));

  smartTimeInput(TextEditingController dateInput,
          TextEditingController valueInput, String label) =>
      Center(
          child: TextFormField(
        validator: (value) => value.isEmpty ? "يرجى اختيار الوقت " : null,
        controller: dateInput,
        decoration: InputDecoration(
            suffixIcon: Icon(Icons.access_time),
            border: UnderlineInputBorder(),
            labelText: label),
        readOnly: true,
        onTap: () async {
          final DateTime now = DateTime.now();

          TimeOfDay pickedDate = await showTimePicker(
            context: context,
            initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
          );

          if (pickedDate != null) {
           // 'yyyy-MM-dd HH:mm'
            final DateTime formatedTimeValue = DateTime(now.year,now.month,now.day,pickedDate.hour,pickedDate.minute);
            String formattedDate = pickedDate.format(context);
            setState(() {
              valueInput.text = DateFormat('yyyy-MM-dd HH:mm').format(formatedTimeValue);
              dateInput.text =formattedDate; //set output date to TextField value.
            });
          }
        },
      ));
}
