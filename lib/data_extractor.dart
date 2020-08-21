class Visitor{
  String name;
  String phNo;
  String emp;
  String checkInTime;
  int totalVisitor;
  String visitTime;
  String purpose;
  Visitor({this.name,this.phNo,this.checkInTime,this.totalVisitor,this.visitTime,this.emp,this.purpose});
  Visitor.fromJson(Map <String ,dynamic> json){
    name = json['V_Name'];
    phNo = json['V_Contact'];
    checkInTime=json['V_COT'];
    emp=json['V_Emp'];
    totalVisitor=json['V_TotVisitor'];
    visitTime=json['V_VT'];
    purpose=json['V_Puropse'];


  }
}