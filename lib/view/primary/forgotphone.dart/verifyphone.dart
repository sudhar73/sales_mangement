import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:sales/utils/texts.dart';
import 'package:sales/view/primary/newpassword.dart';

class Verifyphone extends StatefulWidget {
  const Verifyphone({ Key? key }) : super(key: key);

  @override
  _VerifyphoneState createState() => _VerifyphoneState();
}

class _VerifyphoneState extends State<Verifyphone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Container(child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height:Get.height/6),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              margin: EdgeInsets.all(15),
              child:Image(image:AssetImage("assets/Logo.png"))),
          ),
          Container(child:Text("Verify Your Phone",style:Texts.style(22.0,HexColor("#023781"),FontWeight.bold))),
      SizedBox(height:15),
        Container(child:Text("Please Enter 4 Digit Code Sent to",style:Texts.style(16.0,HexColor("#023781"),FontWeight.normal))),
     Container(child:Text("86758 34567",style:Texts.style(18.0,HexColor("#023781"),FontWeight.normal))),
    SizedBox(height:10),
      
       Padding(
         padding: const EdgeInsets.all(2.0),
         child: OTPTextField(
  length: 4,
  width: MediaQuery.of(context).size.width,
  fieldWidth: 50,
  style: TextStyle(
    fontSize: 17
  ),
  textFieldAlignment: MainAxisAlignment.spaceAround,
  fieldStyle: FieldStyle.underline,
  onCompleted: (pin) {
    print("Completed: " + pin);
  },
),
       ),
        SizedBox(height:20),
           Container(child:Text("Resend Code",style:Texts.style(18.0,HexColor("#7C8EB2"),FontWeight.bold))),
   
         SizedBox(height:10),
            Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: Center(
                     child: Container(
                       height:60,
                       width:Get.width,
                       child: RaisedButton(
                         shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                         onPressed:(){
                           Get.to(Newpassword());
                         },
                       color:HexColor("#023781"),
                        child:
                           Text("Verify",style:TextStyle(color:Colors.white,fontSize:22,fontWeight: FontWeight.bold)),
                       )),
                   ),
                 ),

        ],),
      ),)
    );
  }
}