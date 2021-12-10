import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sales/utils/texts.dart';


class Homepage extends StatefulWidget {
  const Homepage({ Key? key }) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        elevation: 0,
        backgroundColor:HexColor("#172B4D"),
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
      body: Container(
        child:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
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
              Container(child:Text("Dashboard",style:Texts.primary1a())),
             card(),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Card(
                  elevation: 5,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                 child: Container( height: Get.height/5,
                    width:Get.width,
                    child:Column(children: [
                       Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(children: [
                          Text("New Sales",style:Texts.primary1b()),
                          Spacer(),
                          Container(
                            
                  width: 90,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text("56",style:Texts.primary1b()),
                                ),
                                
                 
                                Icon(Icons.arrow_drop_up,color:HexColor("#FDAC41"),size: 50,),
                              
                              ],
                            ))
                        ],),

                      ),
                    ],)
                    )),
             ),

  Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
                        elevation: 5,
                        shadowColor: Colors.grey,
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        child: Container(
                          height:115,
                          width:Get.width/3.5,
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                       Text("New Sales",style:Texts.primary1b()),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text("56",style:Texts.primary1c())),
                                Container(child:Icon(Icons.arrow_drop_up,color:HexColor("#FDAC41"),size: 40,))
                              ],
                            ),
                        Container(
            alignment: Alignment.topCenter,
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey,
              color:HexColor("#FDAC41"),
              strokeWidth: 5,
            )
        )
                        
                          ],)),
                      ),
                    ),
                        Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
                        elevation: 5,
                        shadowColor: Colors.grey,
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        child: Container(
                          height:115,
                          width:Get.width/3.5,
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                       Text("Event Held",style:Texts.primary1b()),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text("856",style:Texts.primary1c())),
                                Container(child:Icon(Icons.arrow_drop_up,color:HexColor("#FF5B5C"),size: 40,))
                              ],
                            ),
                        Container(
            alignment: Alignment.topCenter,
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey,
              color:HexColor("#FF5B5C"),
              strokeWidth: 5,
            )
        )
                        
                          ],)),
                      ),
                    ),
                        Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
                        elevation: 5,
                        shadowColor: Colors.grey,
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        child: Container(
                          height:115,
                          width:Get.width/3.5,
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                       Text("Event Held",style:Texts.primary1b()),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text("856",style:Texts.primary1c())),
                                Container(child:Icon(Icons.arrow_drop_up,color:HexColor("#FDAC41"),size: 40,))
                              ],
                            ),
                        Container(
            alignment: Alignment.topCenter,
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey,
              color:HexColor("#FDAC41"),
              strokeWidth: 5,
            )
        )
                        
                          ],)),
                      ),
                    ),
                  ],)),
                ),

details(),
// Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Table(
                 
//             // textDirection: TextDirection.rtl,
//             // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
//             // border:TableBorder.all(width: 2.0,color: Colors.red),
//             children: [
//               TableRow(
//                 children: [
//                   Text("#0012451"),
//                   Text("04/08/2020"),
//                   Text("Elisabeth Queen"),
//                    Text("Medan, Indonesia"),
                  
