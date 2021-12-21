class SalesfollowupModel {
  String LeadId,
      EmployeeName,
      EmployeeId,
      CustomerName,
      EmailId,
      PhoneNumber,
      Date,
      Time,
      ProductServiceName,
      CallDetails,
      CallResult,
      FollowupRequired,
      FollowupDate,
      isActive,
      created;
  SalesfollowupModel(
      {this.LeadId,
      this.EmployeeName,
      this.EmployeeId,
      this.CustomerName,
      this.EmailId,
      this.PhoneNumber,
      this.Date,
      this.Time,
      this.ProductServiceName,
      this.CallDetails,
      this.CallResult,
      this.FollowupRequired,
      this.FollowupDate,
      this.isActive,
      this.created});

  SalesfollowupModel.fromJson(Map<String, dynamic> json) {
    LeadId = json['LeadId'];
    EmployeeName = json['EmployeeName'];
    EmployeeId = json['EmployeeId'];
    CustomerName = json['CustomerName'];
    EmailId = json['EmailId'];
    PhoneNumber = json['PhoneNumber'];
    Date = json['Date'];
    Time = json['Time'];
    ProductServiceName = json['ProductServiceName'];
    CallDetails = json['CallDetails'];
    CallResult = json['CallResult'];
    FollowupRequired = json['FollowupRequired'];
    FollowupDate = json['FollowupDate'];
    isActive = json['isActive'];
    created = json['created'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LeadId'] = this.LeadId;
    data['EmployeeName'] = this.EmployeeName;
    data['EmployeeId'] = this.EmployeeId;
    data['CustomerName'] = this.CustomerName;
    data['EmailId'] = this.EmailId;
    data['PhoneNumber'] = this.PhoneNumber;
    data['Date'] = this.Date;
    data['Time'] = this.Time;
    data['ProductServiceName'] = this.ProductServiceName;
    data['CallDetails'] = this.CallDetails;
    data['CallResult'] = this.CallResult;
    data['FollowupRequired'] = this.FollowupRequired;
    data['FollowupDate'] = this.FollowupDate;
    data['isActive'] = this.isActive;
    data['created'] = this.created;
    return data;
  }
}
