import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/user_data_structure.dart';
import '../view/user_data_view_model.dart';

class SqfliteExample extends StatelessWidget {
  SqfliteExample({super.key});

  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    String nameInput = '';

    return Obx(()=>Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(21.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Enter your name',
                    hintText: 'Type your name...',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    nameInput = value;
                  },
                  onSubmitted: (value) {
                    if (nameInput.isNotEmpty) {
            
                      userController.insertUser(User(name: nameInput, age: 25));
                      nameInput = '';
                    }
                  },
                ),
                const SizedBox(height: 20),
                Expanded(
                    child:
                     userController.users.isNotEmpty
                        ? ListView.builder(
                      itemCount: userController.users.length,
                      itemBuilder: (context, index) {
                        final user = userController.users[index];
                        return ListTile(
                          title: Text(user.name),
                          subtitle: Text('Age: ${user.age}'),
                        );
                      },
                    )
                        : const SizedBox()
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}