//                 ]
//               ),
//                TableRow(
//                 children: [
//                   Text("#0012451",textScaleFactor: 1.5,),
//                   Text("04/08/2020",textScaleFactor: 1.5),
//                   Text("Elisabeth Queen",textScaleFactor: 1.5),
//                    Text("Medan, Indonesia",textScaleFactor: 1.5),
//                 ]
//               ),
//               TableRow(
//                 children: [
//                   Text("#0012451",textScaleFactor: 1.5,),
//                   Text("04/08/2020",textScaleFactor: 1.5),
//                   Text("Elisabeth Queen",textScaleFactor: 1.5),
//                    Text("Medan, Indonesia",textScaleFactor: 1.5),]
//               ),
//               TableRow(
//                 children: [
//                    Text("#0012451",textScaleFactor: 1.5,),
//                   Text("04/08/2020",textScaleFactor: 1.5),
//                   Text("Elisabeth Queen",textScaleFactor: 1.5),
//                    Text("Medan, Indonesia",textScaleFactor: 1.5),
//                 ]
//               ),
//             ],
//         ),)
            ],),
          ),)),
    );
  }

  card(){
    return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Container(
                  height: Get.height/1.66,
                  width:Get.width,
                  color:Colors.white,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(children: [
                        Text("Best Selling",style:Texts.primary1bbold()),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(border: Border.all(
                    width: 1, 
                    color: Colors.grey
                ),
                borderRadius: BorderRadius.circular(10)),
                width: 130,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text("This week",style:Texts.primary1b()),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(Icons.arrow_drop_down),
                              )
                            ],
                          ))
                      ],),

                    ),
                    Container(child:Image(image:AssetImage("assets/Circle.png"))),
                    Container(child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(Icons.circle_outlined,color:HexColor("#FEB468")),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Ticket Left",style: Texts.primary2a(),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("21,512",style: Texts.primary2a(),),
                      ),
                    ],)),
                      Container(child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(Icons.circle_outlined,color:HexColor("#776AF1")),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Ticket Sold",style: Texts.primary2a(),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("45,612",style: Texts.primary2a(),),
                      ),
                    ],)),
                     Container(child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(Icons.circle_outlined,color:HexColor("#EF7677")),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Event Held",style: Texts.primary2a(),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("27,555",style: Texts.primary2a(),),
                      ),
                    ],))
                  ],),)),
            );
  }
  details(){
    return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Container(
                  
                  width:Get.width,
                  color:Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(children: [
                        Text("Best Selling",style:Texts.primary1bbold()),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(border: Border.all(
                    width: 1, 
                    color: Colors.grey
                ),
                borderRadius: BorderRadius.circular(10)),
                width: 130,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text("This week",style:Texts.primary1b()),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(Icons.arrow_drop_down),
                              )
                            ],
                          ))
                      ],),

                    ),
   Padding(
     padding: const EdgeInsets.all(8.0),
     child: Container(child:Column(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
Padding(
  padding: const EdgeInsets.all(4.0),
  child:   Text("The Story’s of Danau Toba ",style:Texts.primary1b()),
),
Padding(
  padding: const EdgeInsets.all(4.0),
  child:   Text("(Drama Theater)",style:Texts.primary1b()),
),
ListTile(
            title: Text("Steffany Humble"),
            subtitle: Text("2m ago"),
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person,color: Colors.black,)),
            trailing:Container(height:30,width:100,
            child:RaisedButton(shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: (){},
            color:Colors.grey,
            child:Text("4 Ticket",style:TextStyle(color: Colors.white))))
          ),
          Divider()
     ],)),
   ),
    Padding(
     padding: const EdgeInsets.all(8.0),
     child: Container(child:Column(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
Padding(
  padding: const EdgeInsets.all(4.0),
  child:   Text("The Story’s of Danau Toba ",style:Texts.primary1b()),
),
Padding(
  padding: const EdgeInsets.all(4.0),
  child:   Text("(Drama Theater)",style:Texts.primary1b()),
),
ListTile(
            title: Text("Steffany Humble"),
            subtitle: Text("2m ago"),
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person,color: Colors.black,)),
            trailing:Container(height:30,width:100,
            child:RaisedButton(shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: (){},
            color:Colors.grey,
            child:Text("4 Ticket",style:TextStyle(color: Colors.white))))
          ),
          Divider()
     ],)),
   ),
    Padding(
     padding: const EdgeInsets.all(8.0),
     child: Container(child:Column(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
Padding(
  padding: const EdgeInsets.all(4.0),
  child:   Text("The Story’s of Danau Toba ",style:Texts.primary1b()),
),
Padding(
  padding: const EdgeInsets.all(4.0),
  child:   Text("(Drama Theater)",style:Texts.primary1b()),
),
ListTile(
            title: Text("Steffany Humble"),
            subtitle: Text("2m ago"),
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person,color: Colors.black,)),
            trailing:Container(height:30,width:100,
            child:RaisedButton(shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: (){},
            color:Colors.grey,
            child:Text("4 Ticket",style:TextStyle(color: Colors.white))))
          ),
          Divider()
     ],)),
   ),
                   
                   
                  
                  ],),)),
            );
  }
}