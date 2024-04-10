import 'package:api_flutter/pages/api/api.dart';
import 'package:api_flutter/pages/utils/utensils.dart';
import 'package:flutter/material.dart';

class EditTodo extends StatefulWidget {
  const EditTodo({super.key});

  @override
  State<EditTodo> createState() => _EditTodoState();
}

class _EditTodoState extends State<EditTodo> {
  @override
  Widget build(BuildContext context) {
    final routesArguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String title = routesArguments["title"].toString();
    String description = routesArguments["description"].toString();
    String id = routesArguments["id"].toString();
    final titleController = TextEditingController(text: title);
    final descriptionController = TextEditingController(text: description);
    return Scaffold(
      appBar: appBarWidget("Add Todo's"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            textField("Enter the title", Icons.title, 1, titleController),
            const SizedBox(height: 10.0),
            textField("Enter the description", Icons.description, 4,
                descriptionController),
            const SizedBox(height: 10.0),
            SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.6,
                height: MediaQuery.sizeOf(context).height * 0.05,
                child: OutlinedButton(
                    onPressed: () {
                      updateTodo(titleController.text,
                              descriptionController.text, id, context)
                          .then((value) {
                        Navigator.pushReplacementNamed(context, '/mainpage');
                      });
                    },
                    child: const Text("Edit")))
          ],
        ),
      ),
    );
  }
}
