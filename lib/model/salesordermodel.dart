import 'dart:convert';

List<Salesordermodel> salesordermodelFromJson(String str) =>
 List<Salesordermodel>.from(
 json.decode(str).map((x) => Salesordermodel.fromJson(x)));

String salesordermodelToJson(List<Salesordermodel> data) =>
 json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Salesordermodel {
 Salesordermodel({
 this.id,
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
 this.OrderStatus,
 this.isActive,
 this.created,
 this.v,
 });

 String id;
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
 String OrderStatus;
 bool isActive;
 DateTime created;
 int v;

 factory Salesordermodel.fromJson(Map<String, dynamic> json) =>
 Salesordermodel(
 id: json["_id"],
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
 OrderStatus: json["OrderStatuss"],
 isActive: json["isActive"],
 created: DateTime.parse(json["created"]),
 v: json["__v"],
 );

 Map<String, dynamic> toJson() => {
 "_id": id,
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
 "OrderStatus": OrderStatus,
 "isActive": isActive,
 "created": created.toIso8601String(),
 "__v": v,
 };

 static fromMap(json) {}
}