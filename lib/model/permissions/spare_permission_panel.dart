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
 String getAriaLabel(){
return ' مناوبة عن  الموظف : $emp. , نوع الاذن $monitortype. ,  بتاريخ : $atDate. , من الساعة : $fromHour. , الى الساعة : $toHour. ' ;
}

 String getAriaValue(){
 return 'ملاحظات: $note. ,  المدير المباشر : $manager. ';
}


  SparePermissionPanel({this.monitortype, this.emp,this.note,  this.period,this.atDate,this.fromHour,this.toHour, this.manager});

  factory SparePermissionPanel.fromJson(Map<String, dynamic> json) {
    return SparePermissionPanel(
     //  id: json['id'],
      emp: json['n']??'غير محدد ',
      monitortype: json['monitortype']??'غير محدد ',
      period: json['vdays'],
    //  bal: json['bal'],
      fromHour: json['fhour']??'غير محدد ',
      toHour: json['tohour']??'غير محدد ',
      atDate: json['fdate']??'غير محدد ',
     // req_reject:json['req_reject'],
     manager: json['manager']??'غير محدد ',

note: json['note']??'لا يوجد ',
    );
  }
}




