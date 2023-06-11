
import 'package:flutter/cupertino.dart';
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
  const VacationsPostPage({super.key, 
  required this.vm, required this.postType});

  final VacationsBal vm;
  final String postType;

  @override
  _VacationsPostPageState createState() => _VacationsPostPageState();
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
  ItemSelectVM? _sparEmpInputValue ;

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
    return CupertinoPageScaffold(
      backgroundColor: SmartAppTheme.white,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: SmartAppTheme.white,
        // automaticallyImplyMiddle: false,
        border: null,
        // iconTheme: IconThemeData(color: SmartAppTheme.iconColor),
      ),
      child: Container(
          //  height: height,

          child: SingleChildScrollView(
        // child: Form(

        padding: EdgeInsets.symmetric(
            vertical: 0, horizontal: MediaQuery.of(context).size.width * .1),
        child: Material(
          color: Colors.white,
          child: Form(
              key: formKey,
              // padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //  const SizedBox(height: 40),
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
                    child: Text(this.widget.vm.monitortype,
                        style: SmartAppTheme.title),
                  ),

                  const SizedBox(height: 5),
                  ExcludeSemantics(
                    child: Text(isTimePost ? "اجازة ساعية" : "اجازة يومية",
                        style: SmartAppTheme.caption),
                  ),

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

                  Semantics(
                      container: true,
                      button: true,
                      onTap: () => selectEmp(),
                      excludeSemantics: true,
                      label: 'الموظف المناوب',
                      value: this._sparEmpInput.text,
                      child: TextFormField(
                        style: SmartAppTheme.defaultTextStyle,
                        controller: this._sparEmpInput,
                        readOnly: true,
                        onTap: () => selectEmp(),
                        decoration: const InputDecoration(
                          labelText: 'الموظف المناوب',
                          border: UnderlineInputBorder(),
                          suffixIcon: Icon(Icons.search),
                        ),
                      )),
                  const SizedBox(height: 4),
                  TextFormField(
                    style: SmartAppTheme.defaultTextStyle,
                    controller: this._noteInput,
                    maxLines: 2,
                    decoration: const InputDecoration(
                      labelText: 'ملاحظات',
                      border: UnderlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 20),
                  _pending
                      ? smartLoadingButton(' ... جاري الارسال')
                      : smartSubmitButton(
                          context, 'ارسال الطلب', () => this._post()),
                ],
              )),
        ),
        //   ),
        //  ]
        //),
      )),
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

        this._sparEmpInputValue = null;
      }
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

      final String url = this.widget.postType == VactionPostType.Permission
          ? AppUrl.PermissionTransPost
          : AppUrl.VacationTransPost;

      final Map<String, dynamic> response =
          await postFormData(url, _getFormData());
      if (response['success']) {
        Navigator.pop(context, true);
      } else {
        smartErrorToast(
            context, "لم تتم العملية", response['message'].toString());
      }
      setState(() => this._pending = false);
    }
  }

  selectEmp() async {
    final result = await Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => ItemSelectPage(
                title: 'الموظف المناوب', url: AppUrl.EmployeeFilter)));
    if (result != null) {
      this._sparEmpInput.text = result.name;
      _sparEmpInputValue = ItemSelectVM(id: result.id, name: result.name);
    }
    // else{
    //    this._sparEmpInput.text="test2";
    // }
  }

  Map<String, dynamic> _getFormData() {
    return <String, dynamic>{
      'StartDate': this._fromDateInputValue.text,
      'EndDate': this._toDateInputValue.text,
      'Trans_Remark': this._noteInput.text,
      'Employee_IdSpare': this._sparEmpInputValue?.id,
      'MonitorType_Id': this.widget.vm.id,
    };
  }

  smartDateInput(TextEditingController dateInput,
          TextEditingController valueInput, String label) =>
      Semantics(
          container: true,
          button: true,
          onTap: () => selectDate(dateInput, valueInput),
          excludeSemantics: true,
          label: label,
          value: dateInput.text,
          child: Center(
              child: TextFormField(
            style: SmartAppTheme.defaultTextStyle,
            validator: (value) =>value==null|| value.isEmpty ? "يرجى اختيار التاريخ " : null,
            controller: dateInput,
            decoration: InputDecoration(
                suffixIcon: Icon(Icons.calendar_today),
                border: UnderlineInputBorder(),
                labelText: label),
            readOnly: true,
            onTap: () => selectDate(dateInput, valueInput),
          )));

  smartTimeInput(TextEditingController dateInput,
          TextEditingController valueInput, String label) =>
      Semantics(
          container: true,
          button: true,
          onTap: () => selectDateTime(dateInput, valueInput),
          excludeSemantics: true,
          label: label,
          value: dateInput.text,
          child: Center(
            child: TextFormField(
              style: SmartAppTheme.defaultTextStyle,
              validator: (value) =>value==null|| value.isEmpty ? "يرجى اختيار الوقت " : null,
              controller: dateInput,
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.access_time),
                  border: UnderlineInputBorder(),
                  labelText: label),
              readOnly: true,
              onTap: () => selectDateTime(dateInput, valueInput),
            ),
          ));

  void selectDateTime(
      TextEditingController dateInput, TextEditingController valueInput) async {
    final DateTime now = DateTime.now();
    bool hasSetDate = false;
    await showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
              height: 380,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  Container(
                    height: 300,
                    child: CupertinoDatePicker(
                        use24hFormat: true,
                        mode: CupertinoDatePickerMode.time,
                        initialDateTime: DateTime.now(),
                        onDateTimeChanged: (pickedDate) {
                          hasSetDate = true;
                          final DateTime formatedTimeValue = DateTime(
                              now.year,
                              now.month,
                              now.day,
                              pickedDate.hour,
                              pickedDate.minute);
                          //String formattedDate = pickedDate.format(context);
                          String formattedDate =
                              DateFormat('HH:mm').format(formatedTimeValue);
                          setState(() {
                            valueInput.text = DateFormat('yyyy-MM-dd HH:mm')
                                .format(formatedTimeValue);
                            dateInput.text =
                                formattedDate; //set output date to TextField value.

                            formKey.currentState?.validate();
                          });
                        }),
                  ),
                  Divider(height: 0, thickness: 1),
                  CupertinoButton(
                    child: Text(
                      'موافق',
                      style: SmartAppTheme.defaultIosTextStype,
                    ),
                    onPressed: () {
                      if (hasSetDate == false) {
                        final DateTime formatedTimeValue = DateTime.now();
                        //String formattedDate = pickedDate.format(context);
                        String formattedDate =
                            DateFormat('HH:mm').format(formatedTimeValue);
                        setState(() {
                          valueInput.text = DateFormat('yyyy-MM-dd HH:mm')
                              .format(formatedTimeValue);
                          dateInput.text =
                              formattedDate; //set output date to TextField value.

                          formKey.currentState?.validate();
                        });
                      }
                      ;
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ));
  }

