class EmployeeForEvalPanel {
  final int id;
  final String department;
  final String emp;
  final String evaldoc;

    final String job;
    final String period;
  final int evaldoc_id;

    final double pg;
    final double pgw;
    final double weight;
     int target=1;

  EmployeeForEvalPanel({this.id, this.emp, this.department, this.job, this.evaldoc,this.evaldoc_id,this.period,this.pg,this.pgw,this.weight});

  factory EmployeeForEvalPanel.fromJson(Map<String, dynamic> json) {
    return EmployeeForEvalPanel(
        id: json['id'],
     emp: json['n']??'',
      department: json['evaldepartment']??'',
      evaldoc: json['evaldoc']??'',
      job: json['job']??'',
      period: json['period']??'',

      
      pg: json['pg'],
      pgw: json['pgw'],
      weight: json['w'],
evaldoc_id:19,

      
    );
  }
}



