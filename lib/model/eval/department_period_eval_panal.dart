class DepartmentPeriodEvalPanal {
  final int id;
  // final String aspect;
  // final String term;
  //final String evaldoc;

   final String period;
 // final String department;

    final double pg;
      final int emp_count;
   
 String getAriaLabel(){
return 'الفترة: $period.' ;
}
 String getAriaValue(){
 return 'النسبة: $pg %. , عدد الموظفين: $emp_count.';
}
  DepartmentPeriodEvalPanal({required this.id, required this.period,required  this.pg,required this.emp_count});

  factory DepartmentPeriodEvalPanal.fromJson(Map<String, dynamic> json) {
    return DepartmentPeriodEvalPanal(
      id: json['id']??0,
  //   period: json['n']??'',
    //  aspect: json['aspect']??'',
     // evaldoc: json['evaldoc']??'',
    // department: json['groupby_n']??'غير محدد',
    period: json['n']??'غير محدد',

     // aspect_pg:json['aspect_pg'],
      pg: json['pg']??0,
      emp_count: json['child_count']??0,


      
    );
  }
}