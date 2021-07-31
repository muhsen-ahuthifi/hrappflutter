class SpareVacationPanel {
 // final int id;
  final String monitortype;
  final double period;
    //final double bal;
    final String fromDate;
    final String toDate;
    //  final String spareEmp;
      final String emp;

      // final bool appreoved;
      // final bool manager_appreoved;
      // final bool hr_appreoved;
      // final String appreoveState;
      final String note;
      final String manager;




    SpareVacationPanel({this.monitortype, this.emp,this.note,  this.period,this.fromDate,this.toDate, this.manager});

  factory SpareVacationPanel.fromJson(Map<String, dynamic> json) {
    return SpareVacationPanel(
     //  id: json['id'],
      emp: json['n']??'',
      monitortype: json['monitortype']??'',
      period: json['vdays'],
    //  bal: json['bal'],
       fromDate: json['fdate']??'',
      toDate: json['todate']??'',
     
     // req_reject:json['req_reject'],
      manager:json['manager']??'',
     
note: json['note']??'',
    );
  }
}





