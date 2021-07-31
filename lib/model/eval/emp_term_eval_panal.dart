class EmployeeTermEvalPanal {
  final int id;
  final String aspect;
  final String term;
  //final String evaldoc;

   // final String job;
   // final String period;

    final double pg;
    final double pgw;
    final double weight;
    final double aspect_pg;

  EmployeeTermEvalPanal({this.id, this.term, this.aspect, this.aspect_pg,this.pg,this.pgw,this.weight});

  factory EmployeeTermEvalPanal.fromJson(Map<String, dynamic> json) {
    return EmployeeTermEvalPanal(
      id: json['aspect_id']??0,
     term: json['n']??'',
      aspect: json['aspect']??'',
     // evaldoc: json['evaldoc']??'',
     // job: json['job']??'',
    //  period: json['period']??'',

      aspect_pg:json['aspect_pg'],
      pg: json['pg'],
      pgw: json['pgw'],
      weight: json['w'],

      
    );
  }
}