class ManagerPermissionPanel {
  final int id;
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
    final String rejectNote;
      final String note;

 String getAriaLabel(){
return ' الموظف: $emp. , نوع الاذن $monitortype. ,  بتاريخ : $atDate. , من الساعة : $fromHour. , الى الساعة : $toHour. , الموظف المناوب : $spareEmp. ' ;
}
 String getAriaValue(){
 return 'ملاحظات: $note. , حالة الطلب : $appreoveState. , $rejectNote';
}
  ManagerPermissionPanel({this.id,this.monitortype, this.emp,this.spareEmp, this.bal, this.period,this.atDate,this.fromHour,this.toHour,this.hr_appreoved, this.manager_appreoved, this.appreoved, this.appreoveState,this.rejectNote,this.note});

  factory ManagerPermissionPanel.fromJson(Map<String, dynamic> json) {
    return ManagerPermissionPanel(
     // id: json['id'],
        id: json['id'],
      spareEmp: json['spare_emp']??'غير محدد ',
        emp: json['n']??'غير محدد ',
      monitortype: json['monitortype']??'غير محدد ',
      period: json['vdays'],
      bal: json['bal'],
      fromHour: json['fhour']??'غير محدد ',
      toHour: json['tohour']??'غير محدد ',
      atDate: json['fdate']??'غير محدد ',

      hr_appreoved:json['appreoved'],
      manager_appreoved:json['manager_appreoved'],
      appreoved:json['appreoved']&&json['manager_appreoved'],
      

appreoveState:json['appreoved']&&json['manager_appreoved']?"تمت الموافقة على الطلب":
json['manager_appreoved']? "تم الموافقة من المدير المباشر ، في انتظار الاعتماد "
: " قيد الانتظار للموافقة",

rejectNote: json['rej_reason']??'',
note: json['note']??'لا يوجد ',
    );
  }
}




