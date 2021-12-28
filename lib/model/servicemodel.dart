
import 'dart:convert';

ServiceModel servicemodelFromJson(String str) => ServiceModel.fromJson(json.decode(str));

String servicemodelToJson(ServiceModel data) => json.encode(data.toJson());

class ServiceModel {
    ServiceModel({
        this.ServiceGroup,
        this.ServiceName,
        this.ServiceCode,
        this.Price,
        this.Description,
        this.isActive,
        this.created,
      
    });

    String ServiceGroup;
    String ServiceName;
    String ServiceCode;
    String Price;
    String Description;
    String isActive;
    String created;

    factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        ServiceGroup: json["ServiceGroup"],
        ServiceName: json["ServiceName"],
        ServiceCode: json["ServiceCode"],
        Price: json["Price"],
        Description: json["Description"],
        isActive: json["isActive"],
        created: json["created"],
    );

    Map<String, dynamic> toJson() => {
        "ServiceGroup": ServiceGroup,
        "ServiceName": ServiceName,
        "ServiceCode": ServiceCode,
        "Price": Price,
        "Description": Description,
        "isActive": isActive,
        "created": created,
    };
}
