class SignupModel {
  String name, email, password, phonenumber, companyname, companywebsite;
  SignupModel(
      {this.name,
      this.email,
      this.password,
      this.phonenumber,
      this.companyname,
      this.companywebsite});

  SignupModel.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    email = json['Email'];
    password = json['Password'];
    phonenumber = json['PhoneNumber'];
    companyname = json['CompanyName'];
    companywebsite = json['CompanyWebsite'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Email'] = this.email;
    data['Password'] = this.password;
    data['PhoneNumber'] = this.phonenumber;
    data['CompanyName'] = this.companyname;
    data['CompanyWebsite'] = this.companywebsite;
    return data;
  }
}
