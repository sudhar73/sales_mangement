
import 'dart:convert';
import 'package:sales/view/management/sales_management/customerservices.dart';

CustomerServiceModel customerservicemodelFromJson(String str) => CustomerServiceModel.fromJson(json.decode(str));

String customerservicemodelToJson(CustomerServiceModel data) => json.encode(data.toJson());

class CustomerServiceModel{
    CustomerServiceModel({
        this.OrderId,
        this.CustomerName,
        this.Email,
        this.PhoneNumber,
        this.ServiceRequest,
        this.RequestDate,
        this.ServiceOrderId,
         this.CompanyName,
         this.RequestStatus,
         this.RequestEndDate,
         this.isActive,
         this.created,
          });
    String OrderId;
    String CustomerName;
    String Email;
    String PhoneNumber;
    String ServiceRequest;
    String RequestDate;
    String ServiceOrderId;
    String CompanyName;
    String RequestStatus;
    String RequestEndDate;
    String isActive;
    String created;
    factory CustomerServiceModel.fromJson(Map<String, dynamic> json) => CustomerServiceModel(
        OrderId: json["OrderId"],
        CustomerName: json["CustomerName"],
        Email: json["Email"],
        PhoneNumber: json["PhoneNumber"],
        ServiceRequest: json["ServiceRequest"],
        RequestDate: json["RequestDate"],
        ServiceOrderId: json["ServiceOrderId"],
        CompanyName: json["CompanyName"],
        RequestStatus: json["RequestStatus"],
        RequestEndDate: json["RequestEndDate"],
        isActive: json["isActive"],
        created: json["created"],
    );
    Map<String, dynamic> toJson() => {
        "OrderId": OrderId,
        "CustomerName": CustomerName,
        "Email": Email,
        "PhoneNumber":PhoneNumber,
        "ServiceRequest": ServiceRequest,
        "RequestDate": RequestDate,
        "ServiceOrderId": ServiceOrderId,
        "CompanyName": CompanyName,
        "RequestStatus": RequestStatus,
        "RequestEndDate": RequestEndDate,
        "isActive": isActive,
        "created": created,
    };
}
