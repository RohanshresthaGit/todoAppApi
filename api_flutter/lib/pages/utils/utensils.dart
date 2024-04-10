import 'package:api_flutter/pages/utils/constants.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget? appBarWidget(title) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(color: white),
    ),
    backgroundColor: Colors.deepPurple,
    centerTitle: true,
  );
}

Widget textField(String hintText, IconData icon, int lines,
    TextEditingController controller) {
  return TextField(
      controller: controller,
      maxLines: lines,
      decoration: InputDecoration(
        label: Text(hintText),
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ));
}

      
void successSnackbar(String message,BuildContext context) {
  final snack = SnackBar(
    duration: const Duration(seconds: 3),
    content: Text(message),
    backgroundColor: deepPurpleshade,
  );
  ScaffoldMessenger.of(context).showSnackBar(snack);
}

void errorSnackbar(String message,BuildContext context) {
  final snack = SnackBar(
    duration: const Duration(seconds: 3),
    content: Text(
      message,
      style: TextStyle(color: white),
    ),
    backgroundColor: red,
  );
  ScaffoldMessenger.of(context).showSnackBar(snack);
}
  
