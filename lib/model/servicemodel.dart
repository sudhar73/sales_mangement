
import 'dart:convert';

ServiceModel servicemodelFromJson(String str) => ServiceModel.fromJson(json.decode(str));

String servicemodelToJson(ServiceModel data) => json.encode(data.toJson());

class ServiceModel {
    ServiceModel({
        this.ProductGroup,
        this.ProductName,
        this.ProductCode,
        this.UnitPrice,
        this.Description,
        this.isActive,
        this.created,
      
    });

    String ProductGroup;
    String ProductName;
    String ProductCode;
    String UnitPrice;
    String Description;
    String isActive;
    String created;

    factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        ProductGroup: json["ProductGroup"],
        ProductName: json["ProductName"],
        ProductCode: json["ProductCode"],
        UnitPrice: json["UnitPrice"],
        Description: json["Description"],
        isActive: json["isActive"],
        created: json["created"],
    );

    Map<String, dynamic> toJson() => {
        "ProductGroup": ProductGroup,
        "ProductName": ProductName,
        "ProductCode": ProductCode,
        "UnitPrice": UnitPrice,
        "Description": Description,
        "isActive": isActive,
        "created": created,
    };
}
