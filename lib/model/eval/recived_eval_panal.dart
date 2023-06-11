
import 'eval_base.dart';

class RecivedEvalPanal extends BaseEvalPanal{
 
   

 String getAriaLabel(){
return ' الفترة: $period. , نموذج التقييم : $evaldoc. , القسم: $department. , الوظفية: $job.' ;
}
 String getAriaValue(){
 return 'النسبة: $pg %. , الوزن: $weight %. الدرجة المحققة: $pgw %.';
}

  RecivedEvalPanal({required int id,required String emp,required String department, required String job,required String evaldoc,required String period,required double pg,required double pgw,required double weight,required String strongth,required String weakness, required String advice})
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

      
      pg: json['pg']??0,
      pgw: json['pgw']??0,
      weight: json['w']??0,
      strongth: json['strongth']??'غير محدد',
      weakness: json['weakness']??'غير محدد',
      advice: json['advice']??'غير محدد',

      
    );
  }
}


