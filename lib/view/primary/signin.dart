import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sales/model/signupmodel.dart';
import 'package:sales/preference/preference.dart';
import 'package:sales/utils/api.dart';
import 'package:sales/utils/texts.dart';
import 'package:sales/view/management/sales_management/lead_genration.dart';
import 'package:sales/view/primary/forgotpassword.dart';
import 'package:sales/view/primary/signup.dart';
import 'package:http/http.dart' as http;

class Signin extends StatefulWidget {
  const Signin({Key key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  AppSharedPreference preference = AppSharedPreference();
  final formGlobalKey = GlobalKey<FormState>();
  SignupModel signupmodel = SignupModel(
      name: '',
      email: '',
      password: '',
      phonenumber: '',
      companyname: '',
      companywebsite: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: formGlobalKey,
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: Get.height / 6),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                        margin: EdgeInsets.all(15),
                        child: Image(image: AssetImage("assets/Logo.png"))),
                  ),
                  Container(
                      child: Text("Sign in Your Account",
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
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "plz enter the Email";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String email) {
                            signupmodel.email = email;
                          },
                          decoration: Texts.Textfeild2(
                              "Email",
                              "Enter Your Email",
                              Icon(
                                Icons.email,
                                color: Colors.grey,
                              )),
                        ))),
                  ),
                  SizedBox(height: 10),
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
                          onSaved: (password) {
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
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: InkWell(
                      onTap: () {
                        Get.to(Forgotpassword());
                      },
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Text("Forgot Password?",
                              style: TextStyle(
                                  color: HexColor("#7C8EB2"),
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal))),
                    ),
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
                                (formGlobalKey.currentState.save());
                                showAlertDialog(context);
                                _loginButtonaction();
                                //  _loginbutonAction(email, password)
                                //  Get.to(Dashboard());
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Please enter all the details",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 2,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.black,
                                    fontSize: 14.0);
                              }
                            },
                            color: HexColor("#023781"),
                            child: Text("Sign in",
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
                        Get.to(Signup());
                      },
                      child: Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Don't have account?", style: Texts.primary1b()),
                          Text("Register Now", style: Texts.primary1bold()),
                        ],
                      )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  _loginButtonaction() {
    logincheck(signupmodel.email, signupmodel.password);
  }

  logincheck(String email, String password) async {
    final url = APIConstants.login;
    var bodyvalue = {'email': email, 'password': password};
    print(bodyvalue);
    final response = await http.post(Uri.parse(url), body: bodyvalue);
    final responsejson = json.decode(response.body);
    print(responsejson);
    var status = responsejson['status'];
    var message = responsejson['message'];
    if (status == 1) {
      print("test");
      Navigator.pop(context);
      var logindetails = responsejson['user_info'];
      preference.setUserLoggedIn(true);
      preference.save("user", logindetails);
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 14.0);
      // navigateTodashboard(context, Homepage());

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Lead_genaration())); // replacePage(context, Homepage());
    } else {
      print("testfail");

      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 14.0);
    }
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

  Future navigateTodashboard(context, getPage) async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Lead_genaration()));
  }
}
