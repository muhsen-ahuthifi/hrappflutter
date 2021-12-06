
import 'eval_base.dart';

class RecivedEvalPanal extends BaseEvalPanal{
 
   

 String getAriaLabel(){
return ' الفترة: $period. , نموذج التقييم : $evaldoc. , القسم: $department. , الوظفية: $job.' ;
}
 String getAriaValue(){
 return 'النسبة: $pg %. , الوزن: $weight %. الدرجة المحققة: $pgw %.';
}

  RecivedEvalPanal({int id, String emp, String department, String job, String evaldoc,String period,double pg,double pgw,double weight,String strongth,String weakness, String advice})
: super(id, emp, department, evaldoc,job,period,pg,pgw,weight, strongth, weakness,  advice);
  factory RecivedEvalPanal.fromJson(Map<String, dynamic> json) {
    return RecivedEvalPanal(
      id: json['id'],
     emp: json['evaldoc']??'غير محدد',
      department: json['department']??'غير محدد',
      evaldoc: json['evaldoc']??'غير محدد',
     //evalklass: json['evalklass']??'',

      job: json['job']??'غير محدد',
      period: json['period']??'غير محدد',

      
      pg: json['pg'],
      pgw: json['pgw'],
      weight: json['w'],
      strongth: json['strongth']??'غير محدد',
      weakness: json['weakness']??'غير محدد',
      advice: json['advice']??'غير محدد',

      
    );
  }
}


