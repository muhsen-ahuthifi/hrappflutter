class SparePermissionPanel {
 // final int id;
  final String monitortype;
  final double period;
  //  final double bal;
    final String fromHour;
    final String toHour;
        final String atDate;

     final String note;
      final String emp;
      final String manager;

    //  final bool appreoved;
   //   final bool manager_appreoved;
   //  final bool hr_appreoved;
     // final String appreoveState;

  SparePermissionPanel({this.monitortype, this.emp,this.note,  this.period,this.atDate,this.fromHour,this.toHour, this.manager});

  factory SparePermissionPanel.fromJson(Map<String, dynamic> json) {
    return SparePermissionPanel(
     //  id: json['id'],
      emp: json['n']??'',
      monitortype: json['monitortype']??'',
      period: json['vdays'],
    //  bal: json['bal'],
      fromHour: json['fhour']??'',
      toHour: json['tohour']??'',
      atDate: json['fdate']??'',
     // req_reject:json['req_reject'],
      manager:json['manager']??'',
     
note: json['note']??'',
    );
  }
}




