import 'eval_base.dart';

class SentEvalPanal  extends BaseEvalPanal{


 String getAriaLabel(){
return ' تقييم الموظف: $emp. , القسم: $department. , الوظفية: $job. ,الفترة: $period. , نموذج التقييم : $evaldoc.' ;
}
 String getAriaValue(){
 return 'النسبة: $pg %. , الوزن: $weight %. الدرجة المحققة: $pgw %.';
}
  SentEvalPanal({int id, String emp, String department, String job, String evaldoc,String period,double pg,double pgw,double weight})
: super(id, emp, department, evaldoc,job,period,pg,pgw,weight);
  factory SentEvalPanal.fromJson(Map<String, dynamic> json) {
    return SentEvalPanal(
      id: json['id'],
     emp: json['n']??'غير محدد',
      department: json['evaldepartment']??'غير محدد',
      evaldoc: json['evaldoc']??'غير محدد',
      job: json['job']??'غير محدد ',
      period: json['period']??'غير محدد',

      
      pg: json['pg'],
      pgw: json['pgw'],
      weight: json['w'],

      
    );
  }
}


