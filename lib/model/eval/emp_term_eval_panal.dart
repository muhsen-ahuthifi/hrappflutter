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

 String getAriaLabel(){
return ' $term. , $aspect.' ;
}
 String getAriaValue(){
 return 'النسبة: $pg %. , الوزن: $weight %. الدرجة المحققة: $pgw %.';
}
  EmployeeTermEvalPanal({required this.id,required this.term,required  this.aspect, required this.aspect_pg,required this.pg,required this.pgw,required this.weight});

  factory EmployeeTermEvalPanal.fromJson(Map<String, dynamic> json) {
    return EmployeeTermEvalPanal(
      id: json['aspect_id']??0,
     term: json['n']??'غير محدد',
      aspect: json['aspect']??'غير محدد',
     // evaldoc: json['evaldoc']??'',
     // job: json['job']??'',
    //  period: json['period']??'',

      aspect_pg:json['aspect_pg']??0,
      pg: json['pg']??0,
      pgw: json['pgw']??0,
      weight: json['w']??0,

      
    );
  }
}