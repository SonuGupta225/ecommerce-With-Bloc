
import 'package:flutter/material.dart';

myTextFiled({required TextEditingController controllerName,required String label, String? hint,keyboardType=TextInputType.text,
  String? suffixText,Icon? suffixIcon,String? prefixText,bool obscureText=false}){
  return Container(
    height: 65,
    width: 500,
    child: TextField(
      controller: controllerName,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        label: Text(label),hintText: hint,
        suffixText: suffixText,
        suffixIcon: suffixIcon,
        prefixText: prefixText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
mySizeBox(){
  return SizedBox(
    height: 10,
  );
}
myAppBar(String text){
  return AppBar
    (title: Text(text),
    centerTitle: true,backgroundColor: Colors.blueGrey,);
}
myPassController({required TextEditingController controllerName,required String label, String? hint,bool value=true}){
  return TextField(
    controller: controllerName,
    obscureText: value,
    decoration: InputDecoration(
        label: Text(label),hintText: hint,
        suffixIcon: InkWell(
            onTap: (){
              value==true?
              value=false:value=true;
            },
            child: Icon(Icons.remove_red_eye)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12)
        )
    ),
  );
}
myWidget(VoidCallback onTap,Widget widget,){
  return InkWell(
      onTap: onTap,
      child: widget
  );
}
myText22(String text){
  return Text(text,style: TextStyle(fontSize: 22),);
}
myText(String text){
  return Text(text,style: TextStyle(fontWeight: FontWeight.bold),);
}