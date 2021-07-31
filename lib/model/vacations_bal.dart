

class VacationsBal {
  final int id;
  final String availableafter;
  final String monitortype;
  final double usedbal;
    final double remainderbal;
    final double previousbal;
    final double begbal;
    final bool allowHourTrans;

  VacationsBal({this.id,this.allowHourTrans,this.monitortype, this.availableafter, this.remainderbal, this.usedbal,this.previousbal,this.begbal});

  factory VacationsBal.fromJson(Map<String, dynamic> json) {
    return VacationsBal(
      id:json['id']??1,
      allowHourTrans:true,
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
