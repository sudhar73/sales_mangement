import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sales/utils/texts.dart';
import 'package:sales/view/management/sales_management/Quationtracker.dart';
import 'package:sales/view/management/sales_management/allsalesorder.dart';
import 'package:sales/view/management/sales_management/customerservices.dart';
import 'package:sales/view/management/sales_management/lead_genration.dart';
import 'package:sales/view/management/sales_management/leadsummary.dart';
import 'package:sales/view/management/sales_management/productservices.dart';
import 'package:sales/view/management/sales_management/salesrepersentative.dart';
import 'package:sales/view/management/sales_management/settings/mainproductgroup.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class Salefollowup extends StatefulWidget {
  const Salefollowup({Key key}) : super(key: key);

  @override
  _SalefollowupState createState() => _SalefollowupState();
}

class _SalefollowupState extends State<Salefollowup> {
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      child:
                          Text("All Follow-Up Call", style: Texts.primary1d())),
                  Container(
                    width: Get.width / 2.66,
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.centerRight,
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
                                    Icon(Icons.arrow_right,
                                        color: Colors.white),
                                  ],
                                ))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
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
                //                 Padding(padding: const EdgeInsets.all(3.0),
                //                  child: Center(
                //                    child: Container(
                //                      height:50,
                //                       width:Get.width/4.5,
                //                      child: RaisedButton(
                //                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

                //                        onPressed:(){

                //                        },
                //                      color:HexColor("#7D7D7D"),
                // child: Text("CSV",style:TextStyle(color:Colors.white,fontSize:16)),
                //                        )),
                //                  ),
                //                ),
                //                 Padding(padding: const EdgeInsets.all(3.0),
                //                  child: Center(
                //                    child: Container(
                //                      height:50,
                //                       width:Get.width/4.5,
                //                      child: RaisedButton(
                //                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

                //                        onPressed:(){

                //                        },
                //                      color:HexColor("#7D7D7D"),
                // child: Text("Print",style:TextStyle(color:Colors.white,fontSize:16)),
                //                        )),
                //                  ),
                //                ),
              ],
            ),
// Padding(
//   padding: const EdgeInsets.all(10.0),
//   child:   Material(

//                       elevation: 5,

//                       shadowColor: Colors.grey,

//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

//                       child: Container(

//                         //margin: EdgeInsets.only(top: 20),

//                         // width: width * 0.7,

//                         height:50,

//                         child: TextField(

//                           decoration: Texts.Textfeild("Search here",Icon(Icons.search,color:Colors.grey)),

//                           style: Texts.style(

//                            Texts.h6, Colors.black, Texts.normal),

//                         ),),

