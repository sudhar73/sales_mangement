 import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sales/model/quationtracker.dart';
import 'package:sales/utils/api.dart';
import 'package:sales/utils/texts.dart';
import 'package:sales/view/management/sales_management/allsalesorder.dart';
import 'package:sales/view/management/sales_management/customerservices.dart';
import 'package:sales/view/management/sales_management/lead_genration.dart';
import 'package:sales/view/management/sales_management/leadsummary.dart';
import 'package:sales/view/management/sales_management/productservices.dart';
import 'package:sales/view/management/sales_management/sales_flowup.dart';
import 'package:sales/view/management/sales_management/salesrepersentative.dart';
import 'package:sales/view/management/sales_management/settings/mainproductgroup.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:http/http.dart' as http;

class Quationtracker extends StatefulWidget {
  const Quationtracker({Key key}) : super(key: key);

  @override
  _QuationtrackerState createState() => _QuationtrackerState();
}

class _QuationtrackerState extends State<Quationtracker> {
  List<Employee> employees = <Employee>[];
  EmployeeDataSource employeeDataSource;

  @override
  void initState() {
    super.initState();
    employees = getEmployeeData();
    employeeDataSource = EmployeeDataSource(employeeData: employees);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: HexColor("#023781"),
          toolbarHeight: 60,
          centerTitle: true,
          actions: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                    backgroundColor: HexColor("#7C8EB2"),
                    radius: 30,
                    child: Icon(Icons.people_sharp, color: Colors.white)))
          ],
          title: Material(
            elevation: 3,
            shadowColor: Colors.grey,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
              //margin: EdgeInsets.only(top: 20),
              // width: width * 0.7,
              height: 50,
              child: TextField(
                decoration: Texts.Textfeild(
                    "Search here", Icon(Icons.search, color: Colors.grey)),
                style: Texts.style(Texts.h6, Colors.black, Texts.normal),
              ),
            ),
          ),
        ),
        body: Container(
            child: SingleChildScrollView(
                child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                children: [
                  Image(
                    image: AssetImage("assets/dashboard/dashboard-active.png"),
                  ),
                  Icon(Icons.arrow_right),
                  Text("General & Administraion",
                      style: Texts.style(
                          Texts.h9, HexColor("#7C8EB2"), Texts.normal)),
                  Icon(Icons.arrow_right),
                  Text("Sales Management",
                      style:
                          Texts.style(14.0, HexColor("#7C8EB2"), Texts.normal))
                ],
              ),
            ),
// ignore: avoid_unnecessary_containers
            Center(
              child: Container(
                  child: Text("Quotation Tracker", style: Texts.primary1d())),
            ),
            SizedBox(height: 5),
            Container(
              width: Get.width / 1,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                      height: 40,
                      width: 90,
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {
                            Get.to(_addexit(context));
                          },
                          color: HexColor("#7C8EB2"),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Add",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                              Icon(Icons.arrow_right, color: Colors.white),
                            ],
                          ))),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Center(
                    child: Container(
                        height: 50,
                        width: Get.width / 4.5,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          onPressed: () {},
                          color: HexColor("#7D7D7D"),
                          child: Text("Copy",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Center(
                    child: Container(
                        height: 50,
                        width: Get.width / 4.5,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          onPressed: () {},
                          color: HexColor("#7D7D7D"),
                          child: Text("Excel",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        )),
                  ),
                ),
              ],
            ),

