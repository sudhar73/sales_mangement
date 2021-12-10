import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sales/utils/texts.dart';


class Settings extends StatefulWidget {
  const Settings({ Key? key }) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool value=false;
  int val=-1;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        elevation: 0,
        backgroundColor:HexColor("#023781"),
        toolbarHeight: 60,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              
              
                backgroundColor:HexColor("#7C8EB2"),
            radius: 30,
            child: Icon(Icons.people_sharp,color:Colors.white) )
          )
        ],
        leading: Icon(Icons.menu,color:Colors.white),
title:Material(
                    elevation: 3,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      //margin: EdgeInsets.only(top: 20),
                      // width: width * 0.7,
                      height:50,
                      child: TextField(
                        decoration: Texts.Textfeild("Search here",Icon(Icons.search,color:Colors.grey)),
                        style: Texts.style(
                         Texts.h6, Colors.black, Texts.normal),
                      ),),
                  ),
      ),
      body:Container(child:SingleChildScrollView(child:Column(children: [
        Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(children: [
                Image(image: AssetImage("assets/dashboard/dashboard-active.png"),),
                Icon(Icons.arrow_right),
                Text("General & Administraion",style:Texts.style(Texts.h9, HexColor("#7C8EB2"), Texts.normal)),
                Icon(Icons.arrow_right),
                Text("Company Management",style:Texts.style(Texts.h9, HexColor("#7C8EB2"), Texts.normal))
              ],),
            ),

Container(child:Text("Settings",style:Texts.primary1d())),

SizedBox(height:10),

changepassword(),
basicpassword(),
emailsettings(),
invoicesettings(),
salarysettings(),
approvalsettings(),
      ],)))
    );
  }
  changepassword(){
    return Padding(
              padding:EdgeInsets.all(8,),
              child: Container(
                decoration: Texts.decor(Colors.transparent),
                child: ExpansionTile(
                  collapsedBackgroundColor: HexColor("#172B4D"),
                  iconColor: HexColor("#172B4D"),
                  backgroundColor: HexColor("#F6F6F6"),
                  collapsedIconColor: Colors.white,
                  textColor: HexColor("#172B4D"),
                  collapsedTextColor: Colors.white,
           expandedAlignment: Alignment.topLeft,
                title:  Container(
                   child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Change Password",style:TextStyle(fontSize:18,fontWeight: FontWeight.bold))),),
                expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                children: [ 
                   Padding(
                    padding: const EdgeInsets.only(left:8,right:8,top:10),
                    child: Text("Old Password",style:Texts.primary2a()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container(child:TextField(decoration: Texts.Textfeild1(),))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:8,right:8,top:10),
                    child: Text("New Password",style:Texts.primary2a()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container(child:TextField(decoration: Texts.Textfeild1(),))),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(left:8,right:8,top:10),
                    child: Text("Confirm New Password",style:Texts.primary2a()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container(child:TextField(decoration: Texts.Textfeild1(),))),
                  ),
                  
                   Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Center(
                   child: Container(
                     height:50,
                     width:100,
                     child: RaisedButton(
                       shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                       onPressed:(){
                 
                       },
                     color:HexColor("#023781"),
                      child:
                      
                         Text("SAVE",style:TextStyle(color:Colors.white,fontSize:16)),
                       
                    )),
                 ),
               )
                
                  ],
                ),
              ),
              
              );
  }
  basicpassword(){
     return Padding(
              padding:EdgeInsets.all(8,),
              child: Container(
                decoration: Texts.decor(Colors.transparent),
                child: ExpansionTile(
                  collapsedBackgroundColor: HexColor("#172B4D"),
                  iconColor: HexColor("#172B4D"),
                  backgroundColor: Colors.transparent,
                  collapsedIconColor: Colors.white,
                  textColor: HexColor("#172B4D"),
                  collapsedTextColor: Colors.white,
           expandedAlignment: Alignment.topLeft,
                title:  Container(
                   child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Basic Settings",style:TextStyle(fontSize:18,fontWeight: FontWeight.bold))),),
                expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                children: [ 
                   Padding(
                    padding: const EdgeInsets.only(left:8,right:8,top:10),
                    child: Text("Default Country",style:Texts.primary2a()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container(child:TextField(decoration: Texts.Textfeild1(),))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:8,right:8,top:10),
                    child: Text("Date Format",style:Texts.primary2a()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container(child:TextField(decoration: Texts.Textfeild1(),))),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(left:8,right:8,top:10),
                    child: Text("Time Zone",style:Texts.primary2a()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container(child:TextField(decoration: Texts.Textfeild1(),))),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(left:8,right:8,top:10),
                    child: Text("Default Language",style:Texts.primary2a()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container(child:TextField(decoration: Texts.Textfeild1(),))),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(left:8,right:8,top:10),
                    child: Text("Currency Code",style:Texts.primary2a()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container(child:TextField(decoration: Texts.Textfeild1(),))),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(left:8,right:8,top:10),
                    child: Text("Currency Symbol",style:Texts.primary2a()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container(child:TextField(decoration: Texts.Textfeild1(),))),
                  ),
                  
                   Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Center(
                   child: Container(
                     height:50,
                     width:100,
                     child: RaisedButton(
                       shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                       onPressed:(){
                         Get.to(Settings());
                       },
                     color:HexColor("#023781"),
                      child:
                      
                         Text("SAVE",style:TextStyle(color:Colors.white,fontSize:16)),
                       
                    )),
                 ),
               )
                
                  ],
                ),
              ),
              
              );
  }
  emailsettings(){
   
     String? _selectedGender = 'male';
     return Padding(
              padding:EdgeInsets.all(8,),
              child: Container(
                decoration: Texts.decor(Colors.transparent),
                child: ExpansionTile(
                  collapsedBackgroundColor: HexColor("#172B4D"),
                  iconColor: HexColor("#172B4D"),
                  backgroundColor: Colors.transparent,
                  collapsedIconColor: Colors.white,
                  textColor: HexColor("#172B4D"),
                  collapsedTextColor: Colors.white,
           expandedAlignment: Alignment.topLeft,
                title:  Container(
                   child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Email Settings",style:TextStyle(fontSize:18,fontWeight: FontWeight.bold))),),
                expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                children: [ 

                 Center(
                   child: Container(child:Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                     Radio(
                    value: 'male',
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender =value as String?;
                      });
                    },
                ),
                      Text("Mail",style:Texts.primary1d()), 
                   Radio(
                    value: 'female',
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender =value as String?;
                      });
                    },
                ),
                      Text("SMTP",style:Texts.primary1d()), 
                
                   ],)),
                 ),

                   Padding(
                    padding: const EdgeInsets.only(left:8,right:8,top:10),
                    child: Text("Email Encryption",style:Texts.primary2a()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container(child:TextField(decoration: Texts.Textfeild1(),))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:8,right:8,top:10),
                    child: Text("Mail Host",style:Texts.primary2a()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container(child:TextField(decoration: Texts.Textfeild1(),))),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(left:8,right:8,top:10),
                    child: Text("Mail Port",style:Texts.primary2a()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container(child:TextField(decoration: Texts.Textfeild1(),))),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(left:8,right:8,top:10),
                    child: Text("Email",style:Texts.primary2a()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container(child:TextField(decoration: Texts.Textfeild1(),))),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(left:8,right:8,top:10),
                    child: Text("Mail Username",style:Texts.primary2a()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container(child:TextField(decoration: Texts.Textfeild1(),))),
                  ),
                  
                    Padding(
                    padding: const EdgeInsets.only(left:8,right:8,top:10),
                    child: Text("Mail Password",style:Texts.primary2a()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container(child:TextField(decoration: Texts.Textfeild1(),))),
                  ),
                  
                   Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Center(
                   child: Container(
                     height:50,
                     width:100,
                     child: RaisedButton(
                       shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                       onPressed:(){
                         Get.to(Settings());
                       },
                     color:HexColor("#023781"),
                      child:
                      
                         Text("SAVE",style:TextStyle(color:Colors.white,fontSize:16)),
                       
                    )),
                 ),
               )
                
                  ],
                ),
              ),
              
              );
  }
  invoicesettings(){
     return Padding(
              padding:EdgeInsets.all(8,),
              child: Container(
                decoration: Texts.decor(Colors.transparent),
                child: ExpansionTile(
                  collapsedBackgroundColor: HexColor("#172B4D"),
                  iconColor: HexColor("#172B4D"),
                  backgroundColor: Colors.transparent,
                  collapsedIconColor: Colors.white,
                  textColor: HexColor("#172B4D"),
                  collapsedTextColor: Colors.white,
           expandedAlignment: Alignment.topLeft,
                title:  Container(
                   child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Invoice Settings",style:TextStyle(fontSize:18,fontWeight: FontWeight.bold))),),
                expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                children: [ 
                   Padding(
                    padding: const EdgeInsets.only(left:8,right:8,top:10),
                    child: Text("Invoice Number",style:Texts.primary2a()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container(child:TextField(decoration: Texts.Textfeild1(),))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:8,right:8,top:10),
                    child: Text("Date",style:Texts.primary2a()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container(child:TextField(decoration: Texts.Textfeild1(),))),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(left:8,right:8,top:10),
                    child: Text("Amount",style:Texts.primary2a()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container(child:TextField(decoration: Texts.Textfeild1(),))),
                  ),
                  
                   Padding(
                    padding: const EdgeInsets.only(left:8,right:8,top:10),
                    child: Text("Payment Via",style:Texts.primary2a()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container(child:TextField(decoration: Texts.Textfeild1(),))),
                  ),
                  
                   Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Center(
                   child: Container(
                     height:50,
                     width:100,
                     child: RaisedButton(
                       shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                       onPressed:(){
                         Get.to(Settings());
                       },
                     color:HexColor("#023781"),
                      child:
                      
                         Text("SAVE",style:TextStyle(color:Colors.white,fontSize:16)),
                       
                    )),
                 ),
               )
                
                  ],
                ),
              ),
              
              );
  }
  salarysettings(){
     return Padding(
              padding:EdgeInsets.all(8,),
              child: Container(
                decoration: Texts.decor(Colors.transparent),
                child: ExpansionTile(
                  collapsedBackgroundColor: HexColor("#172B4D"),
                  iconColor: HexColor("#172B4D"),
                  backgroundColor: Colors.transparent,
                  collapsedIconColor: Colors.white,
                  textColor: HexColor("#172B4D"),
                  collapsedTextColor: Colors.white,
           expandedAlignment: Alignment.topLeft,
                title:  Container(
                   child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Salary Setting",style:TextStyle(fontSize:18,fontWeight: FontWeight.bold))),),
                expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                children: [ 
                  Container(child:Row(
                    crossAxisAlignment:CrossAxisAlignment.center,
                    children: [
                  Padding(
                    padding: const EdgeInsets.only(left:8,right:8,top:10),
                    child: Text("DA & HRA Settings",style:Texts.primary2a()),
                  ),
 Padding(
                    padding: const EdgeInsets.only(left:1,right:8,top:10),
 child:Switchscreen())
                  ],)),
                   Padding(
                    padding: const EdgeInsets.only(left:8,right:8,top:10),
                    child: Text("DA(%)",style:Texts.primary2a()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container(child:TextField(decoration: Texts.Textfeild1(),))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:8,right:8,top:10),
                    child: Text("HRA(%)",style:Texts.primary2a()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container(child:TextField(decoration: Texts.Textfeild1(),))),
                  ),
SizedBox(height:5),
                    Container(child:Row(
                    crossAxisAlignment:CrossAxisAlignment.center,
                    children: [
                  Padding(
                    padding: const EdgeInsets.only(left:8,right:8,top:10),
                    child: Text("Provident Fund Settings",style:Texts.primary2a()),
                  ),
 Padding(
                    padding: const EdgeInsets.only(left:1,right:8,top:10),
 child:Switchscreen())
                  ],)),
                   Padding(
                    padding: const EdgeInsets.only(left:8,right:8,top:10),
                    child: Text("Employee Share(%)",style:Texts.primary2a()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container(child:TextField(decoration: Texts.Textfeild1(),))),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(left:8,right:8,top:10),
                    child: Text("Organisation Share(%)",style:Texts.primary2a()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container(child:TextField(decoration: Texts.Textfeild1(),))),
                  ),
SizedBox(height:10),
                  Container(child:Row(
                    crossAxisAlignment:CrossAxisAlignment.center,
                    children: [
                  Padding(
                    padding: const EdgeInsets.only(left:8,right:8,top:10),
                    child: Text("ESI Settings",style:Texts.primary2a()),
                  ),
 Padding(
                    padding: const EdgeInsets.only(left:1,right:8,top:10),
 child:Switchscreen())
                  ],)),
                   Padding(
                    padding: const EdgeInsets.only(left:8,right:8,top:10),
                    child: Text("Employee Share(%)",style:Texts.primary2a()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container(child:TextField(decoration: Texts.Textfeild1(),))),
                  ),
                  
                   Padding(
                    padding: const EdgeInsets.only(left:8,right:8,top:10),
                    child: Text("Organisation Share(%)",style:Texts.primary2a()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container(child:TextField(decoration: Texts.Textfeild1(),))),
                  ),
                   Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Center(
                   child: Container(
                     height:50,
                     width:100,
                     child: RaisedButton(
                       shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                       onPressed:(){
                         Get.to(Settings());
                       },
                     color:HexColor("#023781"),
                      child:
                      
                         Text("SAVE",style:TextStyle(color:Colors.white,fontSize:16)),
                       
                    )),
                 ),
               )
                
                  ],
                ),
              ),
              
              );
  }
  approvalsettings(){
     return Padding(
              padding:EdgeInsets.all(8,),
              child: Container(
                decoration: Texts.decor(Colors.transparent),
                child: ExpansionTile(
                  collapsedBackgroundColor: HexColor("#172B4D"),
                  iconColor: HexColor("#172B4D"),
                  backgroundColor: Colors.transparent,
                  collapsedIconColor: Colors.white,
                  textColor: HexColor("#172B4D"),
                  collapsedTextColor: Colors.white,
           expandedAlignment: Alignment.topLeft,
                title:  Container(
                   child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Approval Settings",style:TextStyle(fontSize:18,fontWeight: FontWeight.bold))),),
                expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                children: [ 
                   Padding(
                    padding: const EdgeInsets.only(left:8,right:8,top:10),
                    child: Text("Expense Approval",style:Texts.primary1d()),
                  ),
                  Container(
                    child:Row(
                      children: [
  Padding(
                       padding: const EdgeInsets.only(left:8,right:8,top:10),
                     child: Text("Approver 1",style:Texts.primary2a()),
                 ),
                 
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                     child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container( height:60,width:Get.width/1.5,
                      child:TextField(decoration: Texts.Textfeild1(),))),
                 ),
                  ],)),
                    Container(
                    child:Row(
                      children: [
  Padding(
                       padding: const EdgeInsets.only(left:8,right:8,top:10),
                     child: Text("Approver 2",style:Texts.primary2a()),
                 ),
                 
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                     child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container( height:60,width:Get.width/1.5,
                      child:TextField(decoration: Texts.Textfeild1(),))),
                 ),
                  ],)),
                    Container(
                    child:Row(
                      children: [
  Padding(
                       padding: const EdgeInsets.only(left:8,right:8,top:10),
                     child: Text("Approver 3",style:Texts.primary2a()),
                 ),
               Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                     child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container( height:60,width:Get.width/1.5,
                      child:TextField(decoration: Texts.Textfeild1(),))),
                 ),
                  ],)),
