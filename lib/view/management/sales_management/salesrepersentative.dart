
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sales/model/salesrepersentative.dart';
import 'package:sales/utils/api.dart';
import 'package:sales/utils/texts.dart';
import 'package:sales/view/management/sales_management/Quationtracker.dart';
import 'package:sales/view/management/sales_management/allsalesorder.dart';
import 'package:sales/view/management/sales_management/customerservices.dart';
import 'package:sales/view/management/sales_management/lead_genration.dart';
import 'package:sales/view/management/sales_management/leadsummary.dart';
import 'package:sales/view/management/sales_management/productservices.dart';
import 'package:sales/view/management/sales_management/sales_flowup.dart';
import 'package:sales/view/management/sales_management/settings/mainproductgroup.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class Salesreperstative extends StatefulWidget {
  const Salesreperstative({Key key}) : super(key: key);

  @override
  _SalesreperstativeState createState() => _SalesreperstativeState();
}

class _SalesreperstativeState extends State<Salesreperstative> {
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
                  child:
                      Text("Sales Representatives", style: Texts.primary1d())),
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
                                    'Role',
                                    style: Texts.whit1e(),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                  ))),
                          GridColumn(
                              width: 500,
                              columnName: 'salary',
                              label: Container(
                                  padding: EdgeInsets.all(8.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Responsibilities',
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
          child: Text('Add Sales Representatives',
              style: Texts.primary1bigbold())),
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
      Employee(1, 'Rajesh', 'CEO',
          'CEO is the head of the organization. For Organisation Chart, addition of CEO is required'),
      Employee(
          2, 'Ram', 'HR ADMIN', 'HR Admins permissions apply to all employees'),
      Employee(3, 'Priya', 'HR ',
          'View all employee profile information (Non-payroll) View sensitive employee information (such as PAN Card, IDs, DOB etc)'),
      Employee(1, 'Rajesh', 'CEO',
          'CEO is the head of the organization. For Organisation Chart, addition of CEO is required'),
      Employee(
          2, 'Ram', 'HR ADMIN', 'HR Admins permissions apply to all employees'),
      Employee(3, 'Priya', 'HR ',
          'View all employee profile information (Non-payroll) View sensitive employee information (such as PAN Card, IDs, DOB etc)'),
    ];
  }
}

class Employee {
  /// Creates the employee class with required details.
  Employee(this.id, this.name, this.designation, this.salary);

  /// Id of an employee.
  final int id;

  /// Name of an employee.
  final String name;

  /// Designation of an employee.
  final String designation;

  /// Salary of an employee.
  final String salary;
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
              DataGridCell<String>(
                  columnName: 'designation', value: e.designation),
              DataGridCell<String>(columnName: 'salary', value: e.salary),
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
  final formGlobalKey = GlobalKey<FormState>();
  Salesrespensentativemodel salesrepersentativemodel =Salesrespensentativemodel();
  File imageURI;
  File _image;
  File image;
  Future getImage() async {
    PickedFile pickedFile =
        // ignore: deprecated_member_use
        await ImagePicker().getImage(source: ImageSource.camera);
    //final image =await ImagePicker.pickImage(source:ImageSource.camera);
    setState(() {
      _image = File(pickedFile.path);
    });
  }
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
                    child: TextFormField(
                  decoration: Texts.Textfeild1(),
                    onSaved: (EmployeeName) {
                      salesrepersentativemodel.EmployeeName=EmployeeName;
                      },
                 
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Employee Name is required";
                    } else {
                      return null;
                    }
                  },
                ))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Text("Employee ID", style: Texts.primary2a()),
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
                    onSaved: (EmployeeId) {
                      salesrepersentativemodel.EmployeeId=EmployeeId;
                      },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Employee ID is required";
                    } else {
                      return null;
                    }
                  },
                ))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Text("Email", style: Texts.primary2a()),
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
                    onSaved: (EmailId) {
                      salesrepersentativemodel.EmailId=EmailId;
                      },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Email Id is required";
                    } else {
                      return null;
                    }
                  },
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
                    onSaved: (PhoneNumber) {
                      salesrepersentativemodel.PhoneNumber=PhoneNumber;
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
            child: Text("Image", style: Texts.primary2a()),
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
                  onSaved: (Image) {
                      salesrepersentativemodel.Image=Image;
                      },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Image is required";
                    } else {
                      return null;
                    }
                  },
                ))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Text("Department", style: Texts.primary2a()),
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
                    onSaved: (Department) {
                      salesrepersentativemodel.Department=Department;
                      },
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Department is required";
                    } else {
                      return null;
                    }
                  },
                ))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Text("Designation", style: Texts.primary2a()),
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
                  onSaved: (Designation) {
                      salesrepersentativemodel.Designation= Designation;
                      },
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Designation is required";
                    }
                    return null;
                  },
                  
                ))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Text("Product Name", style: Texts.primary2a()),
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
                       onSaved: (ProductName) {
                      salesrepersentativemodel.ProductName=ProductName;
                      },
                  decoration: Texts.Textfeild1(),
                ))),
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
                            (formGlobalKey.currentState.save());
                              showAlertDialog(context);
                                    _loginButtonAction(
                                        salesrepersentativemodel.EmployeeName,
                                        salesrepersentativemodel.EmployeeId,
                                        salesrepersentativemodel.EmailId,
                                        salesrepersentativemodel.PhoneNumber,
                                        salesrepersentativemodel.Image,
                                        salesrepersentativemodel.Department,
                                        salesrepersentativemodel.Designation,
                                        salesrepersentativemodel.ProductName,
                                       );
                                    print("Successful");
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "Please enter all the details",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 2,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 14.0);
                                  } },
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

