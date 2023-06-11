

class VacationsBal {
  final int id;
  final String availableafter;
  final String monitortype;
  final double? usedbal;
    final double? remainderbal;
    final double? previousbal;
    final double? begbal;
    final bool allowHourTrans;
 String getAriaLabel(){
return this.monitortype;
}

 String getAriaValue(){
 return 'الرصيد المستخدم: $usedbal. , الرصيد المتبقي: $remainderbal.';
}
  VacationsBal({required this.id,required this.allowHourTrans,required this.monitortype,required this.availableafter, this.remainderbal, this.usedbal,this.previousbal,this.begbal});

  factory VacationsBal.fromJson(Map<String, dynamic> json) {
    return VacationsBal(
      id:json['id']??1,
      allowHourTrans:json['use_hours']??false,
     // id: json['id'],
      availableafter: json['available_after']??'',
      monitortype: json['monitortype']??'',
      usedbal: json['usedbal'],
      remainderbal: json['remainderbal'],
      previousbal: json['previousbal'],
      begbal: json['begbal'],

      
    );
  }
}
