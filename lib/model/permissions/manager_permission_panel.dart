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
  ManagerPermissionPanel({required this.id,required this.monitortype, required this.emp,required this.spareEmp,required this.bal, required this.period,required this.atDate,required this.fromHour,required this.toHour,required this.hr_appreoved, required this.manager_appreoved,required this.appreoved,required this.appreoveState,required this.rejectNote,required this.note});

  factory ManagerPermissionPanel.fromJson(Map<String, dynamic> json) {
    return ManagerPermissionPanel(
     // id: json['id'],
        id: json['id'],
      spareEmp: json['spare_emp']??'غير محدد ',
        emp: json['n']??'غير محدد ',
      monitortype: json['monitortype']??'غير محدد ',
      period: json['vdays']??0,
      bal: json['bal']??0,
      fromHour: json['fhour']??'غير محدد ',
      toHour: json['tohour']??'غير محدد ',
      atDate: json['fdate']??'غير محدد ',

      hr_appreoved:json['appreoved']??false,
      manager_appreoved:json['manager_appreoved']??false,
      appreoved:json['appreoved']==true&&json['manager_appreoved']==true,
      

appreoveState:json['appreoved']==true&&json['manager_appreoved']==true?"تمت الموافقة على الطلب":
json['manager_appreoved']==true? "تم الموافقة من المدير المباشر ، في انتظار الاعتماد "
: " قيد الانتظار للموافقة",

rejectNote: json['rej_reason']??'',
note: json['note']??'لا يوجد ',
    );
  }
}