//   _getFromCamera() async {
//     // ignore: deprecated_member_use
//     PickedFile pickedFile = await ImagePicker().getImage(
//       source: ImageSource.camera,
//       //  maxHeight: 100,    maxWidth: 100
//     );
//     if (pickedFile != null) {
//       setState(() {
//         imageURI = File(pickedFile.path);
//       });
//     }
//   }

//   _getFromGallery() async {
//     // ignore: deprecated_member_use
//     PickedFile pickedFile = await ImagePicker().getImage(
//       source: ImageSource.gallery,
//       // maxHeight: 100,             maxWidth: 100
//     );
//     if (pickedFile != null) {
//       setState(() {
//         imageURI = File(pickedFile.path);
//       });
//     }
//   }
  
//   getFromCamera1() async {
//     // ignore: deprecated_member_use
//     PickedFile pickedFile = await ImagePicker().getImage(
//       source: ImageSource.camera,
//       //  maxHeight: 100,    maxWidth: 100
//     );
//     if (pickedFile != null) {
//       setState(() {
//         image = File(pickedFile.path);
//       });
//     }
//   }

//   getFromGallery1() async {
//     // ignore: deprecated_member_use
//     PickedFile pickedFile = await ImagePicker().getImage(
//       source: ImageSource.gallery,
//       // maxHeight: 100,             maxWidth: 100
//     );
//     if (pickedFile != null) {
//       setState(() {
//         image = File(pickedFile.path);
//       });
//     }
//   }

// void interiordesign(context) {
//     showModalBottomSheet(
//         context: context,
//         builder: (BuildContext bc) {
//           return SafeArea(
//             child: Container(
//               child: new Wrap(
//                 children: <Widget>[
//                   new ListTile(
//                       leading: new Icon(Icons.photo_camera),
//                       title: new Text('Camera'),
//                       onTap: () {
//                         getFromCamera1();
//                         Navigator.of(context).pop();
//                       }),
//                   new ListTile(
//                     leading: new Icon(Icons.photo_library),
//                     title: new Text('Photo library'),
//                     onTap: () {
//                       getFromGallery1()();
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
  // }

  // void _showPicker(context) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (BuildContext bc) {
  //         return SafeArea(
  //           child: Container(
  //             child: new Wrap(
  //               children: <Widget>[
  //                 new ListTile(
  //                     leading: new Icon(Icons.photo_camera),
  //                     title: new Text('Camera'),
  //                     onTap: () {
  //                       _getFromCamera();
  //                       Navigator.of(context).pop();
  //                     }),
  //                 new ListTile(
  //                   leading: new Icon(Icons.photo_library),
  //                   title: new Text('Photo library'),
  //                   onTap: () {
  //                     _getFromGallery();
  //                     Navigator.of(context).pop();
  //                   },
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }

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
      builder: (BuildContext context){
        return alert;
      },
    );
  }

  void  _loginButtonAction( String EmployeeName,
      EmployeeId,
      EmailId,
      PhoneNumber,
       Image,
      Department,
      Designation,
      ProductName,
     ) async {
    final url = APIConstants.salesrepersentative;

    var bodyvalue =
        // json.encode(
        {
      'EmployeeName': EmployeeName,
      'EmployeeId': EmployeeId,
      'EmailId': EmailId,
      'PhoneNumber': PhoneNumber,
      'Image': Image,
      'Department': Department,
      'Designation': Designation,
      'ProductName': ProductName,
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
      Navigator.push(context, MaterialPageRoute(builder: (context) => Salesreperstative()));
      // replacePage(context, Login());
    } else {
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
        context, MaterialPageRoute(builder: (context) => Salesreperstative()));
  }
}
