import 'dart:convert';

List<Salesordermodel> salesordermodelFromJson(String str) => List<Salesordermodel>.from(json.decode(str).map((x) => Salesordermodel.fromJson(x)));

String salesordermodelToJson(List<Salesordermodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Salesordermodel {
    Salesordermodel({
        this.id,
        this.saleOwner,
        this.leadId,
        this.companyName,
        this.customerName,
        this.email,
        this.phoneNumber,
        this.orderDate,
        this.deliveryDate,
        this.billingAddress,
        this.shippingAddress,
        this.productServiceId,
        this.productServiceName,
        this.unitValue,
        this.quantity,
        this.quoteValue,
        this.otherCost,
        this.subTotal,
        this.discount,
        this.tax,
        this.grandTotal,
        this.orderStatus,
        this.isActive,
        this.created,
        this.v,
    });

    String id;
    String saleOwner;
    String leadId;
    String companyName;
    String customerName;
    String email;
    String phoneNumber;
    String orderDate;
    String deliveryDate;
    String billingAddress;
    String shippingAddress;
    String productServiceId;
    String productServiceName;
    String unitValue;
    String quantity;
    String quoteValue;
    String otherCost;
    String subTotal;
    String discount;
    String tax;
    String grandTotal;
    String orderStatus;
    bool isActive;
    DateTime created;
    int v;

    factory Salesordermodel.fromJson(Map<String, dynamic> json) => Salesordermodel(
        id: json["_id"],
        saleOwner: json["SaleOwner"],
        leadId: json["LeadId"],
        companyName: json["CompanyName"],
        customerName: json["CustomerName"],
        email: json["Email"],
        phoneNumber: json["PhoneNumber"],
        orderDate: json["OrderDate"],
        deliveryDate: json["DeliveryDate"],
        billingAddress: json["BillingAddress"],
        shippingAddress: json["ShippingAddress"],
        productServiceId: json["ProductServiceId"],
        productServiceName: json["ProductServiceName"],
        unitValue: json["UnitValue"],
        quantity: json["Quantity"],
        quoteValue: json["QuoteValue"],
        otherCost: json["OtherCost"],
        subTotal: json["SubTotal"],
        discount: json["Discount"],
        tax: json["Tax"],
        grandTotal: json["GrandTotal"],
        orderStatus: json["OrderStatus"],
        isActive: json["isActive"],
        created: DateTime.parse(json["created"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "SaleOwner": saleOwner,
        "LeadId": leadId,
        "CompanyName": companyName,
        "CustomerName": customerName,
        "Email": email,
        "PhoneNumber": phoneNumber,
        "OrderDate": orderDate,
        "DeliveryDate": deliveryDate,
        "BillingAddress": billingAddress,
        "ShippingAddress": shippingAddress,
        "ProductServiceId": productServiceId,
        "ProductServiceName": productServiceName,
        "UnitValue": unitValue,
        "Quantity": quantity,
        "QuoteValue": quoteValue,
        "OtherCost": otherCost,
        "SubTotal": subTotal,
        "Discount": discount,
        "Tax": tax,
        "GrandTotal": grandTotal,
        "OrderStatus": orderStatus,
        "isActive": isActive,
        "created": created.toIso8601String(),
        "__v": v,
    };

  static fromMap(json) {}
}
