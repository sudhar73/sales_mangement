// ignore_for_file: sized_box_for_whitespace

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sales/model/leadgenrationmodel.dart';
import 'package:sales/model/salesfollowupmodel.dart';
import 'package:sales/utils/api.dart';
import 'package:sales/utils/datepicker.dart';
import 'package:sales/utils/texts.dart';
import 'package:sales/view/management/sales_management/Quationtracker.dart';
import 'package:sales/view/management/sales_management/allsalesorder.dart';
import 'package:sales/view/management/sales_management/customerservices.dart';
import 'package:sales/view/management/sales_management/leadsummary.dart';
import 'package:sales/view/management/sales_management/productservices.dart';
import 'package:sales/view/management/sales_management/sales_flowup.dart';
import 'package:sales/view/management/sales_management/salesrepersentative.dart';
import 'package:sales/view/management/sales_management/settings/mainproductgroup.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid_export/export.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart'hide Alignment, Column, Row;
import 'package:syncfusion_flutter_datagrid_export/export.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_pdf/pdf.dart';






class Lead_genaration extends StatefulWidget {
  const Lead_genaration({ Key? key }) : super(key: key);

  @override
  _Lead_genarationState createState() => _Lead_genarationState();
}

class _Lead_genarationState extends State<Lead_genaration> {
  List<Employee> employees = <Employee>[];
  late EmployeeDataSource employeeDataSource;
  DateTime _date = DateTime.now();
  final GlobalKey<SfDataGridState> _key =GlobalKey<SfDataGridState>();

