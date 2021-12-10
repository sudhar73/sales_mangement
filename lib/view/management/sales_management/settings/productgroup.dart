import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sales/utils/texts.dart';
import 'package:sales/view/management/sales_management/leadsummary.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
class Productgroup extends StatefulWidget {
  const Productgroup({ Key? key }) : super(key: key);

  @override
  _ProductgroupState createState() => _ProductgroupState();
}

class _ProductgroupState extends State<Productgroup> {
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
        body:Container(
            child:SingleChildScrollView(
                child:Column(
                  children: [
// ignore: avoid_unnecessary_containers

                    SizedBox(height:5),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:13,right:8,top:10),
                          child: Text("Product Group",style:Texts.primary2a()),
                        ),
                        Row(
                          children: [
                            Container(width:Get.width/1.4,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal:5.0),
                                child: Card(
                                    shadowColor: Colors.grey,
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                    child: Container(child:TextField(decoration: Texts.Textfeild1(),))),
                              ),
                            ),
                            Container(

                              child: Padding(
                                padding: const EdgeInsets.only(right:8.0),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                      height:40,
                                      width:90,
                                      child: RaisedButton(
                                          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                          onPressed:(){ },
                                          color:HexColor("#023781"),
                                          child:Text("Save",style:TextStyle(color:Colors.white,fontSize:16)) )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height:10),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,top: 20,bottom: 15,right: 25),
                      child:   Card(
                        elevation: 5,
                        shadowColor: Colors.grey,
                        child: Container(

                          child: Center(
                            child: SfDataGridTheme(

                              data: SfDataGridThemeData(
                                gridLineColor: Colors.grey,
                                // rowHoverColor: HexColor("#7C8EB2"),
                                // rowHoverTextStyle: TextStyle(
                                // color: Colors.white,
                                // fontSize: 14,),
                                sortIconColor: Colors.white,

                                headerHoverColor: Colors.blue,
                                headerColor: HexColor("#023781"),),
                              child: SfDataGrid(
                                selectionMode: SelectionMode.multiple,

                                frozenColumnsCount: 0,
                                allowSorting: true,
                                allowEditing: true,
                                allowPullToRefresh: true,
                                showCheckboxColumn: true,
                                gridLinesVisibility: GridLinesVisibility.vertical,
                                headerGridLinesVisibility: GridLinesVisibility.vertical,
                                source: employeeDataSource,
                                columns: <GridColumn>[
                                  GridColumn(
                                    width: 80,
                                      columnName: 'id',
                                      label: Container(
                                          color: HexColor("#023781"),
                                          padding: EdgeInsets.all(8.0),
                                          alignment: Alignment.center,
                                          child: Text('SI NO',style:Texts.whit1e(),textAlign: TextAlign.center,))),

                                  GridColumn(
                                    width: 120,
                                      columnName: 'productgroup',
                                      label: Container(
                                          color: HexColor("#023781"),
                                          padding: EdgeInsets.all(8.0),
                                          alignment: Alignment.center,
                                          child: Text('Product Group',style:Texts.whit1e(),textAlign: TextAlign.center,))),
                                  GridColumn(
                                      columnName: 'action',
                                      label: Container(
                                          color: HexColor("#023781"),
                                          padding: EdgeInsets.all(1.0),
                                          alignment: Alignment.center,
                                          child: Text('action',style:Texts.whit1e(),textAlign: TextAlign.center,)
                                      )),


                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height:10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Container(
                                height:50,
                                width:120,
                                child: RaisedButton(
                                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                    onPressed:(){

                                    },
                                    color:HexColor("#023781"),
                                    child:Row(
                                      children: [
                                        Icon(Icons.arrow_left,color:Colors.white),
                                        Text("Previous",style:TextStyle(color:Colors.white,fontSize:15)),
                                      ],
                                    ) )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Container(
                                height:50,
                                width:120,
                                child: RaisedButton(
                                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                    onPressed:(){

                                    },
                                    color:HexColor("#023781"),
                                    child:Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("Next",style:TextStyle(color:Colors.white,fontSize:16)),
                                        Icon(Icons.arrow_right,color:Colors.white),
                                      ],)
                                )),
                          ),
                        ),
                      ],),
                  ],)
            ))
    );

  }


  List<Employee> getEmployeeData() {


    return [
      Employee(1,'Name 01',''),
      Employee(2,'Name 02',''),
      Employee(3,'Name 03',''),
      Employee(4,'Name 04',''),
      Employee(5,'Name 05',''),
    ];
  }
}
class Employee {
  /// Creates the employee class with required details.
  Employee(this.id,this.productgroup, this.action,);

  /// Id of an employee.
  //final int id;

  /// Name of an employee.

  final int id;
  final String productgroup;

  /// Designation of an employee.
  final String action;




}

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({required List<Employee> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [

      DataGridCell<int>(columnName: 'id', value: e.id),
      DataGridCell<String>(columnName: 'name', value: e.productgroup),
      DataGridCell<String>(columnName: 'designation', value: e.action),

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
        return Colors.grey[100]!;
      }
    }

      return DataGridRowAdapter(
          color: backgroundcolor(),
          cells: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(row.getCells()[0].value.toString()),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(row.getCells()[1].value),
        ),

        Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child:  Row(children: [
              IconButton(
                onPressed: () {
                  print("inside the icon");
                },

                icon: Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 15,

                ),
              ),
              //Text(row.getCells()[3].value)
            ],)
        )
      ]);
    }
  }




