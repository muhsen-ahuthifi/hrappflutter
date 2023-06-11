class EmployeeForEvalPanel {
  final int id;
  final String department;
  final String emp;
  final String evaldoc;

    final String job;
    final String period;
  final int evaldoc_id;

  //  final double pg;
  //  final double pgw;
    final double weight;
    // int target=1;
    final int job_id;
    final int period_id;
    final int department_id;
    final int evalcycle_id;
    final int emp_id;
    final int descendantEmp_Id;

    
 String getAriaLabel(){
return ' تقييم الموظف: $emp. , القسم: $department. , الوظفية: $job. ,الفترة: $period. , نموذج التقييم : $evaldoc.' ;
}

    String getAriaValue(){
 return 'الوزن: $weight %. , قيد الانتظار';
}
  EmployeeForEvalPanel({required this.id,required this.emp,required this.department, required this.job,required this.evaldoc,required this.evaldoc_id,required this.period,required this.weight,
  required this.job_id,required this.period_id,required this.department_id,required this.evalcycle_id,required this.emp_id,required this.descendantEmp_Id
  });

  factory EmployeeForEvalPanel.fromJson(Map<String, dynamic> json) {
    return EmployeeForEvalPanel(
        id: json['header_id']??0,
    
     emp: json['n']??'',
      department: json['department']??'غير محدد',
      evaldoc: json['evaldoc']??'غير محدد',
      job: json['job']??'غير محدد',
       weight: json['w']??0,
      job_id: json['job_id']??0,
        period_id: json['period_id']??0,
      department_id: json['department_id']??0,

     evalcycle_id: json['evalcycle_id']??0,
      period: json['period']??'غير محدد',
       evaldoc_id: json['evaldoc_id']??19,
      emp_id: json['emp_id']??0,
      descendantEmp_Id: json['descendantEmp_Id']??0,
    );
  }
}



