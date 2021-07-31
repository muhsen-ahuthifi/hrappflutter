

class VacationTransPanel {
 final int id;
  final String monitortype;
  final double period;
    final double bal;
    final String fromDate;
    final String toDate;
      final String spareEmp;
     // final String manager;

      final bool appreoved;
      final bool manager_appreoved;
      final bool hr_appreoved;
      final String appreoveState;
      final String rejectNote;
      final String note;
      final bool req_reject;

  VacationTransPanel({this.id,this.monitortype, this.spareEmp, this.bal,this.req_reject, this.period,this.fromDate,this.toDate,this.hr_appreoved, this.manager_appreoved, this.appreoved, this.appreoveState,this.rejectNote,this.note});

  factory VacationTransPanel.fromJson(Map<String, dynamic> json) {
    return VacationTransPanel(
      id: json['id'],
      spareEmp: json['spare_emp']??'',
      monitortype: json['monitortype']??'',
      period: json['vdays'],
      bal: json['bal'],
      fromDate: json['fdate']??'',
      toDate: json['todate']??'',
      //manager: json['monitortype']??'',
      hr_appreoved:json['appreoved'],
      manager_appreoved:json['manager_appreoved'],
      appreoved:json['appreoved']&&json['manager_appreoved'],
      req_reject:json['req_reject'],
appreoveState:json['req_reject']?"رفضت"
:json['appreoved']&&json['manager_appreoved']?"تمت الموافقة":
" قيد الانتظار",
rejectNote: json['rej_reason']??'',
note: json['note']??'',

    );
  }
}


