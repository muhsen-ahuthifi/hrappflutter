

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

  VacationTransPanel({required this.id,required this.monitortype,required this.spareEmp,required this.bal,required this.req_reject, required this.period,required this.fromDate,required this.toDate,required this.hr_appreoved, required this.manager_appreoved,required this.appreoved,required this.appreoveState,required this.rejectNote,required this.note});

  factory VacationTransPanel.fromJson(Map<String, dynamic> json) {
    return VacationTransPanel(
      id: json['id'],
      spareEmp: json['spare_emp']??'غير محدد ',
      monitortype: json['monitortype']??'غير محدد ',
      period: json['vdays']??0,
      bal: json['bal']??0,
      fromDate: json['fdate']??'غير محدد ',
      toDate: json['todate']??'غير محدد ',
      //manager: json['monitortype']??'',
      hr_appreoved:json['appreoved']??false,
      manager_appreoved:json['manager_appreoved']??false,
      appreoved:json['appreoved']==true&&json['manager_appreoved']==true,
      req_reject:json['req_reject']??false,
appreoveState:json['req_reject']==true?"تم رفض الطلب"
:json['appreoved']==true&&json['manager_appreoved']==true?"تمت الموافقة على الطلب":
json['manager_appreoved']==true? "تم الموافقة من المدير المباشر ، في انتظار الاعتماد "
: " قيد الانتظار للموافقة",
rejectNote: json['rej_reason']??'',
note: json['note']??'',

    );
  }
}