// Show the modal that contains the CupertinoDatePicker
  void selectDate(
      TextEditingController dateInput, TextEditingController valueInput) async {
    int currentYear = DateTime.now().year;
    bool hasSetDate = false;
    await showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
              height: 380,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  Container(
                    height: 300,
                    child: CupertinoDatePicker(
                        //  minimumDate: DateTime(currentYear -1),
                        // maximumDate: DateTime(currentYear + 1),

                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: DateTime.now(),
                        minimumYear: currentYear - 1,
                        maximumYear: currentYear + 1, //   on
                        onDateTimeChanged: (pickedDate) {
                          hasSetDate = true;
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          setState(() {
                            valueInput.text =
                                formattedDate; //set output date to TextField value.
                            dateInput.text =
                                formattedDate; //set output date to TextField value.
                            formKey.currentState?.validate();
                          });
                        }),
                  ),
                  Divider(height: 0, thickness: 1),
                  // Close the modal
                  CupertinoButton(
                    child: Text(
                      'موافق',
                      style: SmartAppTheme.defaultIosTextStype,
                    ),
                    onPressed: () {
                      if (hasSetDate == false) {
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(DateTime.now());
                        setState(() {
                          valueInput.text =
                              formattedDate; //set output date to TextField value.
                          dateInput.text =
                              formattedDate; //set output date to TextField value.
                          formKey.currentState?.validate();
                        });
                      }
                      ;
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ));
  }
}

//  selectDateTime(TextEditingController dateInput,TextEditingController valueInput)async{
// final DateTime now = DateTime.now();

//         TimeOfDay pickedDate = await showTimePicker(
//           context: context,
//           initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
//         );

//         if (pickedDate != null) {
//          // 'yyyy-MM-dd HH:mm'
//           final DateTime formatedTimeValue = DateTime(now.year,now.month,now.day,pickedDate.hour,pickedDate.minute);
//           String formattedDate = pickedDate.format(context);
//           setState(() {
//             valueInput.text = DateFormat('yyyy-MM-dd HH:mm').format(formatedTimeValue);
//             dateInput.text =formattedDate; //set output date to TextField value.

//           formKey.currentState.validate();
//           });
//         }
//  }

//  selectDate2(TextEditingController dateInput,TextEditingController valueInput) async{
// int currentYear = DateTime.now().year;
//         DateTime pickedDate = await showDatePicker(
//             context: context,
//             initialDate: DateTime.now(),
//             firstDate: DateTime(currentYear -
//                 1), //DateTime.now() - not to allow to choose before today.
//             lastDate: DateTime(currentYear + 1));

//         if (pickedDate != null) {
//           String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
//           setState(() {
//             valueInput.text =formattedDate; //set output date to TextField value.
//             dateInput.text = formattedDate; //set output date to TextField value.
//               formKey.currentState.validate();

//           });
//         }
//  }
