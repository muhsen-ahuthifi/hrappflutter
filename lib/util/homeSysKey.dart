enum HomeSysKey {
  Vacation,
  Eval,
  Manager,
}

class NavItem {
  String title;
  String subtitle;

  String key;

  NavItem({required this.key,required this.title,required this.subtitle});
}

class AppFromKey {
  static const String VacationsBal = "VacationsBalPanel";
  static const String VacationTransPanel = "EmpVacationTransPanel";
  static const String SpareVacationPanel = "EmpSpareVacationPanel";
  static const String ManagerVacTransPanel = "ManagerVacTransPanel";
  static const String PermissionTransPanel = "EmpPermissionTransPanel";
  static const String SparePermissionPanel = "EmpSparePermissionPanel";
  static const String ManagerPermissionPanel = "ManagerPermissionPanel";

  static const String SentEvalPanal = "SentEvalPanal";
  static const String RecivedEvalPanal = "RecivedEvalPanal";
  static const String EmployeeForEvalPanel = "EmployeeForEvalPanel";

  static const String EmployeeTermEvalPanal = "EmployeeTermEvalPanal";

  static const String PeriodEvalPanal = "EvalByEmpPeriodsPanel";
  static const String RecivedHistoryEvalPanal = "RecivedEvalPanal";

  static const String DocumentTermForEval = "EvalDocumentTermForEval";

  //--new
  static const String DepartmentPeriodEvalPanal = "DepartmentPeriodEvalPanal";
  static const String DepartmentEmpEvalPanal = "DepartmentEmpEvalPanal";
  static const String MessageList = "MessageList";


}

List<NavItem> getNavItems() {
  return [
    NavItem(
        key: AppFromKey.VacationsBal,
        title: "رصيد الاجازات",
        subtitle: "الاجازات"),
    NavItem(
        key: AppFromKey.VacationTransPanel,
        title: "طلبات الاجازات",
        subtitle: "الاجازات"),
    NavItem(
        key: AppFromKey.PermissionTransPanel,
        title: "طلبات الاذونات",
        subtitle: "الاجازات"),
    NavItem(
        key: AppFromKey.SpareVacationPanel,
        title: "المناوبات",
        subtitle: "الاجازات"),
    NavItem(
        key: AppFromKey.SparePermissionPanel,
        title: "مناوبات الاذونات",
        subtitle: "الاجازات"),
    NavItem(
        key: AppFromKey.RecivedEvalPanal,
        title: "التقييمات الواردة",
        subtitle: "التقييم"),
    NavItem(
        key: AppFromKey.SentEvalPanal,
        title: "التقييمات الصادرة",
        subtitle: "التقييم"),
    NavItem(
        key: AppFromKey.EmployeeForEvalPanel,
        title: "تقييمات قيد الانتظار",
        subtitle: "التقييم"),
    NavItem(
        key: AppFromKey.EmployeeTermEvalPanal,
        title: "التقييمات الواردة تفصيلي",
        subtitle: "التقييم"),
    NavItem(
        key: AppFromKey.PeriodEvalPanal,
        title: "تقييم لفترات",
        subtitle: "التقييم"),
    NavItem(
        key: AppFromKey.DepartmentEmpEvalPanal,
        title: "تقييم موظفي القسم",
        subtitle: "التقييم"),
    NavItem(
        key: AppFromKey.DepartmentPeriodEvalPanal,
        title: "تقييم القسم لفترات",
        subtitle: "التقييم"),
    NavItem(
        key: AppFromKey.ManagerVacTransPanel,
        title: "الموافقة على الاجازات",
        subtitle: "الاعتماد"),
    NavItem(
        key: AppFromKey.ManagerPermissionPanel,
        title: "الموافقة على الاذونات",
        subtitle: "الاعتماد"),
           NavItem(
        key: AppFromKey.MessageList,
        title: "الاشعارات والرسائل",
        subtitle: "الاشعارات"),
  ];
}