SizedBox(height:10),
    Padding(
                    padding: const EdgeInsets.only(left:8,right:8,top:10),
                    child: Text("Leave Approval",style:Texts.primary1d()),
                  ),
                  Container(
                    child:Row(
                      children: [
  Padding(
                       padding: const EdgeInsets.only(left:8,right:8,top:10),
                     child: Text("Approver 1",style:Texts.primary2a()),
                 ),
                 
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                     child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container( height:60,width:Get.width/1.5,
                      child:TextField(decoration: Texts.Textfeild1(),))),
                 ),
                  ],)),
                    Container(
                    child:Row(
                      children: [
  Padding(
                       padding: const EdgeInsets.only(left:8,right:8,top:10),
                     child: Text("Approver 2",style:Texts.primary2a()),
                 ),
                 
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                     child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container( height:60,width:Get.width/1.5,
                      child:TextField(decoration: Texts.Textfeild1(),))),
                 ),
                  ],)),
                    Container(
                    child:Row(
                      children: [
  Padding(
                       padding: const EdgeInsets.only(left:8,right:8,top:10),
                     child: Text("Approver 3",style:Texts.primary2a()),
                 ),
               Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                     child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container( height:60,width:Get.width/1.5,
                      child:TextField(decoration: Texts.Textfeild1(),))),
                 ),
                  ],)),          
                  
