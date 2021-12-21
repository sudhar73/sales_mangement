// To parse this JSON data, do
//
//     final leadmodel = leadmodelFromJson(jsonString);

import 'dart:convert';

List<Leadmodel> leadmodelFromJson(String str) => List<Leadmodel>.from(json.decode(str).map((x) => Leadmodel.fromMap(x)));

String leadmodelToJson(List<Leadmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Leadmodel {
    Leadmodel({
        required this.id,
        required this.enquiryDate,
        required this.branch,
        required this.companyName,
        required this.customerName,
        required this.mobileNumber,
        required this.emailId,
        required this.street1,
        required this.street2,
        required this.modeofEnquiry,
        required this.leadOwner,
        required this.serviceLocation,
        required this.city,
        required this.state,
        required this.pincode,
        required this.country,
        required this.serviceCategory,
        required this.serviceDescription,
        required this.businessSector,
        required this.divisonDepartment,
        required this.uom,
        required this.unitValue,
        required this.quantity,
        required this.othercost,
        required this.quoteValue,
        required this.commentsRemarks,
        required this.isActive,
        required this.created,
        required this.v,
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

    factory Leadmodel.fromMap(Map<String, dynamic> json) => Leadmodel(
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
