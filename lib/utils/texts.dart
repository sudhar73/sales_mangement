import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Texts{
  static double h1=32,h2 = 28, h3 = 24, h4 = 22, h5 = 20, h6 = 18,h7=17,h8=16,h9=14;
  static var bold =FontWeight.bold;
  static var normal =FontWeight.normal;
  static var colors1=HexColor("#172B4D");
  static var whitecolor=Colors.white;

static TextStyle white(){
return TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.bold);
}
static TextStyle whit1e(){
return TextStyle(color:Colors.white,fontSize: 16,fontWeight: FontWeight.normal);
}

static TextStyle primary1a(){
return TextStyle(color:HexColor("#172B4D"),fontSize: 15,fontWeight: FontWeight.normal
);
}

static TextStyle primary1b(){
return TextStyle(color:HexColor("#4D4F5C"),fontSize: 16,);

}

static TextStyle primary1bold(){
return TextStyle(color:HexColor("#023781"),fontSize: 18,);
}

static TextStyle primary1bigbold(){
return TextStyle(color:HexColor("#023781"),fontSize: 18,fontWeight: FontWeight.bold);

}
static TextStyle primary1bbold(){
return TextStyle(color:HexColor("#4D4F5C"),fontSize: 18,fontWeight: FontWeight.bold);
}
static TextStyle primary1c(){
return TextStyle(color:HexColor("#4D4F5C"),fontSize: 22,fontWeight: FontWeight.bold
);
}
static TextStyle primary1d(){
return TextStyle(color:HexColor("#172B4D"),fontSize: 18,fontWeight: FontWeight.bold
);
}
static TextStyle primary1e(){
return TextStyle(color:HexColor("#4D4F5C"),fontSize: 14,);

}
static TextStyle primary2a(){
return TextStyle(color:HexColor("#7C8EB2"),fontSize: 15,);
}

static TextStyle primary3a(){
return TextStyle(color:HexColor("#7C8EB2"),fontSize: 18,fontWeight: FontWeight.w600);
}

 static TextStyle style(size, color, weight) {
    return TextStyle(color: color, fontSize: size, fontWeight: weight);
  }
  static InputDecoration Textfeild(String hint,icon){
    return InputDecoration(
      prefixIcon:icon ,
      hintText: hint,
  
      hintStyle: TextStyle(color: HexColor("#172B4D")),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: HexColor("#F7F8F9"))),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: HexColor("#F7F8F9")))
      );
  }

   static InputDecoration Textfeild1(){
    return InputDecoration(

      hintStyle: TextStyle(color: HexColor("#172B4D")),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25),
      borderSide: BorderSide(color: Colors.transparent)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25),
      borderSide: BorderSide(color:Colors.transparent))
      );
  }
  static InputDecoration border(){
    return InputDecoration( 
      hintStyle: TextStyle(color: Colors.grey),
      );
  }


   static InputDecoration Textfeild2(label,hint,icon){
    return InputDecoration(
      
labelText: label,
      hintText: hint,
      prefixIcon: icon,
      labelStyle:TextStyle(color: HexColor("#7C8EB2"),fontSize: 18,fontWeight: FontWeight.normal),
    
      hintStyle: TextStyle(color: HexColor("#7C8EB2"),fontSize: 16),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: Colors.transparent)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color:Colors.transparent))
      );
  }

static BoxDecoration decor(color){
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(15));
}
}