SizedBox(height:10),
    Padding(
                    padding: const EdgeInsets.only(left:8,right:8,top:10),
                    child: Text("Offer/Promotional Approval",style:Texts.primary1d()),
                  ),
                  Container(
                    child:Row(
                      children: [
  Padding(
                       padding: const EdgeInsets.only(left:8,right:8,top:10),
                     child: Text("Approver 1",style:Texts.primary2a()),
                 ),
                 
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                     child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container( height:60,width:Get.width/1.5,
                      child:TextField(decoration: Texts.Textfeild1(),))),
                 ),
                  ],)),
                    Container(
                    child:Row(
                      children: [
  Padding(
                       padding: const EdgeInsets.only(left:8,right:8,top:10),
                     child: Text("Approver 2",style:Texts.primary2a()),
                 ),
                 
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                     child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container( height:60,width:Get.width/1.5,
                      child:TextField(decoration: Texts.Textfeild1(),))),
                 ),
                  ],)),
                    Container(
                    child:Row(
                      children: [
  Padding(
                       padding: const EdgeInsets.only(left:8,right:8,top:10),
                     child: Text("Approver 3",style:Texts.primary2a()),
                 ),
               Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                     child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container( height:60,width:Get.width/1.5,
                      child:TextField(decoration: Texts.Textfeild1(),))),
                 ),
                  ],)),          
                  
