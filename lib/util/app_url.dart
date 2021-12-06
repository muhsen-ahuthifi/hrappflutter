class AppUrl {
    static const bool devMode = true;

  static const String liveBaseURL = "https://sps.alaman.org/ar/api";
 // static const String localBaseURL = "http://10.0.2.2:4000/api/v1";
//https://sps.alaman.org/ar/api/
  static const String baseURL = liveBaseURL;
   static const String login =  "https://sps.alaman.org/Token";
    //static const String login =  "http://marinafly-001-site1.atempurl.com/Token";

  static const String register = baseURL + "/registration";
  static const String forgotPassword = baseURL + "/forgot-password";
  
  static const String VacationsBal= baseURL + "/VacationsBalPanel";
   static const String VacationTransPanel= baseURL + "/EmpVacationTransPanel";
    static const String SpareVacationPanel= baseURL + "/EmpSpareVacationPanel"; 
    static const String ManagerVacTransPanel= baseURL + "/ManagerVacTransPanel"; 
   static const String PermissionTransPanel= baseURL + "/EmpPermissionTransPanel"; 
    static const String SparePermissionPanel= baseURL + "/EmpSparePermissionPanel"; 
    static const String ManagerPermissionPanel= baseURL + "/ManagerPermissionPanel"; 


  //  static const String SentEvalPanal= baseURL + "/SentEvalPanal"; 
  //   static const String RecivedEvalPanal= baseURL + "/RecivedEvalPanal"; 
  //   static const String EmployeeForEvalPanel= baseURL + "/EmployeeForEvalPanel"; 
  //   static const String EmployeeTermEvalPanal= baseURL + "/EmployeeTermEvalPanal"; 
    static const String VacationTransPost= baseURL + "/VacationTransSync";
    static const String PermissionTransPost= baseURL + "/PermissionTransSync"; 

   static const String ManagerVacationTransPost= baseURL + "/ManageVacationSync";
    static const String ManagerPermissionTransPost= baseURL + "/ManagePermissionSync"; 

 

   static const String SentEvalPanal= baseURL + "/SentEvalPanal";//?emp=127 
  //  static const String RecivedEvalPanal= baseURL + "/RecivedEvalPanal";//?evalemp=127; 
        static const String RecivedEvalPanal= baseURL + "/RecivedEvalPanal"; 

//  static const String EmployeeForEvalPanel= baseURL + "/EmployeeForEvalPanel"; 
       static const String EmployeeForEvalPanel= baseURL + "/EmployeeForEvalPanel";

    static const String EmployeeTermEvalPanal= baseURL + "/EmployeeTermEvalPanal"; //?evalemp=127

    static const String EvalPostDetilsPanal= baseURL + "/EmployeeTermEvalPanal"; 

      static const String PeriodEvalPanal= baseURL + "/EvalByEmpPeriodsPanel"; 
    static const String RecivedHistoryEvalPanal= baseURL + "/RecivedEvalPanal"; 



      static const String EmployeeFilter= baseURL + "/EmployeeFilter"; 

      static const String DocumentTermForEval= baseURL + "/EvalDocumentTermForEval"; 
      static const String EvalPosts= baseURL + "/EvalPostsSyncSimple"; 


      static const String DepartmentPeriodEvalPanal= baseURL + "/EvalByDepartmentPeriodsPanel"; 
      static const String DepartmentEmpEvalPanal= baseURL + "/EvalByDepartmentEmpsPanel"; 

  
}