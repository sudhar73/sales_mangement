class Salesrespensentativemodel{
  
  String? EmployeeName,EmployeeId,EmailId,PhoneNumber,Department,Designation,
         ProductName,Image,isActive,created;

  
  Salesrespensentativemodel({ this.EmployeeName, this.EmployeeId, this.EmailId,
   this.PhoneNumber,
   this.Department,this.Designation,this.ProductName,this.Image, 
   this.isActive,this.created});

Salesrespensentativemodel.fromJson(Map<String ,dynamic> json){
  EmployeeName=json ['EmployeeName'];
  EmployeeId=json['EmployeeId'];
  EmailId=json['EmailId'];
  PhoneNumber=json['PhoneNumber'];
  Department=json['Department'];
  Designation=json['Designation'];
  ProductName=json['ProductName'];
  Image=json['Image'];
  isActive=json['isActive'];
  created=json['created'];
}
Map<String, dynamic> toJson() {  Map<String, dynamic> data = new Map<String, dynamic>();
    data['EmployeeName'] = this.EmployeeName;
    data['EmployeeId'] = this.EmployeeId;
    data['EmailId'] = this.EmailId;
    data['PhoneNumber'] = this.PhoneNumber;
    data['Department'] = this.Department;
    data['Designation'] = this.Designation;
    data['ProductName'] = this.ProductName;
    data['Image'] = this.Image;
    data['isActive'] = this.isActive;
    data['created'] = this.created;
    return data;
  }
}