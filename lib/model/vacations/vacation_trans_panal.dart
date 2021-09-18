

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

 String getAriaLabel(){
return 'طلب $monitortype. , الايام : $period. , من تاريخ : $fromDate. , الى تاريخ : $toDate. , الموظف المناوب : $spareEmp. , الرصيد المتاح : $bal. يوم' ;
}
 String getAriaValue(){
 return 'حالة الطلب : $appreoveState. , $rejectNote';
}

  VacationTransPanel({this.id,this.monitortype, this.spareEmp, this.bal,this.req_reject, this.period,this.fromDate,this.toDate,this.hr_appreoved, this.manager_appreoved, this.appreoved, this.appreoveState,this.rejectNote,this.note});

  factory VacationTransPanel.fromJson(Map<String, dynamic> json) {
    return VacationTransPanel(
      id: json['id'],
      spareEmp: json['spare_emp']??'غير محدد ',
      monitortype: json['monitortype']??'غير محدد ',
      period: json['vdays'],
      bal: json['bal'],
      fromDate: json['fdate']??'غير محدد ',
      toDate: json['todate']??'غير محدد ',
      //manager: json['monitortype']??'',
      hr_appreoved:json['appreoved'],
      manager_appreoved:json['manager_appreoved'],
      appreoved:json['appreoved']&&json['manager_appreoved'],
      req_reject:json['req_reject'],
appreoveState:json['req_reject']?"تم رفض الطلب"
:json['appreoved']&&json['manager_appreoved']?"تمت الموافقة على الطلب":
json['manager_appreoved']? "تم الموافقة من المدير المباشر ، في انتظار الاعتماد "
: " قيد الانتظار للموافقة",
rejectNote: json['rej_reason']??'',
note: json['note']??'',

    );
  }
}


