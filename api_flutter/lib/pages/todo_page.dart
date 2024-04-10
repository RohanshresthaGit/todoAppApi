import 'dart:convert';

import 'package:api_flutter/pages/api/api.dart';
import 'package:api_flutter/pages/utils/styles/text_styles.dart';
import 'package:api_flutter/pages/utils/utensils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List todos = [];

  @override
  void initState() {
    getTodo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var empty = todos.isEmpty;
    return Scaffold(
      appBar: appBarWidget("Your Todo's"),
      body: Visibility(
        visible: todos.isNotEmpty,
        replacement: const Center(
            child: Text(
          "No Todo's Yet",
          style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
        )),
        child: RefreshIndicator(
          onRefresh: getTodo,
          child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text("${index + 1}"),
                  ),
                  title: Text(
                    "${todos[index]['title']}",
                    style: titleStyle(),
                  ),
                  subtitle: Text(
                    "${todos[index]["description"]}",
                    style: descriptionStyle(),
                  ),
                  trailing: PopupMenuButton(
                    color: Colors.deepPurple.shade300,
                    onSelected: (value) async {
                      if (value == "Edit") {
                        Navigator.pushNamed(context, "/editpage", arguments: {
                          'title': todos[index]['title'],
                          'description': todos[index]['description'],
                          "id": todos[index]['_id']
                        });
                      } else {
                        deleteTodo(todos[index]['_id'], context)
                            .then((value) => getTodo());
                      }
                    },
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          value: "Edit",
                          child: Text(
                            "Edit",
                            style: popUpMenuStyle(),
                          ),
                        ),
                        PopupMenuItem(
                          value: "Delete",
                          child: Text(
                            "Delete",
                            style: popUpMenuStyle(),
                          ),
                        ),
                      ];
                    },
                  ),
                );
              }),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/homepage");
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> getTodo() async {
    final response = await http
        .get(Uri.parse("https://api.nstack.in/v1/todos?page=1&limit=10"));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body.toString());
      final jsondata = data['items'];
      setState(() {
        todos = jsondata;
      });
    } else {
      print("exception");
    }
  }
}