// Padding(
//   padding: const EdgeInsets.all(10.0),
//   child:   Material(
//                      elevation: 5,
//                      shadowColor: Colors.grey,
//                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//                      child: Container(
//                         //margin: EdgeInsets.only(top: 20),
//                         // width: width * 0.7,
//                       height:50,
//                       child: TextField(
//                       decoration: Texts.Textfeild("Search here",Icon(Icons.search,color:Colors.grey)),
//                       style: Texts.style(
//                       Texts.h6, Colors.black, Texts.normal),
//                         ),), ),
// ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                shadowColor: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  width: Get.width,
                  child: Center(
                    child: SfDataGridTheme(
                      data: SfDataGridThemeData(
                        // rowHoverColor: HexColor("#7C8EB2"),
                        // rowHoverTextStyle: TextStyle(
                        // color: Colors.white,
                        // fontSize: 14,),
                        sortIconColor: Colors.white,
                        
                        headerColor: HexColor("#023781"),
                      ),
                      child: SfDataGrid(
                        selectionMode: SelectionMode.multiple,
                        frozenColumnsCount: 2,
                        allowSorting: true,
                        allowEditing: true,
                        allowPullToRefresh: true,
                        showCheckboxColumn: false,
                        gridLinesVisibility: GridLinesVisibility.vertical,
                        headerGridLinesVisibility: GridLinesVisibility.vertical,
                        source: employeeDataSource,
                        columns: <GridColumn>[
                          GridColumn(
                              allowEditing: true,
                              columnName: 'owner',
                              label: Container(
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  color: HexColor("#023781"),
                                  child: Text(
                                    'Sales Owner',
                                    style: Texts.whit1e(),
                                  ))),
                            GridColumn(
                              allowEditing: true,
                              columnName: 'id',
                              label: Container(
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  color: HexColor("#023781"),
                                  child: Text(
                                    'Lead ID',
                                    style: Texts.whit1e(),
                                  ))),      
                              GridColumn(
                              allowEditing: true,
                              columnName: 'company',
                              label: Container(
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  color: HexColor("#023781"),
                                  child: Text(
                                    'Company Name',
                                    style: Texts.whit1e(),
                                  ))),  
                              GridColumn(
                              allowEditing: true,
                              columnName: 'customer',
                              label: Container(
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  color: HexColor("#023781"),
                                  child: Text(
                                    'Customer Name',
                                    style: Texts.whit1e(),
                                  ))),     
                              GridColumn(
                              allowEditing: true,
                              columnName: 'mail',
                              label: Container(
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  color: HexColor("#023781"),
                                  child: Text(
                                    'Email ID',
                                    style: Texts.whit1e(),
                                  ))),
                                GridColumn(
                              allowEditing: true,
                              columnName: 'number',
                              label: Container(
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  color: HexColor("#023781"),
                                  child: Text(
                                    'Mobile Number',
                                    style: Texts.whit1e(),
                                  ))),
                              GridColumn(
                              allowEditing: true,
                              columnName: 'date',
                              label: Container(
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  color: HexColor("#023781"),
                                  child: Text(
                                    'Order Date',
                                    style: Texts.whit1e(),
                                  ))),      
                             GridColumn(
                              allowEditing: true,
                              columnName: 'deldate',
                              label: Container(
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  color: HexColor("#023781"),
                                  child: Text(
                                    'Delivery Date',
                                    style: Texts.whit1e(),
                                  ))),  
                              GridColumn(
                              allowEditing: true,
                              columnName: 'bill',
                              label: Container(
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  color: HexColor("#023781"),
                                  child: Text(
                                    'Billing Address',
                                    style: Texts.whit1e(),
                                  ))),        
                               GridColumn(
                              allowEditing: true,
                              columnName: 'ship',
                              label: Container(
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  color: HexColor("#023781"),
                                  child: Text(
                                    'Shipping Address',
                                    style: Texts.whit1e(),
                                  ))),        
                              GridColumn(
                              allowEditing: true,
                              columnName: 'serviceid',
                              label: Container(
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  color: HexColor("#023781"),
                                  child: Text(
                                    'Product Service ID',
                                    style: Texts.whit1e(),
                                  ))),
                              GridColumn(
                              allowEditing: true,
                              columnName: 'servicename',
                              label: Container(
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  color: HexColor("#023781"),
                                  child: Text(
                                    'Product Service Name',
                                    style: Texts.whit1e(),
                                  ))),      
                             GridColumn(
                              allowEditing: true,
                              columnName: 'value',
                              label: Container(
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  color: HexColor("#023781"),
                                  child: Text(
                                    'Unit Value',
                                    style: Texts.whit1e(),
                                  ))), 
                              GridColumn(
                              allowEditing: true,
                              columnName: 'quantity',
                              label: Container(
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  color: HexColor("#023781"),
                                  child: Text(
                                    'Quantity',
                                    style: Texts.whit1e(),
                                  ))),   
                              GridColumn(
                              allowEditing: true,
                              columnName: 'quote',
                              label: Container(
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  color: HexColor("#023781"),
                                  child: Text(
                                    'Quote Value',
                                    style: Texts.whit1e(),
                                  ))),       
                               GridColumn(
                              allowEditing: true,
                              columnName: 'cost',
                              label: Container(
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  color: HexColor("#023781"),
                                  child: Text(
                                    'Other Cost',
                                    style: Texts.whit1e(),
                                  ))),   
                              GridColumn(
                              allowEditing: true,
                              columnName: 'subtotal',
                              label: Container(
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  color: HexColor("#023781"),
                                  child: Text(
                                    'Sub Total',
                                    style: Texts.whit1e(),
                                  ))),             
                              GridColumn(
                              allowEditing: true,
                              columnName: 'discount',
                              label: Container(
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  color: HexColor("#023781"),
                                  child: Text(
                                    'Discount',
                                    style: Texts.whit1e(),
                                  ))),     
                               GridColumn(
                              allowEditing: true,
                              columnName: 'tax',
                              label: Container(
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  color: HexColor("#023781"),
                                  child: Text(
                                    'Tax',
                                    style: Texts.whit1e(),
                                  ))),     
                            GridColumn(
                              allowEditing: true,
                              columnName: 'grandtotal',
                              label: Container(
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  color: HexColor("#023781"),
                                  child: Text(
                                    'Grand Total',
                                    style: Texts.whit1e(),
                                  ))),   
                               GridColumn(
                              allowEditing: true,
                              columnName: 'status',
                              label: Container(
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  color: HexColor("#023781"),
                                  child: Text(
                                    'Quote Status',
                                    style: Texts.whit1e(),
                                  ))),   
                             GridColumn(
                              allowEditing: true,
                              columnName: 'act',
                              label: Container(
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  color: HexColor("#023781"),
                                  child: Text(
                                    'Action',
                                    style: Texts.whit1e(),
                                  ))),       


                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ))),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.blueAccent),
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image(image: AssetImage("assets/Logo.png"))),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 1,
                ),
                child: Container(
                  child: ExpansionTile(
                    expandedAlignment: Alignment.topLeft,
                    //leading: Padding( padding:EdgeInsets.only(right:1),child: Container(child:Image(image:AssetImage("assets/menuicon/employe.png")))) ,
                    title: Container(
                      child: Text("Sales Management",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          )),
                    ),

                    expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () {
                              Get.to(Lead_genaration());
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 5, top: 5),
                              child: Row(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                          height: 40,
                                          width: 40,
                                          child: Image(
                                            image: AssetImage(
                                                "assets/Lead Generation.png"),
                                          ))),
                                  Text(" Lead Generation",
                                      style: TextStyle(fontSize: 16)),
                                ],
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () {
                              Get.to(Salefollowup());
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 5, top: 5),
                              child: Row(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                          height: 40,
                                          width: 40,
                                          child: Image(
                                            image: AssetImage(
                                                "assets/Sales Follow Up.png"),
                                          ))),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Sales Follow-Up ",
                                        style: TextStyle(fontSize: 16)),
                                  ),
                                ],
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () {
                              Get.to(Productservice());
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 5, top: 5),
                              child: Row(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                          height: 40,
                                          width: 40,
                                          child: Image(
                                            image: AssetImage(
                                                "assets/Products Services.png"),
                                          ))),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Product/Services",
                                        style: TextStyle(fontSize: 16)),
                                  ),
                                ],
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () {
                              Get.to(Salesreperstative());
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 5, top: 5),
                              child: Row(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                          height: 40,
                                          width: 40,
                                          child: Image(
                                            image: AssetImage(
                                                "assets/Sales Representative.png"),
                                          ))),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Sales Representatives",
                                        style: TextStyle(fontSize: 16)),
                                  ),
                                ],
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () {
                              Get.to(Quationtracker());
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 5, top: 5),
                              child: Row(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                          height: 40,
                                          width: 40,
                                          child: Image(
                                            image: AssetImage(
                                                "assets/Quotation Tracker.png"),
                                          ))),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Quotation Tracker",
                                        style: TextStyle(fontSize: 16)),
                                  ),
                                ],
                              ),
                            )),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                              onTap: () {
                                Get.to(AllSalesorder());
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 5, top: 5),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                            height: 40,
                                            width: 40,
                                            child: Image(
                                              image: AssetImage(
                                                  "assets/Sales Orders.png"),
                                            ))),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Sales Orders",
                                          style: TextStyle(fontSize: 16)),
                                    ),
                                  ],
                                ),
                              ))),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                              onTap: () {
                                Get.to(Leadsummary());
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 5, top: 5),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                            height: 40,
                                            width: 40,
                                            child: Image(
                                              image: AssetImage(
                                                  "assets/Lead Summary Report.png"),
                                            ))),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Lead Summary Report",
                                          style: TextStyle(fontSize: 16)),
                                    ),
                                  ],
                                ),
                              ))),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () {
                              Get.to(Customerservices());
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 5, top: 5),
                              child: Row(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                          height: 40,
                                          width: 40,
                                          child: Image(
                                            image: AssetImage(
                                                "assets/Customer Service.png"),
                                          ))),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Customer Service",
                                        style: TextStyle(fontSize: 16)),
                                  ),
                                ],
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () {
                              Get.to(Mainsettings());
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 5, top: 5),
                              child: Row(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                          height: 40,
                                          width: 40,
                                          child: Image(
                                            image: AssetImage(
                                                "assets/Settings.png"),
                                          ))),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Settings",
                                        style: TextStyle(fontSize: 16)),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  _addexit(BuildContext context) {
    // ignore: unnecessary_new
    return new AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 25),
      title: Center(
          child: Text('Add Quotation Tracker', style: Texts.primary1bigbold())),
      content: SingleChildScrollView(
        child: Container(
          width: Get.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[Saveexit()],
          ),
        ),
      ),
    );
  }
 List<Employee> getEmployeeData() {
    return [
      Employee('Karthik','LD001','Ocean','Prakash','Prakash@gmail.com',9876543210,12-12-2020,18-12-2020,'Chennai','Chennai','SER001','Cleaning',25,2,50,20,90,10,5,100,'Cold','Edit Delete'),
     
    ];
  }
}

