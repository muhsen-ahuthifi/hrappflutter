class VactionApproveType {
  VactionApproveType._();
  static const String Apporve = "1";
  static const String Reject = "2";

}

class ManagerVacTransPostVM {
  final int id;
  final String monitortype;
  final double period;
    final double bal;
    final String fromDate;
    final String toDate;
      final String spareEmp;
      final String emp;

      final bool appreoved;
      // final bool manager_appreoved;
      // final bool hr_appreoved;
      // final String appreoveState;
  //final String rejectNote;
      final String note;
//  String getAriaLabel(){
// return this.monitortype;
// }
  ManagerVacTransPostVM({required this.id,required this.monitortype,required this.emp,required this.spareEmp,required this.bal,required this.period,required this.fromDate,required this.toDate, required this.appreoved,required this.note});

//   factory ManagerVacTransPostVM.fromJson(Map<String, dynamic> json) {
//     return ManagerVacTransPostVM(
//      // id: json['id'],
//       id: json['id'],
//             emp: json['n']??'',

//       spareEmp: json['spare_emp']??'',
//       monitortype: json['monitortype']??'',
//       period: json['vdays'],
//       bal: json['bal'],
//       fromDate: json['fdate']??'',
//       toDate: json['todate']??'',

//       hr_appreoved:json['appreoved'],
//       manager_appreoved:json['manager_appreoved'],
//       appreoved:json['appreoved']&&json['manager_appreoved'],
// appreoveState:json['appreoved']&&json['manager_appreoved']?"تمت الموافقة":
// " قيد الانتظار",
// rejectNote: json['rej_reason']??'',
// note: json['note']??'',
//     );
//   }
}




