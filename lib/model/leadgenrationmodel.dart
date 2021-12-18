class LeadgenrationModel {
  
  String? EnquiryDate,Branch,CompanyName,CustomerName,MobileNumber,EmailId,
         Street1,Street2,ModeofEnquiry,LeadOwner,ServiceLocation,City,
      State,Pincode,Country,ServiceCategory,ServiceDescription,BusinessSector,
  DivisonDepartment,UOM,UnitValue,Quantity,Othercost,QuoteValue,
  CommentsRemarks,isActive,created;
  LeadgenrationModel({ this.EnquiryDate, this.Branch, this.CompanyName,
   this.CustomerName,
  
   this.MobileNumber,this.EmailId,this.Street1,this.Street2,
  
   this.ModeofEnquiry,this.LeadOwner,this.ServiceLocation,
  
   this.City,this.State,this.Pincode,this.Country,
  
   this.ServiceCategory,this.ServiceDescription,this.BusinessSector, 
  
   this.DivisonDepartment,this.UOM,this.UnitValue, this.Quantity,this.Othercost,this.QuoteValue,
    this.CommentsRemarks,this.isActive,this.created});


LeadgenrationModel.fromJson(Map<String ,dynamic> json){
  EnquiryDate=json ['EnquiryDate'];
  Branch=json['Branch'];
  CompanyName=json['CompanyName'];
  CustomerName=json['CustomerName'];
  MobileNumber=json['MobileNumber'];
  EmailId=json['EmailId'];
  Street1=json['Street1'];
  Street2=json['Street2'];
  ModeofEnquiry=json['ModeofEnquiry'];
  LeadOwner=json['LeadOwner'];
  ServiceLocation=json['ServiceLocation'];
  City=json['City'];
  State=json['State'];
  Pincode=json['Pincode'];
  Country=json['Country'];
  ServiceCategory=json['ServiceCategory'];
  ServiceDescription=json['ServiceDescription'];
  BusinessSector=json['BusinessSector'];
  DivisonDepartment=json['DivisonDepartment'];
  UOM=json['UOM'];
  UnitValue=json['UnitValue'];
  Quantity=json['Quantity'];
  Othercost=json['Othercost'];
  QuoteValue=json['QuoteValue'];
  CommentsRemarks=json['CommentsRemarks'];
  isActive=json['isActive'];
  created=json['created'];
}
Map<String, dynamic> toJson() { final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EnquiryDate'] = this.EnquiryDate;
    data['Branch'] = this.Branch;
    data['CompanyName'] = this.CompanyName;
    data['CustomerName'] = this.CustomerName;
    data['MobileNumber'] = this.MobileNumber;
    data['EmailId'] = this.EmailId;
    data['Street1'] = this.Street1;
    data['Street2'] = this.Street2;
    data['ModeofEnquiry'] = this.ModeofEnquiry;
    data['LeadOwner'] = this.LeadOwner;
    data['ServiceLocation'] = this.ServiceLocation;
    data['City'] = this.City;
    data['State'] = this.State;
    data['Pincode'] = this.Pincode;
    data['Country'] = this.Country;
    data['ServiceCategory'] = this.ServiceCategory;
    data['ServiceDescription'] = this.ServiceDescription;
    data['BusinessSector'] = this.BusinessSector;
    data['DivisonDepartment'] = this.DivisonDepartment;
    data['UOM'] = this.UOM;
    data['UnitValue'] = this.UnitValue;
    data['Quantity'] = this.Quantity;
    data['Othercost'] = this.Othercost;
    data['QuoteValue'] = this.QuoteValue;
    data['CommentsRemarks'] = this.CommentsRemarks;
    data['isActive'] = this.isActive;
    data['created'] = this.created;
    return data;
  }



}