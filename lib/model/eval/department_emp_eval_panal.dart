
class DepartmentEmpEvalPanal  {
  final int id;
  // final String department;
  final String emp;
  // final String evaldoc;

    final String job;
    // final String period;

    final double pg;
    // final double pgw;
    // final double weight;


 String getAriaLabel(){
return ' تقييم الموظف: $emp. , الوظفية: $job.  ' ;
}
 String getAriaValue(){
 return 'النسبة: $pg %. ';
}
 
  DepartmentEmpEvalPanal({this.id,  this.emp,  this.job,  this.pg});


  factory DepartmentEmpEvalPanal.fromJson(Map<String, dynamic> json) {
    return DepartmentEmpEvalPanal(
      id: json['id'],
     emp: json['n']??'غير محدد',
     // department: json['evaldepartment']??'غير محدد',
    //  evaldoc: json['evaldoc']??'غير محدد',
      job: json['job']??'غير محدد ',
     // period: json['period']??'غير محدد',

      
      pg: json['pg']
      

      
    );
  }
}


