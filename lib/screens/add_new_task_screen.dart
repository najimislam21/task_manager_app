import 'package:flutter/material.dart';
import '../controller/auth_controller.dart';
import '../data/model/api_response.dart';
import '../data/model/user_model.dart';
import '../data/service/api_caller.dart';
import '../utils/urls.dart';
import '../widget/screen_bg.dart';
import 'main_nav_screen.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Future<void> createTask() async {
    final ApiResponse response = await ApiCaller.PostRequest(
      url: TMUrls.createTaskURl,
      body: {
        "title": titleController.text,
        "description": descriptionController.text,
        "status": "New",
      },
    );
    if (response.isSuccess) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainNavScreen()),
      );
      ScaffoldMessenger.of(context,).showSnackBar(SnackBar(content: Text('Sign In success...//')));
    } else {
      ScaffoldMessenger.of(context,).showSnackBar(SnackBar(content: Text(response.responseDate['data'])));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBG(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 250),
              Text(
                'Add New Task',
                style: Theme.of(context).textTheme.titleLarge,
              ),

              SizedBox(height: 26),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(hintText: 'Title'),
              ),
              SizedBox(height: 12),
              TextFormField(
                maxLines: 6,
                controller: descriptionController,
                decoration: InputDecoration(hintText: 'Description'),
              ),
              SizedBox(height: 20),

              FilledButton(
                onPressed: () {
                  createTask();
                },
                child: Icon(Icons.arrow_circle_right_outlined, size: 25),
              ),
              SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }
}
