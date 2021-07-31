

class VacationTransPanel {
 // final int id;
  final String monitortype;
  final double period;
    final double bal;
    final String fromDate;
    final String toDate;
      final String spareEmp;

      final bool appreoved;
      final bool manager_appreoved;
      final bool hr_appreoved;
      final String appreoveState;
      final String rejectNote;

  VacationTransPanel({this.monitortype, this.spareEmp, this.bal, this.period,this.fromDate,this.toDate,this.hr_appreoved, this.manager_appreoved, this.appreoved, this.appreoveState,this.rejectNote});

  factory VacationTransPanel.fromJson(Map<String, dynamic> json) {
    return VacationTransPanel(
     // id: json['id'],
      spareEmp: json['available_after']??'',
      monitortype: json['monitortype']??'',
      period: json['usedbal'],
      bal: json['remainderbal'],
      fromDate: json['available_after']??'',
      toDate: json['available_after']??'',

      hr_appreoved:false,
      manager_appreoved:false,
      appreoved:false,
appreoveState:"قيد الانتظار",
rejectNote:'',
    );
  }
}