  @override
  void initState() {
    super.initState();
    employees = getEmployeeData();
    employeeDataSource = EmployeeDataSource(employeeData: employees);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
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
      body:Container(
        child:SingleChildScrollView(
          child:Column(
            children: [
                Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(children: [
                Image(image: AssetImage("assets/dashboard/dashboard-active.png"),),
                Icon(Icons.arrow_right),
                Text("General & Administraion",style:Texts.style(Texts.h9, HexColor("#7C8EB2"), Texts.normal)),
                Icon(Icons.arrow_right),
                Text("Sales Management",style:Texts.style(14.0, HexColor("#7C8EB2"), Texts.normal))
              ],),
            ),
// ignore: avoid_unnecessary_containers
Center(
  child:  Row(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
   Container(child:Text("All Lead's",style:Texts.primary1d())),
   Container(
 
     width:Get.width/2,color:Colors.transparent,
     child: Padding(
               padding: const EdgeInsets.all(10.0),
                         child: Align( 
                           alignment: Alignment.centerRight,
                           child: Container(
                             height:40,
                             width:90,
                             child: RaisedButton(
                               shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                               onPressed:(){
                                 Get.to(_addexit(context));
                               },
                             color:HexColor("#7C8EB2"),
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 Text("Add",style:TextStyle(color:Colors.white,fontSize:16)),
                                 Icon(Icons.arrow_right,color:Colors.white),
                               ],
                             ) )),
                         ),
                       ),
   ),
    ],),
),
SizedBox(height:15),
Row(
  mainAxisAlignment: MainAxisAlignment.end,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    //     Padding(padding: const EdgeInsets.all(3.0),
    //                  child: Center(
    //                    child: Container(
    //                      height:50,
    //                      width:Get.width/4.5,
    //                      child: RaisedButton(
    //                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    //                   onPressed:(){
                         
    //                        },
    //                      color:HexColor("#7D7D7D"),
    // child: Text("Copy",style:TextStyle(color:Colors.white,fontSize:16)),
    //                        )),
    //                  ),
    //                ),
         
                    Padding(padding: const EdgeInsets.only(left:8.0),
                     child: Center(
                       child: Container(
                          
                         height:50,
                         width:Get.width/4.5,
                         child: RaisedButton(
                           shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        onPressed: (){},
                                             color:HexColor("#7D7D7D"),
    child: Text("Excel",style:TextStyle(color:Colors.white,fontSize:16)),
                           )),
                     ),
                   ),
    //                 Padding(padding: const EdgeInsets.all(3.0),
    //                  child: Center(
    //                    child: Container(
    //                      height:50,
    //                       width:Get.width/4.5,
    //                      child: RaisedButton(
    //                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    //                   onPressed:(){
                             
    //                        },
    //                      color:HexColor("#7D7D7D"),
    // child: Text("CSV",style:TextStyle(color:Colors.white,fontSize:16)),
    //                        )),
    //                  ),
    //                ),
                    Padding(padding: const EdgeInsets.only(right:8.0,left:8),
                     child: Center(
                       child: Container(
                         height:50,
                          width:Get.width/4.5,
                         child: RaisedButton(
                           shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          onPressed:(){},
                         color:HexColor("#7D7D7D"),
    child: Text("Print",style:TextStyle(color:Colors.white,fontSize:16)),
                           )),
                     ),
                   ),
  ],),
  
Padding(
    
      padding: const EdgeInsets.all(8.0),
      child:   Card(
      elevation: 5,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft:Radius.circular(35),topRight: Radius.circular(35)),),
    
child:   Container(
     width: Get.width,
  child: Center(
    child: SfDataGridTheme(
      data: SfDataGridThemeData(
        // rowHoverColor: HexColor("#7C8EB2"),
    
        // rowHoverTextStyle: TextStyle(
    
        // color: Colors.white,
    
        // fontSize: 14,),
    
        sortIconColor: Colors.white,
        headerHoverColor: Colors.blue[50],
        headerColor: HexColor("#023781"),),
      child: SfDataGrid(
    key: _key,
          selectionMode: SelectionMode.multiple,
       frozenColumnsCount: 2,
        allowSorting: true,
        allowEditing: true,
        allowPullToRefresh: true,
        showCheckboxColumn: true,
        gridLinesVisibility: GridLinesVisibility.vertical,
        headerGridLinesVisibility: GridLinesVisibility.vertical,
              source: employeeDataSource,
              columns: <GridColumn>[
                GridColumn(
                    columnName: 'name',
                    label: Container(
                      color: HexColor("#023781"),
                        padding: EdgeInsets.all(8.0),
                        alignment: Alignment.center,
    
                        child: Text('Lead ID',style:Texts.whit1e(),textAlign: TextAlign.center,))),
    
                GridColumn(
                    columnName: 'designation',
                    label: Container(
                      color: HexColor("#023781"),
                        padding: EdgeInsets.all(1.0),
                        alignment: Alignment.center,
                        child: Text('Lead Owner',style:Texts.whit1e(),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,))),
    
                GridColumn(
    
                    columnName: 'salary',
                    label: Container( 
                      padding: EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: Text('Service Category',style:Texts.whit1e(),textAlign: TextAlign.center,))),
    
                 GridColumn(
                    columnName: 'servicedescription',
                    label: Container( 
                      padding: EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: Text('Service Description',style:Texts.whit1e(),textAlign: TextAlign.center,))),
    
     GridColumn( columnName: 'department',
                    label: Container( 
                      padding: EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: Text('Division/ Department',style:Texts.whit1e(),textAlign: TextAlign.center,))),
    
          GridColumn(
    
                    columnName: 'action',
                    label: Container( 
    
                      padding: EdgeInsets.all(8.0),
    
                        alignment: Alignment.center,
    
                        child: Text('Action',style:Texts.whit1e(),textAlign: TextAlign.center,)))
    
              ],  
            ),),
  ),
),
      ), ),
SizedBox(height:10),
      ],)
      )), 
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
    );
  }
  _addexit(BuildContext context) {
    // ignore: unnecessary_new
    return new AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal:12,vertical: 25),
      title:  Center(child: Text('Add New Lead',style:Texts.primary1bigbold())),
      content: SingleChildScrollView(
        child: Container(   
          width:Get.width,
          child:  Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[  
      Saveexit() 
            ],
          ),
        ),
      ),
    );
}
    List<Employee> getEmployeeData() {
    return [
      Employee('ld001','Suresh','Product','Description','Quality','edit'),
      Employee('ld001','Suresh','Product','Description','Quality','edit'),
      Employee('ld001','Suresh','Product','Description','Quality','edit'),
      Employee('ld001','Suresh','Product','Description','Quality','edit'),
      Employee('ld001','Suresh','Product','Description','Quality','edit'),
      ];
  }
}
class Employee {
  /// Creates the employee class with required details.
  Employee( this.name, this.designation, this.salary,this.servicedescription,this.department,this.action);

  /// Id of an employee.
  /// Name of an employee.
  final String name;

  /// Designation of an employee.
  final String designation;

