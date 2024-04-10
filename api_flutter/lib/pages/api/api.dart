import 'dart:convert';

import 'package:api_flutter/pages/utils/utensils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future postTodo(String title, String description, BuildContext context) async {
  final response = await http.post(Uri.parse("https://api.nstack.in/v1/todos"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
          {"title": title, "description": description, "is_completed": false}));
  if (response.statusCode == 201) {
    successSnackbar("Todo Added Successfully", context);
    return;
  } else {
    errorSnackbar("Something Went Wrong", context);
  }
  return;
}

Future updateTodo(
    String title, String description, String sId, BuildContext context) async {
  final response = await http.put(
      Uri.parse("https://api.nstack.in/v1/todos/$sId"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
          {"title": title, "description": description, "is_completed": false}));
  if (response.statusCode == 200) {
    successSnackbar("Todo Updated Successfully", context);
  } else {
    errorSnackbar("Something Went Wrong", context);
  }
}

Future<void> deleteTodo(String id, BuildContext context) async {
  final response =
      await http.delete(Uri.parse('https://api.nstack.in/v1/todos/$id'));
  if (response.statusCode == 200) {
    successSnackbar("Deleted successfully", context);
  } else {
    errorSnackbar("Something went wrong", context);
  }
}