class Employee {
  /// Creates the employee class with required details.
  Employee(this.owner, this.id, this.company, this.customer, this.mail, this.number, this.date,this.deldate, 
this.bill, this.ship, this.serviceid, this.servicename,this.value, this.quantity, this.quote, this.cost, 
this.subtotal, this.discount,this.tax, this.grandtotal, this.status, this.act);

  /// Sales Owner
  final String owner;
  
  /// Lead ID
  final String id;

  /// Company Name
  final String company;

  /// Customer Name
  final String customer;

  /// Email ID
  final String mail;

  /// Phone Number
  final int number;

  /// Order Date
  final int date;

  /// Delivery Date
  final int deldate;

  /// Billing Address
  final String bill;

  /// Shipping Address
  final String ship;

  /// Product Service ID
  final String serviceid;

  /// Product Service Name
  final String servicename;

  /// Unit Value
  final int value;

  /// Quantity
  final int quantity;

  /// Quote Value
  final int quote;

  /// Other Cost
  final int cost;

  /// Subtotal
  final int subtotal;

  /// Discount
  final int discount;

  /// Tax
  final int tax;

  /// Grand Total
  final int grandtotal;

  /// Quote Status
  final String status;

  /// Action
  final String act; 
 
}

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({List<Employee> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'owner', value: e.owner),
              DataGridCell<String>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'company', value: e.company),
              DataGridCell<String>(columnName: 'customer', value: e.customer),
              DataGridCell<String>(columnName: 'mail', value: e.mail),
              DataGridCell<int>(columnName: 'number', value: e.number),
              DataGridCell<int>(columnName: 'date', value: e.date),
              DataGridCell<int>(columnName: 'deldate', value: e.deldate),
              DataGridCell<String>(columnName: 'bill', value: e.bill),
              DataGridCell<String>(columnName: 'ship', value: e.ship),
              DataGridCell<String>(columnName: 'serviceid', value: e.serviceid),
              DataGridCell<String>(columnName: 'servicename', value: e.servicename),
              DataGridCell<int>(columnName: 'value', value: e.value),
              DataGridCell<int>(columnName: 'quantity', value: e.quantity),
              DataGridCell<int>(columnName: 'quote', value: e.quote),
              DataGridCell<int>(columnName: 'cost', value: e.cost),
              DataGridCell<int>(columnName: 'subtotal', value: e.subtotal),
              DataGridCell<int>(columnName: 'discount', value: e.discount),
              DataGridCell<int>(columnName: 'tax', value: e.tax),
              DataGridCell<int>(columnName: 'grandtotal', value: e.grandtotal),
              DataGridCell<String>(columnName: 'status', value: e.status),           
              DataGridCell<String>(columnName: 'act', value: e.act)
            ]))
        .toList();
  }
  List<DataGridRow> _employeeData = [];
  @override
  List<DataGridRow> get rows => _employeeData;
  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    Color backgroundcolor() {
      int index = effectiveRows.indexOf(row);
      if (index % 2 == 0) {
        return Colors.white;
      } else {
        return Colors.grey[100];
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
  const Saveexit({Key key}) : super(key: key);
  @override
  _SaveexitState createState() => _SaveexitState();
}

class _SaveexitState extends State<Saveexit> {
  Quationtrackermodel quationtrackermodel=Quationtrackermodel();
  final formGlobalKey = GlobalKey<FormState>();
  DateTime _date = DateTime.now();
  final dateController = TextEditingController();
  final dateController1 = TextEditingController();
  final TextEditingController textcontroler = TextEditingController();
  final TextEditingController textcontroler1 = TextEditingController();
  final TextEditingController productidcontroler = TextEditingController();

  static const product = [
    "EMP001",
    "EMP002",
    "EMP003",
    "EMP004",
    "EMP005",
    "EMP006",
    "EMP007",
    "EMP008",
    "EMP009",
    "EMP002",
  ];
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

  get quat => null;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formGlobalKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Text("Sales Owner", style: Texts.primary2a()),
          ),
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
              child: Card(
                  shadowColor: Colors.grey,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: TypeAheadFormField(
                    
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Sales Owner is required";
                        }
                        return null;
                      },
                      onSaved: (saleOwner) {
                        quationtrackermodel.SaleOwner=saleOwner;
                       
                      },
                      suggestionsCallback: (pattern) => country.where(
                        (item) =>
                            item.toLowerCase().contains(pattern.toLowerCase()),
                      ),
                      itemBuilder: (_, String item) => ListTile(
                        title: Text(item),
                      ),
                      onSuggestionSelected: (String val) {
                        this.textcontroler.text = val;
                        print(val);
                      },
                      getImmediateSuggestions: true,
                      hideSuggestionsOnKeyboardHide: false,
                      hideOnEmpty: false,
                      noItemsFoundBuilder: (context) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('No Items Found'),
                      ),
                      textFieldConfiguration: TextFieldConfiguration(
                        decoration: InputDecoration(
                          hintText: "Sales Owner is required",
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                        controller: this.textcontroler,
                      ),
                    ),
                  ))),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Text("Lead ID", style: Texts.primary2a()),
          ),
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
              child: Card(
                  shadowColor: Colors.grey,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: TypeAheadFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Lead ID is required";
                        }
                        return null;
                      },
                      onSaved: (leadId) {
                        quationtrackermodel.LeadId=leadId;
                       
                      },
                      suggestionsCallback: (pattern) => country.where(
                        (item) =>
                            item.toLowerCase().contains(pattern.toLowerCase()),
                      ),
                      itemBuilder: (_, String item) => ListTile(
                        title: Text(item),
                      ),
                      onSuggestionSelected: (String val) {
                        this.textcontroler1.text = val;
                        print(val);
                      },
                      getImmediateSuggestions: true,
                      hideSuggestionsOnKeyboardHide: false,
                      hideOnEmpty: false,
                      noItemsFoundBuilder: (context) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('No Items Found'),
                      ),
                      textFieldConfiguration: TextFieldConfiguration(
                        decoration: InputDecoration(
                          hintText: "Select Lead ID",
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                        controller: this.textcontroler1,
                      ),
                    ),
                  ))),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Text("Company Name", style: Texts.primary2a()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
                shadowColor: Colors.grey,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                    child: TextFormField(
                       onSaved: (companyName) {
                        quationtrackermodel.CompanyName=companyName;
                       
                      },
                  decoration: Texts.Textfeild1(),
                ))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Text("Customer Name", style: Texts.primary2a()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
                shadowColor: Colors.grey,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                    child: TextFormField(
                  decoration: Texts.Textfeild1(),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Customer Name is required";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (customerName) {
                        quationtrackermodel.CustomerName=customerName;
                       
                      },
                ))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Text("Email Id", style: Texts.primary2a()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
                shadowColor: Colors.grey,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                    child: TextFormField(
                       onSaved: (email) {
                        quationtrackermodel.Email=email;
                       
                      },
                  decoration: Texts.Textfeild1(),
                ))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Text("Phone Number", style: Texts.primary2a()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
                shadowColor: Colors.grey,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                    child: TextFormField(
                  decoration: Texts.Textfeild1(),
                  onSaved: (phoneNumber) {
                        quationtrackermodel.PhoneNumber=phoneNumber;
                      },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Phone Number is required";
                    } else {
                      return null;
                    }
                  },
                ))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Text("Order Date", style: Texts.primary2a()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
                shadowColor: Colors.grey,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  child: TextFormField(
                    readOnly: true,
                    controller: dateController,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: HexColor("#172B4D")),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Colors.transparent))),
                    onTap: () async {
                      var date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                          currentDate: DateTime.now());

                      dateController.text = date.toString().substring(0, 10);
                    },
                     onSaved: (orderDate) {
                        quationtrackermodel.OrderDate=orderDate;
                      },
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Text("Delivery Date", style: Texts.primary2a()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
                shadowColor: Colors.grey,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  child: TextFormField(
                    readOnly: true,
                    controller: dateController1,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: HexColor("#172B4D")),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Colors.transparent))),
                    onTap: () async {
                      var date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                          currentDate: DateTime.now());

                      dateController1.text = date.toString().substring(0, 10);
                    },
                    onSaved: (deliveryDate) {
                        quationtrackermodel.DeliveryDate=deliveryDate;
                      },
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Text("Billing Address", style: Texts.primary2a()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
                shadowColor: Colors.grey,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                    child: TextFormField(
                  decoration: Texts.Textfeild1(),
                   onSaved: (billingAddress) {
                        quationtrackermodel.BillingAddress=billingAddress;
                      },
                ))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Text("Shipping Address", style: Texts.primary2a()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
                shadowColor: Colors.grey,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                    child: TextFormField(
                  decoration: Texts.Textfeild1(),
                   onSaved: (shippingAddress) {
                        quationtrackermodel.ShippingAddress=shippingAddress;
                      },
                ))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Text("Product/Service ID", style: Texts.primary2a()),
          ),
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
              child: Card(
                  shadowColor: Colors.grey,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: TypeAheadFormField(
                     onSaved: (productServiceId) {
                        quationtrackermodel.ProductServiceId=productServiceId;
                      },
                      suggestionsCallback: (pattern) => product.where(
                        (item) =>
                            item.toLowerCase().contains(pattern.toLowerCase()),
                      ),
                      itemBuilder: (_, String item) => ListTile(
                        title: Text(item),
                      ),
                      onSuggestionSelected: (String val) {
                        this.productidcontroler.text = val;
                        print(val);
                      },
                      getImmediateSuggestions: true,
                      hideSuggestionsOnKeyboardHide: false,
                      hideOnEmpty: false,
                      noItemsFoundBuilder: (context) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('No Items Found'),
                      ),
                      textFieldConfiguration: TextFieldConfiguration(
                        decoration: InputDecoration(
                          hintText: "select Product/Service ID",
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                        controller: this.productidcontroler,
                      ),
                    ),
                  ))),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Text("Product/Service Name", style: Texts.primary2a()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
                shadowColor: Colors.grey,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                    child: TextFormField(
                  decoration: Texts.Textfeild1(),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Product/Service Name is required";
                    } else {
                      return null;
                    }
                  },
                   onSaved: (productServiceName) {
                        quationtrackermodel.ProductServiceName=productServiceName;
                      },
                ))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Text("Unit Value", style: Texts.primary2a()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
                shadowColor: Colors.grey,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                    child: TextFormField(
                  decoration: Texts.Textfeild1(),
                  onSaved: (unitValue) {
                        quationtrackermodel.UnitValue=unitValue;
                      },
                ))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Text("Quantity", style: Texts.primary2a()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
                shadowColor: Colors.grey,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                    child: TextFormField(
                  decoration: Texts.Textfeild1(),
                  onSaved: (quantity) {
                        quationtrackermodel.Quantity=quantity;
                      },
                ))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Text("Quote Value", style: Texts.primary2a()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
                shadowColor: Colors.grey,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                    child: TextFormField(
                  decoration: Texts.Textfeild1(),
                   onSaved: (quoteValue) {
                        quationtrackermodel.QuoteValue=quoteValue;
                      },
                ))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Text("Other Cost", style: Texts.primary2a()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
                shadowColor: Colors.grey,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                    child: TextFormField(
                  decoration: Texts.Textfeild1(),
                   onSaved: (otherCost) {
                        quationtrackermodel.OtherCost=otherCost;
                      },
                ))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Text("Sub Total", style: Texts.primary2a()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
                shadowColor: Colors.grey,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                    child: TextFormField(
                  decoration: Texts.Textfeild1(),
                  onSaved: (subTotal) {
                        quationtrackermodel.SubTotal=subTotal;
                      },
                ))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Text("Discount", style: Texts.primary2a()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
                shadowColor: Colors.grey,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                    child: TextFormField(
                  decoration: Texts.Textfeild1(),
                  onSaved: (discount) {
                        quationtrackermodel.Discount=discount;
                      },
                ))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Text("Tax", style: Texts.primary2a()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
                shadowColor: Colors.grey,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                    child: TextFormField(
                  decoration: Texts.Textfeild1(),
                  onSaved: (tax) {
                        quationtrackermodel.Tax=tax;
                      },
                ))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Text("Grand Total", style: Texts.primary2a()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
                shadowColor: Colors.grey,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                    child: TextFormField(
                  decoration: Texts.Textfeild1(),
                  onSaved: (grandTotal) {
                        quationtrackermodel.GrandTotal=grandTotal;
                      },
                ))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Text("Quote Status", style: Texts.primary2a()),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Card(
                shadowColor: Colors.grey,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: DropdownSearch<String>(
                    mode: Mode.MENU,
                    items: ["Hot", "warm", "Cold", "Hold", "Cancelled", "Sold"],
                    dropdownSearchDecoration: InputDecoration(
                      hintText: "Select a status",
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                    popupItemDisabled: (String s) => s.startsWith('I'),
                    onChanged: (value) {
                      setState(() {
                        
                        quationtrackermodel.QuoteStatus=value;
                     
                        // signupmodel.graduted = value;
                        print(value);
                      });
                    },
                  ),
                ),
              )),
          SizedBox(height: 15),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 45,
                    width: Get.width / 3.8,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: HexColor("#023781"),
                        onPressed: () {
                          if (formGlobalKey.currentState.validate()) {
                            (formGlobalKey.currentState.save());
                            _loginButtonAction(
                              quationtrackermodel.SaleOwner,
                              quationtrackermodel.LeadId,
                              quationtrackermodel.CompanyName,
                              quationtrackermodel.CustomerName,
                              quationtrackermodel.Email,
                              quationtrackermodel.PhoneNumber,
                              quationtrackermodel.OrderDate,
                              quationtrackermodel.DeliveryDate,
                              quationtrackermodel.BillingAddress,
                              quationtrackermodel.ShippingAddress,
                              quationtrackermodel.ProductServiceId,
                              quationtrackermodel.ProductServiceName,
                              quationtrackermodel.UnitValue,
                              quationtrackermodel.Quantity,
                              quationtrackermodel.QuoteValue,
                              quationtrackermodel.OtherCost,
                              quationtrackermodel.SubTotal,
                              quationtrackermodel.Discount,
                              quationtrackermodel.Tax,
                              quationtrackermodel.GrandTotal,
                              quationtrackermodel.QuoteStatus,
                              );
                          }
                        },
                        child: Text("SUBMIT",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)))),
                Container(
                    height: 45,
                    width: Get.width / 3.9,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: HexColor("#172B4D"), width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.white,
                        onPressed: () {
                          Get.back();
                        },
                        child: Text("Cancel",
                            style: TextStyle(
                                color: HexColor("#023781"), fontSize: 16)))),
              ])
        ],
      ),
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

  void  _loginButtonAction( String SaleOwner,
   LeadId,
   CompanyName,
   CustomerName,
   Email,
   PhoneNumber,
   OrderDate,
   DeliveryDate,
   BillingAddress,
   ShippingAddress,
   ProductServiceId,
   ProductServiceName,
   UnitValue,
   Quantity,
   QuoteValue,
   OtherCost,
   SubTotal,
   Discount,
   Tax,
   GrandTotal,
   QuoteStatus,

  )async{
final url=APIConstants.Qutationtracker;
    var bodyvalue =
        // json.encode(
        {
      'SaleOwner': SaleOwner,
      'LeadId': LeadId,
      'CompanyName': CompanyName,
      'CustomerName': CustomerName,
      'Email': Email,
      'PhoneNumber': PhoneNumber,
      'OrderDate': OrderDate,
      'DeliveryDate': DeliveryDate,
      'BillingAddress': BillingAddress,
      'ShippingAddress': ShippingAddress,
      'ProductServiceId': ProductServiceId,
      'ProductServiceName': ProductServiceName,
      'UnitValue': UnitValue,
      'Quantity': Quantity,
      'QuoteValue': QuoteValue,
      'OtherCost': OtherCost,
      //'devicetoken': fcmToken
    };
    
    print(bodyvalue);
    final response = await http.post(Uri.parse(url), body: bodyvalue);
    print(response.body);
    var responseJson = json.decode(response.body);
    print(responseJson);
    var status = responseJson['status'];
    var message = responseJson['message'];
    if (status == 1) {
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
      Navigator.push(context, MaterialPageRoute(builder: (context) => Quationtracker()));
      // replacePage(context, Login());
    } else {
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor:Colors.red,
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