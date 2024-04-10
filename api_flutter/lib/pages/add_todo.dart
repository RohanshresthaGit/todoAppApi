import 'package:api_flutter/pages/api/api.dart';
import 'package:api_flutter/pages/todo_page.dart';
import 'package:api_flutter/pages/utils/utensils.dart';
import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController tittleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("Add Todo's"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            textField("Enter the title", Icons.title, 1, tittleController),
            const SizedBox(height: 10.0),
            textField("Enter the description", Icons.description, 4,
                descriptionController),
            const SizedBox(height: 10.0),
            SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.6,
                height: MediaQuery.sizeOf(context).height * 0.05,
                child: OutlinedButton(
                    onPressed: () {
                      postTodo(tittleController.text.toString(),
                              descriptionController.text.toString(), context)
                          .then((value) {
                        tittleController.clear();
                        descriptionController.clear();
                        Navigator.pushReplacementNamed(context, '/mainpage');
                      });
                    },
                    child: const Text("Submit")))
          ],
        ),
      ),
    );
  }
}
