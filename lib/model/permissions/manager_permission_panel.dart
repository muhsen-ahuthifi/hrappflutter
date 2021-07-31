class ManagerPermissionPanel {
 // final int id;
  final String monitortype;
  final double period;
    final double bal;
    final String fromHour;
    final String toHour;
        final String atDate;

      final String spareEmp;
      final String emp;

      final bool appreoved;
      final bool manager_appreoved;
      final bool hr_appreoved;
      final String appreoveState;

  ManagerPermissionPanel({this.monitortype, this.emp,this.spareEmp, this.bal, this.period,this.atDate,this.fromHour,this.toHour,this.hr_appreoved, this.manager_appreoved, this.appreoved, this.appreoveState});

  factory ManagerPermissionPanel.fromJson(Map<String, dynamic> json) {
    return ManagerPermissionPanel(
     // id: json['id'],
      emp: json['available_after']??'',
      spareEmp: json['available_after']??'',
      monitortype: json['monitortype']??'',
      period: json['usedbal'],
      bal: json['remainderbal'],
      fromHour: json['available_after']??'',
      toHour: json['available_after']??'',
atDate: json['available_after']??'',
      hr_appreoved:false,
      manager_appreoved:false,
      appreoved:false,
appreoveState:"قيد الانتظار",
    );
  }
}




