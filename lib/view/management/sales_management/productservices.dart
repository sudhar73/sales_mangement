import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sales/utils/texts.dart';
import 'package:sales/view/management/sales_management/Quationtracker.dart';
import 'package:sales/view/management/sales_management/allsalesorder.dart';
import 'package:sales/view/management/sales_management/customerservices.dart';
import 'package:sales/view/management/sales_management/lead_genration.dart';
import 'package:sales/view/management/sales_management/leadsummary.dart';
import 'package:sales/view/management/sales_management/sales_flowup.dart';
import 'package:sales/view/management/sales_management/salesrepersentative.dart';
import 'package:sales/view/management/sales_management/services_sales.dart';
import 'package:sales/view/management/sales_management/settings/mainproductgroup.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class Productservice extends StatefulWidget {
  const Productservice({ Key? key }) : super(key: key);

  @override
  _ProductserviceState createState() => _ProductserviceState();
}

class _ProductserviceState extends State<Productservice> {
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
              children: [
                Container(
                    height: 60,
                    width: 150,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: HexColor("#023781"),
                        onPressed: () {},
                        child: Text("Product",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)))),
                SizedBox(width: 10),
                Container(
                    height: 60,
                    width: 150,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: HexColor("#172B4D"), width: 1),
                            borderRadius: BorderRadius.circular(15)),
                        color: Colors.white,
                        onPressed: () {
Get.to(Service());
                        },
                        child: Text("Services",
                            style: TextStyle(
                                color: HexColor("#023781"), fontSize: 18))))
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



//  Row(
//    mainAxisAlignment: MainAxisAlignment.spaceAround,
//    children: [
//      Padding(
//                      padding: const EdgeInsets.all(10.0),
//                      child: Center(
//                        child: Container(
//                          height:50,

//                          width:120,
//                          child: RaisedButton(
//                            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//                            onPressed:(){
//                              Get.to(AnnouceDetails());
//                            },
//                          color:HexColor("#023781"),
//                           child:Row(
//                            children: [
//                              Icon(Icons.arrow_left,color:Colors.white),
//                              Text("Previous",style:TextStyle(color:Colors.white,fontSize:15)),
//                            ],
//                          ) )),
//                      ),
//                    ),
//                     Padding(
//                      padding: const EdgeInsets.all(10.0),
//                      child: Center(
//                        child: Container(
//                          height:50,
//                          width:120,
//                          child: RaisedButton(
//                            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//                            onPressed:(){
//                              Get.to(Basic());
//                            },
//                          color:HexColor("#023781"),
//                           child:Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                            children: [
//                              Text("Next",style:TextStyle(color:Colors.white,fontSize:16)),
                             
//                              Icon(Icons.arrow_right,color:Colors.white),
//                            ],
//                          ) )),
//                      ),
//                    ),
//    ],
//  ),
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
      title:  Center(child: Text('Product',style:Texts.primary1bigbold())),
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

    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
      final TextEditingController textcontroler = TextEditingController();

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
    key: _formkey,
     child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
        
                         Padding(
                          padding: const EdgeInsets.only(left:8,right:8,top:10),
                          child: Text("Product Group",style:Texts.primary2a()),
                        ),   Padding(
                        padding: const EdgeInsets.symmetric(horizontal:2.0,vertical: 2.0),
                        child: Card(
                          shadowColor: Colors.grey,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          child: Container(
                                 margin:EdgeInsets.only( left: 10, right: 10),
                            child :TypeAheadFormField(
                              validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return "Services Group is required";
                                    }
                                    return null;
                                  },
                                  onSaved: (String? address) {
                                    //signupmodel.address = address;
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
                        hintText: "Select Lead ID",
                        
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                      ),
                  controller: this.textcontroler,
                ),
              ),))),
                    Padding(
                          padding: const EdgeInsets.only(left:8,right:8,top:10),
                          child: Text("Product Name",style:Texts.primary2a()),
                        ),
                            Padding(
                          padding: const EdgeInsets.symmetric(horizontal:8.0),
                          child: Card(
                            shadowColor: Colors.grey,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Container(child:TextFormField(decoration: Texts.Textfeild1(),
                            validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return "Product Name is required";
                                    }
                                    return null;
                                  },
                                  onSaved: (String? address) {
                                   // signupmodel.address = address;
                                  },))),
                        ),
                         Padding(
                          padding: const EdgeInsets.only(left:8,right:8,top:10),
                          child: Text("Product Code",style:Texts.primary2a()),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:8.0),
                          child: Card(
                            shadowColor: Colors.grey,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Container(child:TextFormField(decoration: Texts.Textfeild1(),
                            validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return "Product Code is required";
                                    }
                                    return null;
                                  },
                                  onSaved: (String? address) {
                                   // signupmodel.address = address;
                                  },))),
                        ),
                         Padding(
                          padding: const EdgeInsets.only(left:8,right:8,top:10),
                          child: Text("Unit of Measurement(UOM)",style:Texts.primary2a()),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:8.0),
                          child: Card(
                            shadowColor: Colors.grey,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Container(child:TextFormField(decoration: Texts.Textfeild1(),
                            // validator: (String? value) {
                            //         if (value!.isEmpty) {
                            //           return "Please enter UOM";
                            //         }
                            //         return null;
                            //       },
                            //       onSaved: (String? address) {
                            //        // signupmodel.address = address;
                            //       },
                                  ))),
                        ),
                         Padding(
                          padding: const EdgeInsets.only(left:8,right:8,top:10),
                          child: Text("Unit Price",style:Texts.primary2a()),
                        ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal:8.0),
                          child: Card(
                            shadowColor: Colors.grey,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Container(child:TextFormField(decoration: Texts.Textfeild1(),
                            // validator: (String? value) {
                            //         if (value!.isEmpty) {
                            //           return "Please enter unit price";
                            //         }
                            //         return null;
                            //       },
                            //       onSaved: (String? address) {
                            //         //signupmodel.address = address;
                            //       },
                                  ))),
                        ),
                          Padding(
                          padding: const EdgeInsets.only(left:8,right:8,top:10),
                          child: Text("Description",style:Texts.primary2a()),
                        ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal:8.0),
                          child: Card(
                            shadowColor: Colors.grey,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Container(child:TextFormField(
                              maxLength: 5,
                              decoration: Texts.Textfeild1(),
                            // validator: (String? value) {
                            //         if (value!.isEmpty) {
                            //           return "Please enter the description";
                            //         }
                            //         return null;
                            //       },
                            //       onSaved: (String? address) {
                            //         //signupmodel.address = address;
                            //       },
                                  ))),
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
              if(_formkey.currentState!.validate()) { Get.to(Salefollowup());}
             
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
}