
class DocumentTermForEval {
  final int id;
    final int docterm_id;

  
  final String aspect;
  final String name;
       double evalvalue;
    final double weight;

  //final String evaldoc;

   // final String job;
   // final String period;

    final double evalpg;
   // final double aspect_pg;

  DocumentTermForEval({this.id, this.docterm_id,this.name, this.aspect,this.evalpg,this.evalvalue,this.weight});

  factory DocumentTermForEval.fromJson(Map<String, dynamic> json) {
    return DocumentTermForEval(
      id: json['id']??0,
      docterm_id: json['docterm_id']??0,
     name: json['name']??'',
      aspect: json['aspect']??'',
     // evaldoc: json['evaldoc']??'',
     // job: json['job']??'',
    //  period: json['period']??'',

      evalpg: json['evalpg']??0,
      evalvalue: json['evalvalue']??0,
      weight: json['weight']??0,

      
    );
  }

    Map<String, dynamic> toJson() {
    return {
     // 'id': this.id,
      'DocEvalTerm_Id': this.docterm_id,
     // 'evalpg': this.evalpg,
     'EvalValue': this.evalvalue,
      'Weight': this.weight,
     
    };
  }

      double getEvalPercentAge()
       {
           return (this.evalvalue??0 * this.weight??0) / 5;
       }
}