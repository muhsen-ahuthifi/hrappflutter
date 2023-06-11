import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrapp/model/eval/emp_for_eval_panal.dart';
import 'package:hrapp/model/eval/evalFormVM.dart';
import 'package:hrapp/services/smartApiService.dart';
import 'package:hrapp/ui/widget/AppTheme.dart';
import 'package:hrapp/ui/widget/commonWidget.dart';
import 'package:hrapp/ui/widget/formFields.dart';
import 'package:hrapp/util/app_url.dart';


class EvalFormPostPage extends StatefulWidget {
    const EvalFormPostPage({super.key, required this.vm,  required this.termsGroup});

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
    double evalPg=0;
   this.widget.termsGroup.values.forEach((element) {
     element.forEach((row) {
       evalPg+=row.getEvalPercentAge();
     });
   });
    return CupertinoPageScaffold(
       backgroundColor: SmartAppTheme.white,
        navigationBar: CupertinoNavigationBar(

     backgroundColor: SmartAppTheme.white,
      border: null,
         // iconTheme: IconThemeData(color: SmartAppTheme.iconColor),
        ),
      child: Container(
        //  height: height,

        child: SingleChildScrollView(
          // child: Form(
          padding: EdgeInsets.symmetric(
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
                  const SizedBox(height: 40),
                     Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: Center(
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: SmartAppTheme.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(60.0),
                                        ),
                                        border: new Border.all(
                                            width: 3,
                                            color: SmartAppTheme.nearlyDarkBlue
                                                .withOpacity(0.2)),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            '${(evalPg.toInt())}%',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                               fontFamily: SmartAppTheme.fontName,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16,
                                              letterSpacing: 0.0,
                                              color: SmartAppTheme.nearlyDarkBlue,
                                            ),
                                          ),
               
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: CustomPaint(
                                      painter: CurvePainter(
                                     
                                          angle: 360*evalPg/100),
                                      child: SizedBox(
                                        width: 68,
                                        height: 68,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                  // Image.asset(
                  //   'res/img/ic_cup.png',
                  //   alignment: Alignment.center,
                  //   height: 100,
                  //   color:
                  //      Colors.orange 
                  // ),
                  ExcludeSemantics(
                    child:Text(this.widget.vm.emp, style: SmartAppTheme.title),
                  ),
                  const SizedBox(height: 5),
 ExcludeSemantics(
                    child:  Text( "تقييم",style: SmartAppTheme.caption),
                  ),
                
                  //  const Divider(),
                  const SizedBox(height: 10),
                    TextFormField(
                        style:SmartAppTheme.defaultTextStyle ,
                    controller: this._strongthInputValue,
                    maxLines: 4,
                   minLines: 2,
                   validator:    (value) =>value==null|| value.isEmpty ? "يرجى ادخال  مواطن القوة " : null,
                    decoration: const InputDecoration(
                      labelText: 'مواطن القوة',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                 
                  const SizedBox(height: 4),
                  TextFormField(
                      style:SmartAppTheme.defaultTextStyle ,
                    controller: this._weaknessInput,
                     maxLines: 4,
                   minLines: 2,
                   validator: (value) =>value==null|| value.isEmpty ? "يرجى ادخال مواطن الضعف " : null,

                    decoration: const InputDecoration(
                      labelText: 'مواطن الضعف',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                   const SizedBox(height: 4),

                TextFormField(
                    style:SmartAppTheme.defaultTextStyle ,
                    controller: this._adviceInputValue,
                   maxLines: 4,
                   minLines: 2,
               validator: (value) =>value==null|| value.isEmpty ? " يرجى ادخال  ملاحظات وارشادات عامة " : null,

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
    ));
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
    if(form==null)
    return;
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
   //print(json.encode(this.widget.termsGroup.values.reduce((value, element) => value+element)));
    return <String, dynamic>{
 
      'transaction':{
          'MoreInfo': this._adviceInputValue.text,
       'Strongth': this._strongthInputValue.text,
      'Weakness': this._weaknessInput.text,
      'EvalDocument_Id':this.widget.vm.evaldoc_id,
      'Job_Id':this.widget.vm.job_id,
      'Period_Id':this.widget.vm.period_id,
        'Department_Id':this.widget.vm.department_id,
        'EvalCycle_Id':this.widget.vm.evalcycle_id,
        'Weight':this.widget.vm.weight,
        'Id':this.widget.vm.id,
        'Code':0,
        'DescendantEmp_Id': this.widget.vm.descendantEmp_Id,
      'Employee_Id': this.widget.vm.emp_id,
      },
         
      'details':this.widget.termsGroup.values.reduce((value, element) => value+element),
    

      
    };
  }



}
