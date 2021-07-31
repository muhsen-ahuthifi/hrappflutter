class PeriodEvalPanal {
  final int id;
  // final String aspect;
  // final String term;
  //final String evaldoc;

   final String job;
   final String period;

    final double pg;
  
  PeriodEvalPanal({this.id, this.period, this.job, this.pg});

  factory PeriodEvalPanal.fromJson(Map<String, dynamic> json) {
    return PeriodEvalPanal(
      id: json['id']??0,
  //   period: json['n']??'',
    //  aspect: json['aspect']??'',
     // evaldoc: json['evaldoc']??'',
     job: json['job']??'',
    period: json['n']??'',

     // aspect_pg:json['aspect_pg'],
      pg: json['pg'],
    

      
    );
  }
}