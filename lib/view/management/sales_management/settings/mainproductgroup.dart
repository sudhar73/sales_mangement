import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sales/utils/texts.dart';
import 'package:sales/view/management/sales_management/Quationtracker.dart';
import 'package:sales/view/management/sales_management/allsalesorder.dart';
import 'package:sales/view/management/sales_management/customerservices.dart';
import 'package:sales/view/management/sales_management/lead_genration.dart';
import 'package:sales/view/management/sales_management/leadsummary.dart';
import 'package:sales/view/management/sales_management/productservices.dart';
import 'package:sales/view/management/sales_management/sales_flowup.dart';
import 'package:sales/view/management/sales_management/salesrepersentative.dart';
import 'package:sales/view/management/sales_management/settings/Quotestatus.dart';
import 'package:sales/view/management/sales_management/settings/bussinesssector.dart';
import 'package:sales/view/management/sales_management/settings/callresult.dart';
import 'package:sales/view/management/sales_management/settings/department.dart';
import 'package:sales/view/management/sales_management/settings/desigantion.dart';
import 'package:sales/view/management/sales_management/settings/modeofenquiry.dart';
import 'package:sales/view/management/sales_management/settings/productgroup.dart';
import 'package:sales/view/management/sales_management/settings/uom.dart';

class Mainsettings extends StatefulWidget {
  const Mainsettings({ Key? key }) : super(key: key);

  @override
  _MainsettingsState createState() => _MainsettingsState();
}

class _MainsettingsState extends State<Mainsettings> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
       backgroundColor: Colors.white,
          appBar: AppBar(
          elevation: 0,
          backgroundColor:HexColor("#023781"),
          toolbarHeight: 80,
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
         
           bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text:"Product Group"),
              Tab(text:"UOM"),
              Tab(text:"Department"),
              Tab(text:"Business Sector"),
              Tab(text:"Mode of enquiry"),
              Tab(text:"Designation"),
               Tab(text:"Call Result"),
                Tab(text:"Quote Status"),
            ],
          ),
          
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
          body:TabBarView(
          children: [
            Center( child:Productgroup()),
Center(child:Uom()),
            Center( child:Department_settings()),
            Center( child:Bussinesssector()),
            Center( child:Modeofenquriy()),
            Center( child:Desigination_settings()),
            Center( child:Callresult()),
            Center( child:Quotese())
            
          ],
        ),
         drawer:  Drawer(
       
  child: ListView(
    
    padding: EdgeInsets.zero,
    children: [
      const DrawerHeader(
        decoration: BoxDecoration(
        color:Colors.blueAccent
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Image(image: AssetImage("assets/Logo.png"))
        ),
      ),
     
       Padding(
              padding:EdgeInsets.only(top:1,),
              child: Container(
                child: ExpansionTile(
           expandedAlignment: Alignment.topLeft,
             //leading: Padding( padding:EdgeInsets.only(right:1),child: Container(child:Image(image:AssetImage("assets/menuicon/employe.png")))) ,
                title:  Container(child:Text("Sales Management",style:TextStyle(fontSize:18,color:Colors.black,)),),
           
                expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                children: [ 
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:InkWell(
                    onTap: (){
                      Get.to(Lead_genaration());
                    },
                     child:Container(
                margin:EdgeInsets.only(left:5,top:5),
                    child:Row(
                      children: [
                        ClipRRect( 
                           borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height:40,width:40,
                            child: Image(image: AssetImage("assets/Lead Generation.png"),))),
                        Text(" Lead Generation",style:TextStyle(fontSize: 16)),
                      ],
                    ),)
                  ),),
                     Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: 
                    InkWell(
                      onTap: (){
                       Get.to(Salefollowup());
                        },
                    child:Container(
               margin:EdgeInsets.only(left:5,top:5),
                    child:Row(
                      children: [
                         ClipRRect( 
                           borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height:40,width:40,
                            child: Image(image: AssetImage("assets/Sales Follow Up.png"),))),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Sales Follow-Up ",style:TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),)
                         ), ),
                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: 
                    InkWell(
                      onTap: (){
                        Get.to(Productservice());
                       
                      },
                      child:  Container(
                margin:EdgeInsets.only(left:5,top:5),
                    child:Row(
                      children: [
                          ClipRRect( 
                           borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height:40,width:40,
                            child: Image(image: AssetImage("assets/Products Services.png"),))),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Product/Services",style:TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),)
                  ),),
                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: 
                    InkWell(
                      onTap: (){
                        Get.to(Salesreperstative());
                      },
                    child:Container(
 margin:EdgeInsets.only(left:5,top:5),
                    child:Row(
                      children: [
                          ClipRRect( 
                           borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height:40,width:40,
                            child: Image(image: AssetImage("assets/Sales Representative.png"),))),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Sales Representatives",style:TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),)
                  ),),
                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                    InkWell(
                      onTap: (){
                        Get.to(Quationtracker());
                        
                      },
                   child:  Container(
                      margin:EdgeInsets.only(left:5,top:5),
           child:Row(
                      children: [
                         ClipRRect( 
                           borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height:40,width:40,
                            child: Image(image: AssetImage("assets/Quotation Tracker.png"),))),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Quotation Tracker",style:TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),)
                     ),  ),
                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                    InkWell(
                      onTap: (){
                        Get.to(AllSalesorder());
                       
                      },
                      child: Container(
          margin:EdgeInsets.only(left:5,top:5),
                    child:Row(
                      children: [ClipRRect( 
                           borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height:40,width:40,
                            child: Image(image: AssetImage("assets/Sales Orders.png"),))),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Sales Orders",style:TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),)
                  )), Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap:(){
                        Get.to(Leadsummary());
                        
                      },
                   child: Container(
               margin:EdgeInsets.only(left:5,top:5),
                    child:Row(
                      children: [
                        ClipRRect( 
                           borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height:40,width:40,
                            child: Image(image: AssetImage("assets/Lead Summary Report.png"),))),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Lead Summary Report",style:TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),))
                  ), Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                    onTap:(){
                      Get.to(Customerservices());
                     
                    },
                   child: Container(
             margin:EdgeInsets.only(left:5,top:5),
                    child:Row(
                      children: [
                         ClipRRect( 
                           borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height:40,width:40,
                            child: Image(image: AssetImage("assets/Customer Service.png"),))),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Customer Service",style:TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),)
                  ),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                    onTap:(){
                      Get.to(Mainsettings());
                    },
                   child: Container(
                       margin:EdgeInsets.only(left:5,top:5),
                    child:Row(
                      children: [
                         ClipRRect( 
                           borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height:40,width:40,
                            child: Image(image: AssetImage("assets/Settings.png"),))),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Settings",style:TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),)
                  ),),
                  ],
                ),
              ),
              ),
            
     
    ],
  ),
)

      )
      );
  }
}