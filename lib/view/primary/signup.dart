import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sales/utils/texts.dart';
import 'package:sales/view/primary/forgotpassword.dart';

class Signup extends StatefulWidget {
  const Signup({ Key? key }) : super(key: key);
  @override
  _SignupState createState() => _SignupState();
}
class _SignupState extends State<Signup> {
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
              SizedBox(height:Get.height/5),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                margin: EdgeInsets.all(15),
                child:Image(image:AssetImage("assets/Logo.png"))),
            ),
            Container(child:Text("Create Your Account",style:Texts.style(22.0,HexColor("#023781"),FontWeight.bold))),
        SizedBox(height:10),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Card(
               elevation: 5,
               shadowColor: Colors.grey,
               child: Container(
                 child:TextFormField(
                  keyboardType: TextInputType.phone,
                   decoration: Texts.Textfeild2(
                   
                   "Phone Number", "Enter Your Phone Number", Icon(Icons.mobile_friendly,color: Colors.grey,),
            
               ),
               validator: (value){
                 if(value!.isEmpty){ 
                   return "plz enter the mobile number";
                 }if(value.length<9){
                   return "please enter valid phone number";
                 }
                 else{
                   return null;
                 }
               },
               ))),
           ),
           SizedBox(height:10),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Card(
               elevation: 5,
               shadowColor: Colors.grey,
               child: Container(child:TextFormField(
                  validator: (value){
                 if(value!.isEmpty){ 
                   return "plz enter the password";
                 }else{
                   return null;
                 }
               },
                 decoration: Texts.Textfeild2("Password", "Your password", Icon(Icons.lock,color: Colors.grey,)),))),
           ),
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
                             Get.to(Forgotpassword()); 
                             }
                           },
                         color:HexColor("#023781"),
                          child:
                             Text("Register Now",style:TextStyle(color:Colors.white,fontSize:22,fontWeight: FontWeight.bold)),
                         )),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(child:Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                       Text("Have account yet?",style:Texts.primary1b()),
                        Text("Sign in",style:Texts.primary1bold()),
                     ],)),
                   )
          ],),
        ),),
      )
    );
  }
}