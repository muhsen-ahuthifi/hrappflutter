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


 String getAriaLabel(){
return ' مناوبة عن  الموظف : $emp. , نوع الاجازة: $monitortype. , الايام : $period. , من تاريخ : $fromDate. , الى تاريخ : $toDate. ';
}
 String getAriaValue(){
 return 'ملاحظات: $note. ,  المدير المباشر : $manager. ';
}

    SpareVacationPanel({this.monitortype, this.emp,this.note,  this.period,this.fromDate,this.toDate, this.manager});

  factory SpareVacationPanel.fromJson(Map<String, dynamic> json) {
    return SpareVacationPanel(
     //  id: json['id'],
      emp: json['n']??'غير محدد ',
      monitortype: json['monitortype']??'غير محدد ',
      period: json['vdays'],
    //  bal: json['bal'],
       fromDate: json['fdate']??'غير محدد ',
      toDate: json['todate']??'غير محدد ',
     
     // req_reject:json['req_reject'],
      manager: json['manager']??'غير محدد ',
     
note: json['note']??'لا يوجد',
    );
  }
}





