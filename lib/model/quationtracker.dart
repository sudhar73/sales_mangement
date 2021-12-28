 import 'dart:convert';

Quationtrackermodel quationtrackermodelFromJson(String str) =>
 Quationtrackermodel.fromJson(json.decode(str));

String quationtrackermodelToJson(Quationtrackermodel data) =>
 json.encode(data.toJson());

class Quationtrackermodel {
 Quationtrackermodel({
 this.SaleOwner,
 this.LeadId,
 this.CompanyName,
 this.CustomerName,
 this.Email,
 this.PhoneNumber,
 this.OrderDate,
 this.DeliveryDate,
 this.BillingAddress,
 this.ShippingAddress,
 this.ProductServiceId,
 this.ProductServiceName,
 this.UnitValue,
 this.Quantity,
 this.QuoteValue,
 this.OtherCost,
 this.SubTotal,
 this.Discount,
 this.Tax,
 this.GrandTotal,
 this.QuoteStatus,
 });

 String SaleOwner;
 String LeadId;
 String CompanyName;
 String CustomerName;
 String Email;
 String PhoneNumber;
 String OrderDate;
 String DeliveryDate;
 String BillingAddress;
 String ShippingAddress;
 String ProductServiceId;
 String ProductServiceName;
 String UnitValue;
 String Quantity;
 String QuoteValue;
 String OtherCost;
 String SubTotal;
 String Discount;
 String Tax;
 String GrandTotal;
 String QuoteStatus;

 factory Quationtrackermodel.fromJson(Map<String, dynamic> json) =>
 Quationtrackermodel(
 SaleOwner: json["SaleOwner"],
 LeadId: json["LeadId"],
 CompanyName: json["CompanyName"],
 CustomerName: json["CustomerName"],
 Email: json["Email"],
 PhoneNumber: json["PhoneNumber"],
 OrderDate: json["OrderDate"],
 DeliveryDate: json["DeliveryDate"],
 BillingAddress: json["BillingAddress"],
 ShippingAddress: json["ShippingAddress"],
 ProductServiceId: json["ProductServiceId"],
 ProductServiceName: json["ProductServiceName"],
 UnitValue: json["UnitValue"],
 Quantity: json["Quantity"],
 QuoteValue: json["QuoteValue"],
 OtherCost: json["OtherCost"],
 SubTotal: json["SubTotal"],
 Discount: json["Discount"],
 Tax: json["Tax"],
 GrandTotal: json["GrandTotal"],
 QuoteStatus: json["QuoteStatus"],
 );

 Map<String, dynamic> toJson() => {
 "SaleOwner": SaleOwner,
 "LeadId": LeadId,
 "CompanyName": CompanyName,
 "CustomerName": CustomerName,
 "Email": Email,
 "PhoneNumber": PhoneNumber,
 "OrderDate": OrderDate,
 "DeliveryDate": DeliveryDate,
 "BillingAddress": BillingAddress,
 "ShippingAddress": ShippingAddress,
 "ProductServiceId": ProductServiceId,
 "ProductServiceName": ProductServiceName,
 "UnitValue": UnitValue,
 "Quantity": Quantity,
 "QuoteValue": QuoteValue,
 "OtherCost": OtherCost,
 "SubTotal": SubTotal,
 "Discount": Discount,
 "Tax": Tax,
 "GrandTotal": GrandTotal,
 "QuoteStatus": QuoteStatus,
 };
}
