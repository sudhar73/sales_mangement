
import 'dart:convert';

ProductModel productmodelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productmodelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
    ProductModel({
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

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
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
