import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sales/utils/texts.dart';

import 'package:sales/view/primary/forgotphone.dart/verifyphone.dart';
import 'package:sales/view/secondary/dashboard.dart';

class forgotPhone extends StatefulWidget {
  const forgotPhone({ Key? key }) : super(key: key);

  @override
  _forgotPhoneState createState() => _forgotPhoneState();
}

class _forgotPhoneState extends State<forgotPhone> {
   final formGlobalKey = GlobalKey < FormState > ();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Form( 
        key:formGlobalKey,
        child: Container(child: SingleChildScrollView(
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
            Container(child:Text("Forgot Password",style:Texts.style(22.0,HexColor("#023781"),FontWeight.bold))),
        SizedBox(height:15),
          Container(child:Text("Please Enter Your Phone Number to",style:Texts.style(16.0,HexColor("#023781"),FontWeight.normal))),
           Container(child:Text("Receive a Verification Code",style:Texts.style(16.0,HexColor("#023781"),FontWeight.normal))),
          
          SizedBox(height: 5,),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Card(
               elevation: 5,
               shadowColor: Colors.grey,
               child: Container(child:TextFormField(
                  validator: (value){
                   if(value!.isEmpty){ 
                     return "plz enter the phone number";
                   }else{
                     return null;
                   }
                 },
                 decoration: Texts.Textfeild2("Phone Number", "Enter Your Phone Number", Icon(Icons.mobile_friendly,color: Colors.grey,)),))),
           ),
           
           SizedBox(height:10),
             Container(child:Text("Try another way",style:Texts.style(18.0,HexColor("#7C8EB2"),FontWeight.bold))),
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
                             if(formGlobalKey.currentState!.validate()){
                             Get.to(Verifyphone());
                             }
                           },
                         color:HexColor("#023781"),
                          child:
                             Text("Send",style:TextStyle(color:Colors.white,fontSize:22,fontWeight: FontWeight.bold)),
                         )),
                     ),
                   ),
                  
          ],),
        ),),
      )
    );
  }
}