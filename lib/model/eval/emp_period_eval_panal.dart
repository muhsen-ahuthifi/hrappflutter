class PeriodEvalPanal {
  final int id;
  // final String aspect;
  // final String term;
  //final String evaldoc;

   final String job;
   final String period;

    final double pg;
      final int eval_count;

  
  PeriodEvalPanal({this.id, this.period, this.job, this.pg,this.eval_count});

  factory PeriodEvalPanal.fromJson(Map<String, dynamic> json) {
    return PeriodEvalPanal(
      id: json['period_id']??0,
  //   period: json['n']??'',
    //  aspect: json['aspect']??'',
     // evaldoc: json['evaldoc']??'',
     job: json['job']??'',
    period: json['n']??'',

     // aspect_pg:json['aspect_pg'],
      pg: json['pg']??0,
          eval_count: json['child_count']??0,


      
    );
  }
}