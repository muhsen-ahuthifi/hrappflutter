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

  String getAriaLabel() {
    return ' الموظف: $emp. , نوع الاجازة: $monitortype. , الايام : $period. , من تاريخ : $fromDate. , الى تاريخ : $toDate. , الموظف المناوب : $spareEmp. , الرصيد المتاح : $bal. يوم';
  }

  String getAriaValue() {
    return 'ملاحظات: $note. , حالة الطلب : $appreoveState. , $rejectNote';
  }

  ManagerVacTransPanel(
      {
        required this.id,
    required  this.monitortype,
    required  this.emp,
     required this.spareEmp,
    required  this.bal,
    required  this.period,
     required this.fromDate,
    required  this.toDate,
    required  this.hr_appreoved,
   required   this.manager_appreoved,
    required  this.appreoved,
     required this.appreoveState,
    required  this.rejectNote,
     required this.note});

  factory ManagerVacTransPanel.fromJson(Map<String, dynamic> json) {
    return ManagerVacTransPanel(
      // id: json['id'],
      id: json['id'],
      emp: json['n'] ?? 'غير محدد ',

      spareEmp: json['spare_emp'] ?? 'غير محدد ',
      monitortype: json['monitortype'] ?? 'غير محدد ',
      period: json['vdays']??0,
      bal: json['bal']??0,
      fromDate: json['fdate'] ?? 'غير محدد ',
      toDate: json['todate'] ?? 'غير محدد ',

      hr_appreoved: json['appreoved']??false,
      manager_appreoved: json['manager_appreoved']??false,
      appreoved: json['appreoved']==true && json['manager_appreoved']==true,

      appreoveState: json['appreoved']==true && json['manager_appreoved']==true
          ? "تمت الموافقة على الطلب"
          : json['manager_appreoved']==true
              ? "تم الموافقة من المدير المباشر ، في انتظار الاعتماد "
              : " قيد الانتظار للموافقة",

      rejectNote: json['rej_reason'] ?? '',
      note: json['note'] ?? 'لا يوجد',
    );
  }
}