//                     ),
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
                        headerHoverColor: Colors.yellow,
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
                              columnName: 'id',
                              label: Container(
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  color: HexColor("#023781"),
                                  child: Text(
                                    'S.No',
                                    style: Texts.whit1e(),
                                  ))),
                          GridColumn(
                              columnName: 'name',
                              label: Container(
                                  color: HexColor("#023781"),
                                  padding: EdgeInsets.all(8.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Lead ID',
                                    style: Texts.whit1e(),
                                    textAlign: TextAlign.center,
                                  ))),
                           GridColumn(
                              columnName: 'emp',
                              label: Container(
                                  color: HexColor("#023781"),
                                  padding: EdgeInsets.all(8.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Employee ID',
                                    style: Texts.whit1e(),
                                    textAlign: TextAlign.center,
                                  ))),
                           GridColumn(
                              columnName: 'empname',
                              label: Container(
                                  color: HexColor("#023781"),
                                  padding: EdgeInsets.all(8.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Employee Name',
                                    style: Texts.whit1e(),
                                    textAlign: TextAlign.center,
                                  ))),             

                          GridColumn(
                              columnName: 'designation',
                              label: Container(
                                  color: HexColor("#023781"),
                                  padding: EdgeInsets.all(1.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Customer Name',
                                    style: Texts.whit1e(),
                                    textAlign: TextAlign.center,
                                  ))),
                          GridColumn(
                              columnName: 'salary',
                              label: Container(
                                  padding: EdgeInsets.all(8.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Email',
                                    style: Texts.whit1e(),
                                    textAlign: TextAlign.center,
                                  ))),
                          GridColumn(
                              columnName: 'number',
                              label: Container(
                                  color: HexColor("#023781"),
                                  padding: EdgeInsets.all(1.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Phone Number',
                                    style: Texts.whit1e(),
                                    textAlign: TextAlign.center,
                                  ))),
                          GridColumn(
                              columnName: 'date',
                              label: Container(
                                  color: HexColor("#023781"),
                                  padding: EdgeInsets.all(1.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Current Date',
                                    style: Texts.whit1e(),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                  ))),
                          GridColumn(
                              columnName: 'time',
                              label: Container(
                                  color: HexColor("#023781"),
                                  padding: EdgeInsets.all(1.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Current Time',
                                    style: Texts.whit1e(),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                  ))),
                           GridColumn(
                              columnName: 'service',
                              label: Container(
                                  color: HexColor("#023781"),
                                  padding: EdgeInsets.all(8.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Product/Service Name',
                                    style: Texts.whit1e(),
                                    textAlign: TextAlign.center,
                                  ))),        
                          GridColumn(
                              columnName: 'details',
                              label: Container(
                                  color: HexColor("#023781"),
                                  padding: EdgeInsets.all(1.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Call Details',
                                    style: Texts.whit1e(),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                  ))),
                          GridColumn(
                              columnName: 'result',
                              label: Container(
                                  color: HexColor("#023781"),
                                  padding: EdgeInsets.all(1.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Call Results',
                                    style: Texts.whit1e(),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                  ))),
                          GridColumn(
                              columnName: 'call',
                              label: Container(
                                  color: HexColor("#023781"),
                                  padding: EdgeInsets.all(1.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Next Folow Up Date/Time',
                                    style: Texts.whit1e(),
                                    textAlign: TextAlign.center,
                                  ))),
                          GridColumn(
                              columnName: 'follow',
                              label: Container(
                                  color: HexColor("#023781"),
                                  padding: EdgeInsets.all(1.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Follow Up Date',
                                    style: Texts.whit1e(),
                                    textAlign: TextAlign.center,
                                  ))),
                           GridColumn(
                              columnName: 'update',
                              label: Container(
                                  color: HexColor("#023781"),
                                  padding: EdgeInsets.all(8.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Follow Up Update',
                                    style: Texts.whit1e(),
                                    textAlign: TextAlign.center,
                                  ))),        
                          GridColumn(
                              columnName: 'act',
                              label: Container(
                                  color: HexColor("#023781"),
                                  padding: EdgeInsets.all(1.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Action',
                                    style: Texts.whit1e(),
                                    textAlign: TextAlign.center,
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
          child: Text('Add Follow-Up Call', style: Texts.primary1bigbold())),
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
      Employee(1,'LD001','EMP01','Prakash','Suresh','suresh@gmail.com',9876543210,22-04-2020,'10;20 PM','Cleaning','Details','Intrest','Yes',28-04-2020,'Call Confirmed','Edit Delete'),
          
    ];
  }
}

class Employee {
  /// Creates the employee class with required details.
  Employee(
      this.id,
      this.name,
      this.emp,
      this.empname, 
      this.designation,
      this.salary,
      this.number,
      this.date,
      this.time,
      this.service,
      this.details,
      this.result,
      this.call,
      this.follow,
      this.update,
      this.act);

  /// Id of an employee.
  final int id;

  /// Name of an employee.
  final String name;

  /// Employee ID
  final String emp ;

  /// Employee Name
  final String empname;
  
  /// Designation of an employee.
  final String designation;

  /// Salary of an employee.
  final String salary;

  /// Phone Number
  final int number;

  /// Current date
  final int date;

  /// Current time
  final String time;

  /// Product/Service Name
  final String service;

  /// Call Details
  final String details;

  /// Call Results
  final String result;

  /// Follow Up Call Required
  final String call;

  /// Follow Up Date
  final int follow;

  /// Follow Up Update
  final String update;

