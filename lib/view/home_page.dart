import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    homeController.getUsers();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'List of Employees',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    homeController.createUser('marwan alsabbagh', 'Developer');
                  },
                  child: const Text('Create User'),
                ),
                ElevatedButton(
                  onPressed: () {
                    homeController.updateUser(1, 'marwan alsabbagh alwesh ', 'Manager');
                  },
                  child: const Text('Update User'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
                  () {
                if (homeController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (homeController.users.isEmpty) {
                  return const Center(child: Text('No employees found.'));
                }

                return ListView.builder(
                  itemCount: homeController.users.length,
                  itemBuilder: (context, index) {
                    final employee = homeController.users[index];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(employee.avatar),
                        ),
                        title: Text('${employee.firstName} ${employee.lastName}'),
                        subtitle: Text(employee.email),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
