// To parse this JSON data, do
//
//     final leadmodel = leadmodelFromJson(jsonString);

import 'dart:convert';

List<Leadmodel> leadmodelFromJson(String str) =>
    List<Leadmodel>.from(json.decode(str).map((x) => Leadmodel.fromJson(x)));

String leadmodelToJson(List<Leadmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Leadmodel {
  Leadmodel({
    this.id,
    this.enquiryDate,
    this.branch,
    this.companyName,
    this.customerName,
    this.mobileNumber,
    this.emailId,
    this.street1,
    this.street2,
    this.modeofEnquiry,
    this.leadOwner,
    this.serviceLocation,
    this.city,
    this.state,
    this.pincode,
    this.country,
    this.serviceCategory,
    this.serviceDescription,
    this.businessSector,
    this.divisonDepartment,
    this.uom,
    this.unitValue,
    this.quantity,
    this.othercost,
    this.quoteValue,
    this.commentsRemarks,
    this.isActive,
    this.created,
    this.v,
  });

  String id;
  String enquiryDate;
  String branch;
  String companyName;
  String customerName;
  String mobileNumber;
  String emailId;
  String street1;
  String street2;
  String modeofEnquiry;
  String leadOwner;
  String serviceLocation;
  String city;
  String state;
  String pincode;
  String country;
  String serviceCategory;
  String serviceDescription;
  String businessSector;
  String divisonDepartment;
  String uom;
  String unitValue;
  String quantity;
  String othercost;
  String quoteValue;
  String commentsRemarks;
  bool isActive;
  String created;
  String v;

  factory Leadmodel.fromJson(Map<String, dynamic> json) => Leadmodel(
        id: json["_id"],
        enquiryDate: json["EnquiryDate"],
        branch: json["Branch"],
        companyName: json["CompanyName"],
        customerName: json["CustomerName"],
        mobileNumber: json["MobileNumber"],
        emailId: json["EmailId"],
        street1: json["Street1"],
        street2: json["Street2"],
        modeofEnquiry: json["ModeofEnquiry"],
        leadOwner: json["LeadOwner"],
        serviceLocation: json["ServiceLocation"],
        city: json["City"],
        state: json["State"],
        pincode: json["Pincode"],
        country: json["Country"],
        serviceCategory: json["ServiceCategory"],
        serviceDescription: json["ServiceDescription"],
        businessSector: json["BusinessSector"],
        divisonDepartment: json["DivisonDepartment"],
        uom: json["UOM"],
        unitValue: json["UnitValue"],
        quantity: json["Quantity"],
        othercost: json["Othercost"],
        quoteValue: json["QuoteValue"],
        commentsRemarks: json["CommentsRemarks"],
        isActive: json["isActive"],
        created: json["created"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "EnquiryDate": enquiryDate,
        "Branch": branch,
        "CompanyName": companyName,
        "CustomerName": customerName,
        "MobileNumber": mobileNumber,
        "EmailId": emailId,
        "Street1": street1,
        "Street2": street2,
        "ModeofEnquiry": modeofEnquiry,
        "LeadOwner": leadOwner,
        "ServiceLocation": serviceLocation,
        "City": city,
        "State": state,
        "Pincode": pincode,
        "Country": country,
        "ServiceCategory": serviceCategory,
        "ServiceDescription": serviceDescription,
        "BusinessSector": businessSector,
        "DivisonDepartment": divisonDepartment,
        "UOM": uom,
        "UnitValue": unitValue,
        "Quantity": quantity,
        "Othercost": othercost,
        "QuoteValue": quoteValue,
        "CommentsRemarks": commentsRemarks,
        "isActive": isActive,
        "created": created,
        "__v": v,
      };
}