  /// Salary of an employee.
  final String salary;
   final String servicedescription;
    final String department;
     final String action;

}

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({required List<Employee> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              // DataGridCell<int>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(columnName: 'designation', value: e.designation),
              DataGridCell<String>(columnName: 'salary', value: e.salary),
              DataGridCell<String>(columnName: 'servicedescription', value: e.salary),
              DataGridCell<String>(columnName: 'department', value: e.salary),
              DataGridCell<String>(columnName: 'action', value: e.salary),
            ]))
        .toList();
  }
  List<DataGridRow> _employeeData = [];
  @override
  List<DataGridRow> get rows => _employeeData;
  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
  Color backgroundcolor(){
  int index =effectiveRows.indexOf(row);
  if (index %2 ==0) {
    return Colors.white;
  } else {
    return Colors.grey[100]!;
  }
}
  return DataGridRowAdapter(
    color: backgroundcolor(),
        cells: row.getCells().map<Widget>((e) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}

class Saveexit extends StatefulWidget {
  const Saveexit({ Key? key }) : super(key: key);
  @override
  _SaveexitState createState() => _SaveexitState();
}
class _SaveexitState extends State<Saveexit> {
  LeadgenrationModel leadgenrationModel=LeadgenrationModel();
  final formGlobalKey = GlobalKey < FormState > ();
  DateTime _date = DateTime.now();
  final dateController = TextEditingController();
   final TextEditingController textcontroler = TextEditingController();
  final TextEditingController textcontroler1 = TextEditingController();
  final TextEditingController branchcontroler = TextEditingController();
  final TextEditingController leadcontroler = TextEditingController();
  final TextEditingController servicecontroler = TextEditingController();
  final TextEditingController departmentcontroler = TextEditingController();
 //final TextEditingController branchcontroler = TextEditingController();
   static const branch = ["chennai","cuddalore","panurti"];
   static const leadowner = ["ramesh","ramki","ryan","pulto"];
   static const service = ["security","park","peat","coco"];
   static const department = ["security","manger","developer","bot"];
  static const country = [
        "Afghanistan",
        "Albania",
        "Algeria",
        "Andorra",
        "Angola",
        "Antigua and Barbuda",
             "Bahamas",
             "Bahrain",
             "Bangladesh",
            "Cabo Verde",
            "Cambodia",
            "Cameroon",
            "Canada",
            "China",
            "Colombia",
            "Comoros",
            "Denmark",
            "Djibouti",
            "Dominica",
            "Dominican Republic",
            "Ecuador",
        "Egypt",
        "El Salvador",
        "Equatorial Guinea",
        "Eritrea",
        "Estonia",
        "Fiji",
        "Finland",
        "France",
  ];


  @override
  Widget build(BuildContext context) {
   return  Form( 
     key:formGlobalKey,
     child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
                  padding: const EdgeInsets.only(left:8,right:8,top:10),
                          child: Text("Enquiry Date",style:Texts.primary2a()),
                        ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal:8.0),
                          child: Card(
                            shadowColor: Colors.grey,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Container(child: TextFormField(
                              onSaved: (EnquiryDate){
                                leadgenrationModel.EnquiryDate=EnquiryDate;
                              },
           readOnly: true,
           controller: dateController,
           decoration: InputDecoration(
        hintStyle: TextStyle(color: HexColor("#172B4D")),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: Colors.transparent)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color:Colors.transparent))
        ),
           onTap: () async {
          var date =  await showDatePicker(
                context: context, 
                initialDate:DateTime.now(),
                firstDate:DateTime(2000),
                lastDate: DateTime(2100),
                currentDate: DateTime.now()
                );
                
          dateController.text = date.toString().substring(0,10);      
         },  validator: (value){
                                if(value!.isEmpty){
                                  return "Enquiry date is required";
                                }
                                else{
                                  return null;
                                }
                              },
         ),
                            )),
                        ),
                    
                         Padding(
                          padding: const EdgeInsets.only(left:8,right:8,top:10),
                          child: Text("Branch",style:Texts.primary2a()),
                        ),
                
    Padding(
                          padding: const EdgeInsets.symmetric(horizontal:2.0,vertical: 2.0),
                          child: Card(
                            shadowColor: Colors.grey,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Container(
                                   margin:EdgeInsets.only( left: 10, right: 10),
                              child :TypeAheadFormField(
                                 onSaved: (Branch){
                                leadgenrationModel.Branch=Branch;
                              },
                               validator: (value){
                                if(value!.isEmpty){
                                  return "Branch is required";
                                }
                                else{
                                  return null;
                                }
                              },
                  suggestionsCallback: (pattern) => branch.where((item) => item.toLowerCase().contains(pattern.toLowerCase()),
   
                  ),
                  itemBuilder: (_,String item) => ListTile(title: Text(item),),
                  onSuggestionSelected: (String val) {
                    this.branchcontroler.text = val;
                    print(val);
                  },
                  getImmediateSuggestions: true,
                  hideSuggestionsOnKeyboardHide: false,
                  hideOnEmpty: false,
                  noItemsFoundBuilder: (context) => Padding(padding: const EdgeInsets.all(8.0),
                  child: Text('No Items Found'),),
                  textFieldConfiguration: TextFieldConfiguration(
                    
                    
                    decoration:InputDecoration(
                          hintText: "Select branch",
                          
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                    controller: this.branchcontroler,
                  ),
                ),))),
                     
                         Padding(
                          padding: const EdgeInsets.only(left:8,right:8,top:10),
                          child: Text("Company Name",style:Texts.primary2a()),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:8.0),
                          child: Card(
                            shadowColor: Colors.grey,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Container(child:TextFormField(
                              onSaved: (CompanyName){
                                leadgenrationModel.CompanyName=CompanyName;
                              },
                              validator: (value){
                                if(value!.isEmpty){
                                  return "Company Name is required";
                                }
                                else{
                                  return null;
                                }
                              },
                              decoration: Texts.Textfeild1(),))),
                        ),
                         Padding(
                          padding: const EdgeInsets.only(left:8,right:8,top:10),
                          child: Text("Customer Name",style:Texts.primary2a()),
                        ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal:8.0),
                          child: Card(
                            shadowColor: Colors.grey,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Container(child:TextFormField(
                               onSaved: (CustomerName){
                                leadgenrationModel.CustomerName=CustomerName;
                              },
                              validator: (value){
                                if(value!.isEmpty){
                                  return "Customer Name is required";
                                }
                                else {
                                  return null;
                                }
                              },
                              decoration: Texts.Textfeild1(),))),
                        ),
                          Padding(
                          padding: const EdgeInsets.only(left:8,right:8,top:10),
                          child: Text("Mobile Number",style:Texts.primary2a()),
                        ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal:8.0),
                          child: Card(
                            shadowColor: Colors.grey,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Container(child:TextFormField(
                               onSaved: (MobileNumber){
                                leadgenrationModel.MobileNumber=MobileNumber;
                              },
                                 validator: (value){
                                if(value!.isEmpty){
                                  return "Mobile Number is required	";
                                }
                                else {
                                  return null;
                                }
                              },
                              decoration: Texts.Textfeild1(),))),
                        ),
                         Padding(
                          padding: const EdgeInsets.only(left:8,right:8,top:10),
                          child: Text("Email Id",style:Texts.primary2a()),
                        ), 
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:8.0),
                          child: Card(
                            shadowColor: Colors.grey,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Container(child:TextFormField(
                               onSaved: (EmailId){
                                leadgenrationModel.EmailId=EmailId;
                              },
                              decoration: Texts.Textfeild1(),))),
                        ),  Padding(
                          padding: const EdgeInsets.only(left:8,right:8,top:10),
                          child: Text("Street 1",style:Texts.primary2a()),
                        ), Padding(
                          padding: const EdgeInsets.symmetric(horizontal:8.0),
                          child: Card(
                            shadowColor: Colors.grey,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Container(child:TextFormField(
                              onSaved: (Street1){
                                leadgenrationModel.Street1=Street1;
                              },
                              decoration: Texts.Textfeild1(),))),
                        ), 
                        Padding(
                          padding: const EdgeInsets.only(left:8,right:8,top:10),
                          child: Text("Street 2",style:Texts.primary2a()),
                        ), Padding(
                          padding: const EdgeInsets.symmetric(horizontal:8.0),
                          child: Card(
                            shadowColor: Colors.grey,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Container(child:TextFormField(
                               onSaved: (Street2){
                                leadgenrationModel.Street2=Street2;
                              },
                              decoration: Texts.Textfeild1(),))),
                        ),  Padding(
                          padding: const EdgeInsets.only(left:8,right:8,top:10),
                          child: Text("City",style:Texts.primary2a()),
                        ), Padding(
                          padding: const EdgeInsets.symmetric(horizontal:8.0),
                          child: Card(
                            shadowColor: Colors.grey,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Container(child:TextFormField(
                                onSaved: (City){
                                leadgenrationModel.City=City;
                              },
                              validator: (value){
                                if(value!.isEmpty){
                                  return "City is required	";
                                }
                                else {
                                  return null;
                                }
                              },
                              decoration: Texts.Textfeild1(),))),
                        ),  
                         Padding(
                          padding: const EdgeInsets.only(left:8,right:8,top:10),
                          child: Text("Pincode",style:Texts.primary2a()),
                        ), Padding(
                          padding: const EdgeInsets.symmetric(horizontal:8.0),
                          child: Card(
                            shadowColor: Colors.grey,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Container(child:TextFormField(
                               onSaved: (Pincode){
                                leadgenrationModel.Pincode=Pincode;
                              },
                              validator: (value){
                                if(value!.isEmpty){
                                  return "Pin Code is required	";
                                }
                                else {
                                  return null;
                                }
                              },
                              decoration: Texts.Textfeild1(),))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:8,right:8,top:10),
                          child: Text("State",style:Texts.primary2a()),
                        ), Padding(
                          padding: const EdgeInsets.symmetric(horizontal:8.0),
                          child: Card(
                            shadowColor: Colors.grey,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Container(child:TextFormField(
                              onSaved: (State){
                                leadgenrationModel.State=State;
                              },
                             
                               validator: (value){
                                if(value!.isEmpty){
                                  return "State is required	";
                                }
                                else {
                                  return null;
                                }
                              },
                              decoration: Texts.Textfeild1(),))),
                        ),
                          Padding(
                          padding: const EdgeInsets.only(left:8,right:8,top:10),
                          child: Text("Country",style:Texts.primary2a()),
                        ), Padding(
                          padding: const EdgeInsets.symmetric(horizontal:8.0),
                          child: Card(
                            shadowColor: Colors.grey,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Container(child:TextFormField(
                                onSaved: (Country){
                                leadgenrationModel.Country=Country;
                              },
                              decoration: Texts.Textfeild1(),))),
                        ),
                         Padding(
                          padding: const EdgeInsets.only(left:8,right:8,top:10),
                          child: Text("Mode of Enquiry",style:Texts.primary2a()),
                        ),
                         Padding(
                          padding: const EdgeInsets.symmetric(horizontal:2.0,vertical: 2.0),
                          child: Card(
                            shadowColor: Colors.grey,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Container(
                                   margin:EdgeInsets.only( left: 10, right: 10),
                              child :TypeAheadFormField(
                                 onSaved: (ModeofEnquiry){
                                leadgenrationModel.ModeofEnquiry=ModeofEnquiry;
                              },
                                validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return "Mode of Enquiry is required";
                                    }
                                    return null;
                                  },
                                  
                  suggestionsCallback: (pattern) => country.where((item) => item.toLowerCase().contains(pattern.toLowerCase()),
   
                  ),
                  itemBuilder: (_,String item) => ListTile(title: Text(item),),
                  onSuggestionSelected: (String val) {
                    this.textcontroler.text = val;
                    print(val);
                  },
                  getImmediateSuggestions: true,
                  hideSuggestionsOnKeyboardHide: false,
                  hideOnEmpty: false,
                  noItemsFoundBuilder: (context) => Padding(padding: const EdgeInsets.all(8.0),
                  child: Text('No Items Found'),),
                  textFieldConfiguration: TextFieldConfiguration(
                    
                    
                    decoration:InputDecoration(
                          hintText: "Select Mode of Enquiry",
                          
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                    controller: this.textcontroler,
                  ),
                ),))),
                         Padding(
                          padding: const EdgeInsets.only(left:8,right:8,top:10),
                          child: Text("Lead Owner",style:Texts.primary2a()),
                        ), 
                         Padding(
                          padding: const EdgeInsets.symmetric(horizontal:2.0,vertical: 2.0),
                          child: Card(
                            shadowColor: Colors.grey,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Container(
                                   margin:EdgeInsets.only( left: 10, right: 10),
                              child :TypeAheadFormField(
                                  onSaved: (LeadOwner){
                                leadgenrationModel.LeadOwner=LeadOwner;
                              },
                             
                  suggestionsCallback: (pattern) => leadowner.where((item) => item.toLowerCase().contains(pattern.toLowerCase()),
   
                  ),
                  itemBuilder: (_,String item) => ListTile(title: Text(item),),
                  onSuggestionSelected: (String val) {
                    this.leadcontroler.text = val;
                    print(val);
                  },
                  getImmediateSuggestions: true,
                  hideSuggestionsOnKeyboardHide: false,
                  hideOnEmpty: false,
                  noItemsFoundBuilder: (context) => Padding(padding: const EdgeInsets.all(8.0),
                  child: Text('No Items Found'),),
                  textFieldConfiguration: TextFieldConfiguration(
                    
                    
                    decoration:InputDecoration(
                          hintText: "Select Lead Owner",
                          
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                    controller: this.leadcontroler,
                  ),
                ),))),
                         Padding(
                          padding: const EdgeInsets.only(left:8,right:8,top:10),
                          child: Text("Service Location",style:Texts.primary2a()),
                        ), Padding(
                          padding: const EdgeInsets.symmetric(horizontal:8.0),
                          child: Card(
                            shadowColor: Colors.grey,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Container(child:TextFormField(
                                onSaved: (ServiceLocation){
                                leadgenrationModel.ServiceLocation=ServiceLocation;
                              },
                             
                               validator: (value){
                                if(value!.isEmpty){
                                  return " Service Location is required";
                                }
                                else {
                                  return null;
                                }
                              },
                              decoration: Texts.Textfeild1(),))),
                        ),
                         Padding(
                          padding: const EdgeInsets.only(left:8,right:8,top:10),
                          child: Text("Service Category",style:Texts.primary2a()),
                        ),  Padding(
                          padding: const EdgeInsets.symmetric(horizontal:2.0,vertical: 2.0),
                          child: Card(
                            shadowColor: Colors.grey,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Container(
                                   margin:EdgeInsets.only( left: 10, right: 10),
                              child :TypeAheadFormField(
                                onSaved: (ServiceCategory){
                                leadgenrationModel.ServiceCategory=ServiceCategory;
                              },
                               validator: (value){
                                if(value!.isEmpty){
                                  return "Service Category is required";
                                }
                                else {
                                  return null;
                                }
                              },
                  suggestionsCallback: (pattern) => service.where((item) => item.toLowerCase().contains(pattern.toLowerCase()),
   
                  ),
                  itemBuilder: (_,String item) => ListTile(title: Text(item),),
                  onSuggestionSelected: (String val) {
                    this.servicecontroler.text = val;
                    print(val);
                  },
                  getImmediateSuggestions: true,
                  hideSuggestionsOnKeyboardHide: false,
                  hideOnEmpty: false,
                  noItemsFoundBuilder: (context) => Padding(padding: const EdgeInsets.all(8.0),
                  child: Text('No Items Found'),),
                  textFieldConfiguration: TextFieldConfiguration(
                    
                    
                    decoration:InputDecoration(
                          hintText: "Select Lead Owner",
                          
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                    controller: this.servicecontroler,
                  ),
                ),))),
                         Padding(
                          padding: const EdgeInsets.only(left:8,right:8,top:10),
                          child: Text("Service Description",style:Texts.primary2a()),
                        ), Padding(
                          padding: const EdgeInsets.symmetric(horizontal:8.0),
                          child: Card(
                            shadowColor: Colors.grey,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Container(child:TextFormField(
                               onSaved: (ServiceDescription){
                                leadgenrationModel.ServiceDescription=ServiceDescription;
                              },
                              decoration: Texts.Textfeild1(),))),
                        ),
                         Padding(
                          padding: const EdgeInsets.only(left:8,right:8,top:10),
                          child: Text("Business Sector",style:Texts.primary2a()),
                        ),  Padding(
                          padding: const EdgeInsets.symmetric(horizontal:2.0,vertical: 2.0),
                          child: Card(
                            shadowColor: Colors.grey,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Container(
                                   margin:EdgeInsets.only( left: 10, right: 10),
                              child :TypeAheadFormField(
                                 onSaved: (BusinessSector){
                                leadgenrationModel.BusinessSector=BusinessSector;
                              },
                  suggestionsCallback: (pattern) => country.where((item) => item.toLowerCase().contains(pattern.toLowerCase()),
   
                  ),
                  itemBuilder: (_,String item) => ListTile(title: Text(item),),
                  onSuggestionSelected: (String val) {
                    this.textcontroler1.text = val;
                    print(val);
                  },
                  getImmediateSuggestions: true,
                  hideSuggestionsOnKeyboardHide: false,
                  hideOnEmpty: false,
                  noItemsFoundBuilder: (context) => Padding(padding: const EdgeInsets.all(8.0),
                  child: Text('No Items Found'),),
                  textFieldConfiguration: TextFieldConfiguration(
                    decoration:InputDecoration(
                          hintText: "Select bussiness sector",
                          
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                    controller: this.textcontroler1,
                  ),
                ),))),
                         Padding(
                          padding: const EdgeInsets.only(left:8,right:8,top:10),
                          child: Text("Division/ Department",style:Texts.primary2a()),
                        ), 
                         Padding(
                          padding: const EdgeInsets.symmetric(horizontal:2.0,vertical: 2.0),
                          child: Card(
                            shadowColor: Colors.grey,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Container(
                                   margin:EdgeInsets.only( left: 10, right: 10),
                              child :TypeAheadFormField(
                                  onSaved: (DivisonDepartment){
                                leadgenrationModel.DivisonDepartment=DivisonDepartment;
                              },
                  suggestionsCallback: (pattern) => department.where((item) => item.toLowerCase().contains(pattern.toLowerCase()),
   
                  ),
                  itemBuilder: (_,String item) => ListTile(title: Text(item),),
                  onSuggestionSelected: (String val) {
                    this.departmentcontroler.text = val;
                    print(val);
                  },
                  getImmediateSuggestions: true,
                  hideSuggestionsOnKeyboardHide: false,
                  hideOnEmpty: false,
                  noItemsFoundBuilder: (context) => Padding(padding: const EdgeInsets.all(8.0),
                  child: Text('No Items Found'),),
                  textFieldConfiguration: TextFieldConfiguration(
                    decoration:InputDecoration(
                          hintText: "Select division/department",
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                    controller: this.departmentcontroler,
                  ),
                ),))),
                         Padding(
                          padding: const EdgeInsets.only(left:8,right:8,top:10),
                          child: Text("UOM",style:Texts.primary2a()),
                        ), Padding(
                          padding: const EdgeInsets.symmetric(horizontal:8.0),
                          child: Card(
                            shadowColor: Colors.grey,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Container(child:TextFormField(
                               onSaved: (UOM){
                                leadgenrationModel.UOM=UOM;
                              },
                              decoration: Texts.Textfeild1(),))),
                        ),
                         Padding(
                          padding: const EdgeInsets.only(left:8,right:8,top:10),
                          child: Text("Unit Value",style:Texts.primary2a()),
                        ), Padding(
                          padding: const EdgeInsets.symmetric(horizontal:8.0),
                          child: Card(
                            shadowColor: Colors.grey,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Container(child:TextFormField(
                              onSaved: (UnitValue){
                                leadgenrationModel.UnitValue=UnitValue;
                              },
                              decoration: Texts.Textfeild1(),))),
                        ),
                         Padding(
                          padding: const EdgeInsets.only(left:8,right:8,top:10),
                          child: Text("Quanity",style:Texts.primary2a()),
                        ), Padding(
                          padding: const EdgeInsets.symmetric(horizontal:8.0),
                          child: Card(
                            shadowColor: Colors.grey,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Container(child:TextFormField(
                              onSaved: (Quantity){
                                leadgenrationModel.Quantity=Quantity;
                              },
                              decoration: Texts.Textfeild1(),))),
                        ),
                         Padding(
                          padding: const EdgeInsets.only(left:8,right:8,top:10),
                          child: Text("Other Cost",style:Texts.primary2a()),
                        ), Padding(
                          padding: const EdgeInsets.symmetric(horizontal:8.0),
                          child: Card(
                            shadowColor: Colors.grey,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Container(child:TextFormField(
                              onSaved: (Othercost){
                                leadgenrationModel.Othercost=Othercost;
                              },
                              decoration: Texts.Textfeild1(),))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:8,right:8,top:10),
                          child: Text("Quote Value",style:Texts.primary2a()),
                        ), Padding(
                          padding: const EdgeInsets.symmetric(horizontal:8.0),
                          child: Card(
                            shadowColor: Colors.grey,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Container(child:TextFormField(
                                onSaved: (QuoteValue){
                                leadgenrationModel.QuoteValue=QuoteValue;
                              },
                              decoration: Texts.Textfeild1(),))),
                        ),
                         Padding(
                          padding: const EdgeInsets.only(left:8,right:8,top:10),
                          child: Text("Comments/ remarks",style:Texts.primary2a()),
                        ), Padding(
                          padding: const EdgeInsets.symmetric(horizontal:8.0),
                          child: Card(
                            shadowColor: Colors.grey,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Container(child:TextFormField(
                                 onSaved: (CommentsRemarks){
                                leadgenrationModel.CommentsRemarks=CommentsRemarks;
                              },
                              decoration: Texts.Textfeild1(),))),
                        ),
                         
                   SizedBox(height:15),
                         Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Container(
            height:45,width:Get.width/3.8,
            child:RaisedButton(
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color:HexColor("#023781"),
            onPressed: (){
              if(formGlobalKey.currentState!.validate()) {
                (formGlobalKey.currentState!.save());
                 _ActionButton(
                     leadgenrationModel.EnquiryDate,
                        leadgenrationModel.Branch,
                           leadgenrationModel.CompanyName,
                              leadgenrationModel.CustomerName, 
                                 leadgenrationModel.MobileNumber, 
                                    leadgenrationModel.EmailId, 
                                       leadgenrationModel.Street1, 
                                          leadgenrationModel.Street2, 
                                             leadgenrationModel.City, 
                                                leadgenrationModel.Pincode, 
                                                   leadgenrationModel.State, 
                                                      leadgenrationModel.Country, 
                                                         leadgenrationModel.ModeofEnquiry, 
                                                            leadgenrationModel.LeadOwner, 
                                                               leadgenrationModel.ServiceLocation, 
                                                                  leadgenrationModel.ServiceCategory, 
                                                                     leadgenrationModel.ServiceDescription, 
                                                                        leadgenrationModel.BusinessSector, 
                                                                           leadgenrationModel.DivisonDepartment, 
                                                                              leadgenrationModel.UOM, 
                                                                                 leadgenrationModel.UnitValue, 
                                                                                    leadgenrationModel.Quantity, 
                                                                                       leadgenrationModel.Othercost, 
                                                                                          leadgenrationModel.QuoteValue, 
                                                                                             leadgenrationModel.CommentsRemarks,
                                                                                            );
                                                                                                 print("Successful");
 
              }else {
                                    Fluttertoast.showToast(
                                        msg: "Please enter all the details",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 2,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 14.0);
                                  }        
                                   
                                    

            },child:Text("SUBMIT",style:TextStyle(color:Colors.white,fontSize:16)))),
            Container(  height:45,width:Get.width/3.9,
            child:RaisedButton(
               shape: RoundedRectangleBorder(
                side: BorderSide(color:HexColor("#172B4D"),width: 1),
                borderRadius: BorderRadius.circular(10)),
           color: Colors.white,
            onPressed: (){
              Get.back();
            },child:Text("Cancel",style:TextStyle(color:HexColor("#023781"),fontSize:16)))),
            ])
      ],),
   );
  }
  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(color: Colors.blueAccent,),
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

  void _ActionButton(String? EnquiryDate,Branch,CompanyName,CustomerName,MobileNumber,EmailId,
         Street1,Street2,City,
     Pincode,State,Country,ModeofEnquiry,LeadOwner,ServiceLocation,ServiceCategory,ServiceDescription,BusinessSector,
  DivisonDepartment,UOM,UnitValue,Quantity,Othercost,QuoteValue,
  CommentsRemarks,)async {
    final  url=APIConstants.leadGeneration;
    var bodyvalue={
    'EnquiryDate':EnquiryDate,
    'Branch':Branch,
    'CompanyName':CompanyName,
    'CustomerName':CustomerName,
    'MobileNumber':MobileNumber,
    'EmailId':EmailId,
    'Street1':Street1,
    'Street2':Street2,
    'City':City,
    'Pincode':Pincode,
    'State':State,
    'Country':Country,
    'ModeofEnquiry':ModeofEnquiry,
    'LeadOwner':LeadOwner,
    'ServiceLocation':ServiceLocation,
    'ServiceCategory':ServiceCategory,
    'ServiceDescription':ServiceDescription,
    'BusinessSector':BusinessSector,
    'DivisonDepartment':DivisonDepartment,
    'UOM':UOM,
    'UnitValue':UnitValue,
    'Quantity':Quantity,
    'Othercost':Othercost,
    'QuoteValue':QuoteValue,
    'CommentsRemarks':CommentsRemarks,
    
    };
print (bodyvalue); 
final response=await http.post(Uri.parse(url),body: bodyvalue);
print(response);
var responseJson = json.decode(response.body);
print(responseJson);
var status =responseJson['status'];
var message=responseJson['message']; 
print(status);
if(status==1){
    Navigator.pop(context);
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 14.0);
      // navigateTologinPage(context, Login());
      Navigator.push(context, MaterialPageRoute(builder: (context) => Salefollowup()));
}else {
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
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
        context, MaterialPageRoute(builder: (context) => Quationtracker()));
  }

}