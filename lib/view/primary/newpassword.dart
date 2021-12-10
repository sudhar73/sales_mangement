import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:sales/utils/texts.dart';
import 'package:sales/view/primary/signin.dart';

class Newpassword extends StatefulWidget {
  Newpassword({Key? key}) : super(key: key);

  @override
  _NewpasswordState createState() => _NewpasswordState();
}

class _NewpasswordState extends State<Newpassword> {
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
          Container(child:Text("Create New Password",style:Texts.style(22.0,HexColor("#023781"),FontWeight.bold))),
       SizedBox(height:15),
        Container(child:Text("Your New Password must be Different",style:Texts.style(16.0,HexColor("#023781"),FontWeight.normal))),
     Container(child:Text("from Previously Used Password",style:Texts.style(16.0,HexColor("#023781"),FontWeight.normal))),
    
      SizedBox(height:10),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Card(
             elevation: 5,
             shadowColor: Colors.grey,
             child: Container(child:TextField(decoration: Texts.Textfeild2("New Password", "New Password", Icon(Icons.lock,color: Colors.grey,)),))),
         ),
         SizedBox(height:10),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Card(
             elevation: 5,
             shadowColor: Colors.grey,
             child: Container(child:TextField(decoration: Texts.Textfeild2("Confirm Password", "Confirm Password", Icon(Icons.lock,color: Colors.grey,)),))),
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
                           Get.to(Signin());
                         },
                       color:HexColor("#023781"),
                        child:
                           Text("Save",style:TextStyle(color:Colors.white,fontSize:22,fontWeight: FontWeight.bold)),
                       )),
                   ),
                 ),
               
        ],),
      ),)
    );
  }
}