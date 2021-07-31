import 'eval_base.dart';

class SentEvalPanal  extends BaseEvalPanal{
  // final int id;
  // final String department;
  // final String emp;
  // final String evaldoc;

  //   final String job;
  //   final String period;

  //   final double pg;
  //   final double pgw;
  //   final double weight;

 // SentEvalPanal({this.id, this.emp, this.department, this.job, this.evaldoc,this.period,this.pg,this.pgw,this.weight});

  SentEvalPanal({int id, String emp, String department, String job, String evaldoc,String period,double pg,double pgw,double weight})
: super(id, emp, department, evaldoc,job,period,pg,pgw,weight);
  factory SentEvalPanal.fromJson(Map<String, dynamic> json) {
    return SentEvalPanal(
      id: json['id'],
     emp: json['n']??'',
      department: json['evaldepartment']??'',
      evaldoc: json['evaldoc']??'',
      job: json['job']??'',
      period: json['period']??'',

      
      pg: json['pg'],
      pgw: json['pgw'],
      weight: json['w'],

      
    );
  }
}