  ///Action
  final String act;
}

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({List<Employee> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(columnName: 'emp', value: e.emp),
              DataGridCell<String>(columnName: 'empname', value: e.empname),
              DataGridCell<String>(columnName: 'designation', value: e.designation),
              DataGridCell<String>(columnName: 'salary', value: e.salary),
              DataGridCell<int>(columnName: 'number', value: e.number),
              DataGridCell<int>(columnName: 'date', value: e.date),
              DataGridCell<String>(columnName: 'time', value: e.time),
              DataGridCell<String>(columnName: 'service', value: e.service),
              DataGridCell<String>(columnName: 'details', value: e.details),
              DataGridCell<String>(columnName: 'result', value: e.result),
              DataGridCell<String>(columnName: 'call', value: e.call),
              DataGridCell<int>(columnName: 'follow', value: e.follow),
              DataGridCell<String>(columnName: 'update', value: e.update),
              DataGridCell<String>(columnName: 'act', value: e.act),
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

enum secondary { yes, no }

class _SaveexitState extends State<Saveexit> {
  bool isVisible = false;
  secondary inital = secondary.no;
  final formGlobalKey = GlobalKey<FormState>();
  DateTime _date = DateTime.now();
  final dateController = TextEditingController();
  final dateController1 = TextEditingController();
  final timeController = TextEditingController();
  final TextEditingController textcontroler = TextEditingController();
  final TextEditingController textcontroler1 = TextEditingController();

  static const country = [
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
  static const country1 = [
    "call result",
    "call result",
    "call result",
    "call result",
    "call result",
  ];

  // void visibility(){
  //   setState(() {
  //   isVisible != isVisible;
  //   });
  // }
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
            child: Text("Lead ID", style: Texts.primary2a()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
                shadowColor: Colors.grey,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                    child: TextField(
                  decoration: Texts.Textfeild1(),
                ))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Text("Employee Name", style: Texts.primary2a()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
                shadowColor: Colors.grey,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                    child: TextField(
                  decoration: Texts.Textfeild1(),
                ))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Text("Employee ID", style: Texts.primary2a()),
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
                          hintText: "Select Employee ID",
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
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Customer Name is required";
                    } else {
                      return null;
                    }
                  },
                  decoration: Texts.Textfeild1(),
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
                    child: TextField(
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
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Phone Number is required";
                    } else {
                      return null;
                    }
                  },
                  decoration: Texts.Textfeild1(),
                ))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Text("Date", style: Texts.primary2a()),
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
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Date is required";
                      } else {
                        return null;
                      }
                    },
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Text("Time", style: Texts.primary2a()),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Card(
                shadowColor: Colors.grey,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                    child: TextField(
                  readOnly: true,
                  controller: timeController,
                  decoration: InputDecoration(hintText: 'Pick your Time'),
                  onTap: () async {
                    var time = await showTimePicker(
                      initialTime: TimeOfDay.now(),
                      context: context,
                    );
                    timeController.text = time.format(context);
                  },
                )),
              )),
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
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Product/Service Name is required";
                    } else {
                      return null;
                    }
                  },
                  decoration: Texts.Textfeild1(),
                ))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Text("Call Details", style: Texts.primary2a()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
                shadowColor: Colors.grey,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                    child: TextField(
                  decoration: Texts.Textfeild1(),
                ))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Text("Call Result", style: Texts.primary2a()),
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
                      suggestionsCallback: (pattern) => country1.where(
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
                          hintText: "Select Call Result",
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
            child: Text("Next Follow Up date/ time", style: Texts.primary2a()),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 13,
            ),
            child: Row(
              children: [
                Row(children: <Widget>[
                  Radio<secondary>(
                    activeColor: Colors.black,
                    value: secondary.yes,
                    groupValue: inital,
                    onChanged: (secondary value) {
                      setState(() {
                        inital = value;
                        // signupmodel.postinistion =
                        "yes";
                        isVisible = false;
                      });
                    },
                  ),
                  const Text(
                    'Yes',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ]),
                Row(
                  children: <Widget>[
                    Radio<secondary>(
                      activeColor: Colors.black,
                      value: secondary.no,
                      groupValue: inital,
                      onChanged: (secondary value) {
                        setState(() {
                          inital = value;
                          //  signupmodel.postinistion =
                          "no";
                          isVisible = true;
                        });
                      },
                    ),
                    const Text(
                      'No',
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Visibility(
            visible: isVisible,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
                  child: Text("Follow Up Date", style: Texts.primary2a()),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                      shadowColor: Colors.grey,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        child: TextField(
                          readOnly: true,
                          controller: dateController1,
                          decoration: InputDecoration(
                              hintStyle: TextStyle(color: HexColor("#172B4D")),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide:
                                      BorderSide(color: Colors.transparent))),
                          onTap: () async {
                            var date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                                currentDate: DateTime.now());

                            dateController1.text =
                                date.toString().substring(0, 10);
                          },
                        ),
                      )),
                ),
              ],
            ),
          ),
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
                            Get.to(Productservice());
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
}
