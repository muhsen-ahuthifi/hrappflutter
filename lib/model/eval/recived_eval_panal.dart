
import 'eval_base.dart';

class RecivedEvalPanal extends BaseEvalPanal{
  // final int id;
  // final String department;
  // final String emp;
  // final String evaldoc;

  //   final String job;
  //   final String period;

  //   final double pg;
  //   final double pgw;
  //   final double weight;

  RecivedEvalPanal({int id, String emp, String department, String job, String evaldoc,String period,double pg,double pgw,double weight})
: super(id, emp, department, job, evaldoc,period,pg,pgw,weight);
  factory RecivedEvalPanal.fromJson(Map<String, dynamic> json) {
    return RecivedEvalPanal(
      id: json['id'],
     emp: json['emp']??'',
      department: json['department']??'',
      evaldoc: json['evaldoc']??'',
      job: json['job']??'',
      period: json['period']??'',

      
      pg: json['pg'],
      pgw: json['pgw'],
      weight: json['w'],

      
    );
  }
}


