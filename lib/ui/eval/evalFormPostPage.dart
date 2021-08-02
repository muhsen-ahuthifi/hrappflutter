import 'package:flutter/material.dart';
import 'package:hrapp/model/eval/emp_for_eval_panal.dart';
import 'package:hrapp/model/eval/evalFormVM.dart';
import 'package:hrapp/services/smartApiService.dart';
import 'package:hrapp/ui/widget/AppTheme.dart';
import 'package:hrapp/ui/widget/commonWidget.dart';
import 'package:hrapp/ui/widget/formFields.dart';
import 'package:hrapp/util/app_url.dart';


class EvalFormPostPage extends StatefulWidget {
    const EvalFormPostPage({Key key, @required this.vm,  @required this.termsGroup})
      : super(key: key);

        final EmployeeForEvalPanel vm;

  final Map<String,List<DocumentTermForEval> >  termsGroup;
  @override
  _EvalFormPostPagetate createState() =>
      _EvalFormPostPagetate();
}

class _EvalFormPostPagetate extends State<EvalFormPostPage> {
  
  final formKey = new GlobalKey<FormState>();
  
  TextEditingController _strongthInputValue = TextEditingController();
  TextEditingController _weaknessInput = TextEditingController();

  TextEditingController _adviceInputValue = TextEditingController();
  //TextEditingController _sparEmpInput = TextEditingController();

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
                       Colors.orange 
                  ),
                  Text(this.widget.vm.emp, style: SmartAppTheme.title),
                  const SizedBox(height: 5),

                  Text( "تقييم",style: SmartAppTheme.caption),
                  //  const Divider(),
                  const SizedBox(height: 10),
                    TextFormField(
                    controller: this._strongthInputValue,
                    maxLines: 4,
                   minLines: 2,
                    decoration: const InputDecoration(
                      labelText: 'مواطن القوة',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                 
                  const SizedBox(height: 4),
                  TextFormField(
                    controller: this._weaknessInput,
                     maxLines: 4,
                   minLines: 2,
                    decoration: const InputDecoration(
                      labelText: 'مواطن الضعف',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                   const SizedBox(height: 4),

                TextFormField(
                    controller: this._adviceInputValue,
                   maxLines: 4,
                   minLines: 2,
                    decoration: const InputDecoration(
                      labelText: 'ملاحظات وارشادات عامة',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                 
                  const SizedBox(height: 20),
                  _pending
                      ? smartLoadingButton(' ...  ارسال التقييم')
                      : smartSubmitButton(
                          context, 'ارسال التقييم', () => this._post()),
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
       // this._sparEmpInput.text = "";
       // this._noteInput.text = "";
    //  _strongthInputValue _weaknessInput _adviceInputValue

       // this._sparEmpInputValue = ItemSelectVM();
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

      final String url =AppUrl.EvalPosts;

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
       'advice': this._adviceInputValue.text,
       'strongth': this._strongthInputValue.text,
      'weakness': this._weaknessInput.text,

     // 'Employee_IdSpare': this._sparEmpInputValue.id,
     // 'MonitorType_Id': this.vm.id,

      
    };
  }



}
