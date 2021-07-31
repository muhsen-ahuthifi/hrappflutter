
class PermissionTransPanel {
  final int id;
  final String monitortype;
  final double period;
    final double bal;
    final String fromHour;
    final String toHour;
        final String atDate;

      final String spareEmp;

      final bool appreoved;
      final bool manager_appreoved;
      final bool hr_appreoved;
      final String appreoveState;
      final String rejectNote;
      final String note;
      final bool req_reject;

  PermissionTransPanel({this.id,this.monitortype, this.spareEmp, this.bal, this.period,this.atDate,this.fromHour,this.toHour,this.req_reject,this.hr_appreoved, this.manager_appreoved, this.appreoved, this.appreoveState,this.rejectNote,this.note});

  factory PermissionTransPanel.fromJson(Map<String, dynamic> json) {
    return PermissionTransPanel(
     // id: json['id'],
         id: json['id'],
      spareEmp: json['spare_emp']??'',
      monitortype: json['monitortype']??'',
      period: json['vdays'],
      bal: json['bal'],
      fromHour: json['fhour']??'',
      toHour: json['tohour']??'',
      atDate: json['fdate']??'',
      req_reject:json['req_reject'],

      hr_appreoved:json['appreoved'],
      manager_appreoved:json['manager_appreoved'],
      appreoved:json['appreoved']&&json['manager_appreoved'],
appreoveState:json['req_reject']?"رفضت"
:json['appreoved']&&json['manager_appreoved']?"تمت الموافقة":
" قيد الانتظار",
rejectNote: json['rej_reason']??'',
note: json['note']??'',
    );
  }
}