SizedBox(height:10),
    Padding(
                    padding: const EdgeInsets.only(left:8,right:8,top:10),
                    child: Text("Resignation Notice Approval",style:Texts.primary1d()),
                  ),
                  Container(
                    child:Row(
                      children: [
  Padding(
                       padding: const EdgeInsets.only(left:8,right:8,top:10),
                     child: Text("Approver 1",style:Texts.primary2a()),
                 ),
                 
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                     child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container( height:60,width:Get.width/1.5,
                      child:TextField(decoration: Texts.Textfeild1(),))),
                 ),
                  ],)),
                    Container(
                    child:Row(
                      children: [
  Padding(
                       padding: const EdgeInsets.only(left:8,right:8,top:10),
                     child: Text("Approver 2",style:Texts.primary2a()),
                 ),
                 
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                     child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container( height:60,width:Get.width/1.5,
                      child:TextField(decoration: Texts.Textfeild1(),))),
                 ),
                  ],)),
                    Container(
                    child:Row(
                      children: [
  Padding(
                       padding: const EdgeInsets.only(left:8,right:8,top:10),
                     child: Text("Approver 3",style:Texts.primary2a()),
                 ),
               Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                     child: Card(
                      shadowColor: Colors.grey,
elevation: 5,
 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container( height:60,width:Get.width/1.5,
                      child:TextField(decoration: Texts.Textfeild1(),))),
                 ),
                  ],)),               
                 
                   Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Center(
                   child: Container(
                     height:50,
                     width:100,
                     child: RaisedButton(
                       shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                       onPressed:(){
                         Get.to(Settings());
                       },
                     color:HexColor("#023781"),
                      child:
                      
                         Text("SAVE",style:TextStyle(color:Colors.white,fontSize:16)),
                       
                    )),
                 ),
               )
                
                  ],
                ),
              ),
              
              );
  }
}

//dummy radio
class Radiobutton extends StatefulWidget {
  const Radiobutton({ Key? key }) : super(key: key);

  @override
  _RadiobuttonState createState() => _RadiobuttonState();
}

class _RadiobuttonState extends State<Radiobutton> {
  bool? value=false;
  int? val=-1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Row(children: [
       Radio(
                  value: 1,
                  groupValue: val,
                  onChanged: (value) {
                    setState(() {
                    //  val = value;
                    });
                  },
                  activeColor: Colors.green,
                ),
      ],)
    );
  }
}



class Switchscreen extends StatefulWidget {
  Switchscreen({Key? key}) : super(key: key);

  @override
  _SwitchscreenState createState() => _SwitchscreenState();
}

class _SwitchscreenState extends State<Switchscreen> {
  bool switchbutton =false;

  void toggleswitch (bool value){
    if(switchbutton==false){
      setState(() {
        switchbutton=true;
      });
    }if(switchbutton==true){
      setState(() {
        switchbutton==false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Switch(
        onChanged: toggleswitch,
        value: switchbutton,
        activeColor: Colors.green,
         activeTrackColor: Colors.green, 
        inactiveThumbColor: Colors.red,
        inactiveTrackColor: Colors.red
        )
    );
  }
}