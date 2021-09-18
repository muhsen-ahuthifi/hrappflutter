class ManagerVacTransPanel {
  final int id;
  final String monitortype;
  final double period;
    final double bal;
    final String fromDate;
    final String toDate;
      final String spareEmp;
      final String emp;

      final bool appreoved;
      final bool manager_appreoved;
      final bool hr_appreoved;
      final String appreoveState;
  final String rejectNote;
      final String note;

 String getAriaLabel(){
return ' الموظف: $emp. , نوع الاجازة: $monitortype. , الايام : $period. , من تاريخ : $fromDate. , الى تاريخ : $toDate. , الموظف المناوب : $spareEmp. , الرصيد المتاح : $bal. يوم' ;
}

 String getAriaValue(){
 return 'ملاحظات: $note. , حالة الطلب : $appreoveState. , $rejectNote';
}

  ManagerVacTransPanel({this.id,this.monitortype,this.emp, this.spareEmp, this.bal, this.period,this.fromDate,this.toDate,this.hr_appreoved, this.manager_appreoved, this.appreoved, this.appreoveState,this.rejectNote,this.note});

  factory ManagerVacTransPanel.fromJson(Map<String, dynamic> json) {
    return ManagerVacTransPanel(
     // id: json['id'],
      id: json['id'],
       emp: json['n']??'غير محدد ',

      spareEmp: json['spare_emp']??'غير محدد ',
      monitortype: json['monitortype']??'غير محدد ',
      period: json['vdays'],
      bal: json['bal'],
      fromDate: json['fdate']??'غير محدد ',
      toDate: json['todate']??'غير محدد ',

      hr_appreoved:json['appreoved'],
      manager_appreoved:json['manager_appreoved'],
      appreoved:json['appreoved']&&json['manager_appreoved'],

appreoveState:json['appreoved']&&json['manager_appreoved']?"تمت الموافقة على الطلب":
json['manager_appreoved']? "تم الموافقة من المدير المباشر ، في انتظار الاعتماد "
: " قيد الانتظار للموافقة",

rejectNote: json['rej_reason']??'',
note: json['note']??'لا يوجد',
    );
  }
}




