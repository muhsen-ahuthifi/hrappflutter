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

     
       
  EmployeeForEvalPanel({this.id, this.emp, this.department, this.job, this.evaldoc,this.evaldoc_id,this.period,this.weight,
  this.job_id,this.period_id,this.department_id,this.evalcycle_id,this.emp_id,this.descendantEmp_Id
  });

  factory EmployeeForEvalPanel.fromJson(Map<String, dynamic> json) {
    return EmployeeForEvalPanel(
        id: json['header_id']??0,
    
     emp: json['n']??'',
      department: json['department']??'',
      evaldoc: json['evaldoc']??'',
      job: json['job']??'',
       weight: json['w']??0,
      job_id: json['job_id']??0,
        period_id: json['period_id']??0,
      department_id: json['department_id']??0,

     evalcycle_id: json['evalcycle_id']??0,
      period: json['period']??'',

      
      //pg: json['pg'],
      //pgw: json['pgw'],

     
       evaldoc_id: json['evaldoc_id']??19,

    
      emp_id: json['emp_id']??0,
      descendantEmp_Id: json['descendantEmp_Id']??0,
    );
  }
}



