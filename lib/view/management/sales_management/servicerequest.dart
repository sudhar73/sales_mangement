import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sales/utils/texts.dart';
import 'package:sales/view/management/sales_management/customerservices.dart';
import 'package:sales/view/management/sales_management/salesrepersentative.dart';
import 'package:sales/view/management/sales_management/settings/mainproductgroup.dart';
import 'package:sales/view/management/sales_management/settings/productgroup.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
class Servicerequest extends StatefulWidget {
  const Servicerequest({ Key? key }) : super(key: key);

  @override
  _ServicerequestState createState() => _ServicerequestState();
}

class _ServicerequestState extends State<Servicerequest> {
 List<Employee> employees = <Employee>[];
  late EmployeeDataSource employeeDataSource;

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
SizedBox(height:10),
 Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [ Container(
                    height: 60,
                    width: 150,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: HexColor("#172B4D"), width: 1),
                            borderRadius: BorderRadius.circular(15)),
                        color: Colors.white,
                        onPressed: () {
                          Get.to(Customerservices());
                        },
                        child: Text("New Request",
                            style: TextStyle(
                                color: HexColor("#023781"), fontSize: 16)))),
                                SizedBox(width:10),
                                Container(
                    height: 60,
                    width: 150,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: HexColor("#023781"),
                        onPressed: () {},
                        child: Text("Service Request",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)))),
                SizedBox(width: 10),
              ],
            ),
Align(
  alignment: Alignment.centerRight,
  child:   Padding(
            padding: const EdgeInsets.all(10.0),
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
SizedBox(height:15),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
        Padding(padding: const EdgeInsets.all(3.0),
                     child: Center(
                       child: Container(
                         height:50,
                         width:Get.width/4.5,
                         child: RaisedButton(
                           shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    
                           onPressed:(){
                            
                           },
                         color:HexColor("#7D7D7D"),
    child: Text("Copy",style:TextStyle(color:Colors.white,fontSize:16)),
                           )),
                     ),
                   ),
                    Padding(padding: const EdgeInsets.all(3.0),
                     child: Center(
                       child: Container(
                         height:50,
                         width:Get.width/4.5,
                         child: RaisedButton(
                           shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    
                           onPressed:(){
                         
                           },
                         color:HexColor("#7D7D7D"),
    child: Text("Excel",style:TextStyle(color:Colors.white,fontSize:16)),
                           )),
                     ),
                   ),
                    Padding(padding: const EdgeInsets.all(3.0),
                     child: Center(
                       child: Container(
                         height:50,
                          width:Get.width/4.5,
                         child: RaisedButton(
                           shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    
                           onPressed:(){
                     
                           },
                         color:HexColor("#7D7D7D"),
    child: Text("CSV",style:TextStyle(color:Colors.white,fontSize:16)),
                           )),
                     ),
                   ),
                    Padding(padding: const EdgeInsets.all(3.0),
                     child: Center(
                       child: Container(
                         height:50,
                          width:Get.width/4.5,
                         child: RaisedButton(
                           shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    
                           onPressed:(){
          
                           },
                         color:HexColor("#7D7D7D"),
    child: Text("Print",style:TextStyle(color:Colors.white,fontSize:16)),
                           )),
                     ),
                   ),
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
  child:   Card(
  
  elevation: 5,
  
  shadowColor: Colors.grey,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  
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
            headerHoverColor: Colors.yellow,
            headerColor: HexColor("#023781"),),
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
                              'S.No',style:Texts.whit1e(),
                            ))),
                    GridColumn(
                        columnName: 'name',
                        label: Container(
                          color: HexColor("#023781"),
                            padding: EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: Text('Employee Name',style:Texts.whit1e(),textAlign: TextAlign.center,))),
                    GridColumn(
                        columnName: 'designation',
                        label: Container(
                          color: HexColor("#023781"),
                            padding: EdgeInsets.all(1.0),
                            alignment: Alignment.center,
                            child: Text(
                              'Role',style:Texts.whit1e(),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ))),
                    GridColumn(
                      width: 500,
                        columnName: 'salary',
                        label: Container( 
                       
                          padding: EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: Text('Responsibilities',style:Texts.whit1e(),textAlign: TextAlign.center,))),
                  ],
                ),
        ),
      ),
    ),
  
  ),
),
SizedBox(height:10),

      ],)
      ))
    );
  }
 
  _addexit(BuildContext context) {
    // ignore: unnecessary_new
    return new AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal:12,vertical: 25),
      title:  Center(child: Text('Service Request',style:Texts.primary1bigbold())),
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
    List<Employee> getEmployeeData(){
    return [
      Employee(1,'Rajesh','CEO','CEO is the head of the organization. For Organisation Chart, addition of CEO is required'),
      Employee(2,'Ram','HR ADMIN','HR Admins permissions apply to all employees'),
      Employee(3,'Priya','HR ','View all employee profile information (Non-payroll) View sensitive employee information (such as PAN Card, IDs, DOB etc)'),
      Employee(1,'Rajesh','CEO','CEO is the head of the organization. For Organisation Chart, addition of CEO is required'),
      Employee(2,'Ram','HR ADMIN','HR Admins permissions apply to all employees'),
      Employee(3,'Priya','HR ','View all employee profile information (Non-payroll) View sensitive employee information (such as PAN Card, IDs, DOB etc)'),
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
  EmployeeDataSource({required List<Employee> employeeData}) {
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
  @override
  Widget build(BuildContext context) {
   return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
 
                      
                       Padding(
                        padding: const EdgeInsets.only(left:8,right:8,top:10),
                        child: Text("Order ID",style:Texts.primary2a()),
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
                        child: Text("Customer Name",style:Texts.primary2a()),
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
                        child: Text("Request Status",style:Texts.primary2a()),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:5.0),
                        child: Card(
                          shadowColor: Colors.grey,
      elevation: 5,
      shape: RoundedRectangleBorder(
        
        borderRadius: BorderRadius.circular(15)),
                          child:  Container(
                              
                              margin: EdgeInsets.only( left: 10, right: 10),
                              child: DropdownSearch<String>(
                                mode: Mode.MENU,
                                items: [
                                  "Active","Disable",
                        
                                ],
                               dropdownSearchDecoration: InputDecoration(
                        hintText: "Select a request",
                        
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                      ),
                      popupItemDisabled: (String s) =>
                                    s.startsWith('I'),
                                onChanged: (value) {
                                  setState(() {
                                    // signupmodel.graduted = value;
                                    print(value);
                                  });
                                },
                              ),
                            ),)),
                       Padding(
                        padding: const EdgeInsets.only(left:8,right:8,top:10),
                        child: Text("Request End Date",style:Texts.primary2a()),
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
                        child: Text("detail of Request",style:Texts.primary2a()),
                      ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal:8.0),
                        child: Card(
                          shadowColor: Colors.grey,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          child: Container(child:TextField(decoration: Texts.Textfeild1(),))),
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
            Get.to(Mainsettings());
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
    ],);
  }
}