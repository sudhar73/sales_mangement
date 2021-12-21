import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sales/model/signupmodel.dart';
import 'package:sales/utils/api.dart';
import 'package:sales/utils/texts.dart';
import 'package:sales/view/management/sales_management/lead_genration.dart';
import 'package:sales/view/primary/forgotpassword.dart';
import 'package:http/http.dart' as http;
import 'package:sales/view/primary/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup extends StatefulWidget {
  const Signup({Key key}) : super(key: key);
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  SignupModel signupmodel = SignupModel(
      companyname: '',
      companywebsite: '',
      email: '',
      password: '',
      name: '',
      phonenumber: '');
  final formGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Form(
            key: formGlobalKey,
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: Get.height / 5),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                          margin: EdgeInsets.all(15),
                          child: Image(image: AssetImage("assets/Logo.png"))),
                    ),
                    Container(
                        child: Text("Create Your Account",
                            style: Texts.style(
                                22.0, HexColor("#023781"), FontWeight.bold))),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          elevation: 5,
                          shadowColor: Colors.grey,
                          child: Container(
                              child: TextFormField(
                            decoration: Texts.Textfeild2(
                              "User Name",
                              "Enter Your Name",
                              Icon(
                                Icons.person_outline,
                                color: Colors.grey,
                              ),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "plz enter the username";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (String name) {
                              signupmodel.name = name;
                            },
                          ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          elevation: 5,
                          shadowColor: Colors.grey,
                          child: Container(
                              child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: Texts.Textfeild2(
                              "Email",
                              "Enter Your Email",
                              Icon(
                                Icons.email,
                                color: Colors.grey,
                              ),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "plz enter the email";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (String email) {
                              signupmodel.email = email;
                            },
                          ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          elevation: 5,
                          shadowColor: Colors.grey,
                          child: Container(
                              child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return "plz enter the password";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (String password) {
                              signupmodel.password = password;
                            },
                            decoration: Texts.Textfeild2(
                                "Password",
                                "Your password",
                                Icon(
                                  Icons.lock,
                                  color: Colors.grey,
                                )),
                          ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          elevation: 5,
                          shadowColor: Colors.grey,
                          child: Container(
                              child: TextFormField(
                            keyboardType: TextInputType.phone,
                            decoration: Texts.Textfeild2(
                              "Phone Number",
                              "Enter Your Phone Number",
                              Icon(
                                Icons.mobile_friendly,
                                color: Colors.grey,
                              ),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "plz enter the mobile number";
                              }
                              if (value.length < 9) {
                                return "phone number will not have below 10 digits";
                              }
                              if (value.length > 10) {
                                return "phone number will not have above 10 digits";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (String phonenumber) {
                              signupmodel.phonenumber = phonenumber;
                            },
                          ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          elevation: 5,
                          shadowColor: Colors.grey,
                          child: Container(
                              child: TextFormField(
                            decoration: Texts.Textfeild2(
                              "company name",
                              "Enter Your Company name",
                              Icon(
                                Icons.business,
                                color: Colors.grey,
                              ),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "plz enter the company name";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (String companyname) {
                              signupmodel.companyname = companyname;
                            },
                          ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          elevation: 5,
                          shadowColor: Colors.grey,
                          child: Container(
                              child: TextFormField(
                            decoration: Texts.Textfeild2(
                              "company Website",
                              "Enter Your company Website",
                              Icon(
                                Icons.devices_other,
                                color: Colors.grey,
                              ),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "plz enter the company Website";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (String Companywebsite) {
                              signupmodel.companywebsite = Companywebsite;
                            },
                          ))),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Container(
                            height: 60,
                            width: Get.width,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              onPressed: () {
                                if (formGlobalKey.currentState.validate()) {
                                  formGlobalKey.currentState.save();
                                  FocusScope.of(context).unfocus();
                                  _loginButtonAction(
                                      signupmodel.name,
                                      signupmodel.email,
                                      signupmodel.password,
                                      signupmodel.phonenumber,
                                      signupmodel.companyname,
                                      signupmodel.companywebsite);
                                  print("successfull");
                                } else {
                                  print("else part will work");
                                  Fluttertoast.showToast(
                                      msg: "Please enter all the details",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 2,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 14.0);
                                }
                              },
                              color: HexColor("#023781"),
                              child: Text("Register Now",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Get.to(Signin());
                        },
                        child: Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Have account yet?", style: Texts.primary1b()),
                            Text("Sign in", style: Texts.primary1bold()),
                          ],
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 15), child: Text("Loading")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _loginButtonAction(String name, email, password, phonenumber,
      companyname, companywebsite) async {
    final url = APIConstants.Register;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var bodyvalue =
        // json.encode(
        {
      'Name': name,
      'Email': email,
      'Password': password,
      'PhoneNumber': phonenumber,
      'CompanyName': companyname,
      'CompanyWebsite': companywebsite,
      //'devicetoken': fcmToken
    };
    print(bodyvalue);
    final response = await http.post(Uri.parse(url), body: bodyvalue);
    print(response.body);
    var responseJson = json.decode(response.body);
    print(responseJson);
    var status = responseJson['status'];
    var jsonResponse;
    print(jsonResponse);
    var message = responseJson['message'];
    if (status == 1) {
      Navigator.pop(context);
      sharedPreferences.setString("token", jsonResponse['token']);
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.cyan,
          textColor: Colors.white,
          fontSize: 14.0);
      // navigateTologinPage(context, Login());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Lead_genaration()));
      // replacePage(context, Login());
    } else {
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.blueAccent,
          textColor: Colors.white,
          fontSize: 14.0);
    }
  }

  Future replacePage(context, getPage) async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => getPage));
  }

  Future navigateTologinPage(context, getPage) async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Lead_genaration()));
  }
}
