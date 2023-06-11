import 'eval_base.dart';

class SentEvalPanal  extends BaseEvalPanal{


 String getAriaLabel(){
return ' تقييم الموظف: $emp. , القسم: $department. , الوظفية: $job. ,الفترة: $period. , نموذج التقييم : $evaldoc.' ;
}
 String getAriaValue(){
 return 'النسبة: $pg %. , الوزن: $weight %. الدرجة المحققة: $pgw %.';
}
  SentEvalPanal({required int id, required String emp,required String department, required String job, required String evaldoc,required String period,required double pg,required double pgw,required double weight,required String strongth,required String weakness, required String advice})
: super(id, emp, department, evaldoc,job,period,pg,pgw,weight, strongth, weakness,  advice);
  factory SentEvalPanal.fromJson(Map<String, dynamic> json) {
    return SentEvalPanal(
      id: json['id']??0,
     emp: json['n']??'غير محدد',
      department: json['evaldepartment']??'غير محدد',
      evaldoc: json['evaldoc']??'غير محدد',
      job: json['job']??'غير محدد ',
      period: json['period']??'غير محدد',

      
      pg: json['pg']??0,
      pgw: json['pgw']??0,
      weight: json['w']??0,
  strongth: json['strongth']??'غير محدد',
      weakness: json['weakness']??'غير محدد',
      advice: json['advice']??'غير محدد',

      
    );
  }
}


