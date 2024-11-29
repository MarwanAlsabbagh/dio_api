import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../model/employee_model.dart';

class HomeController extends GetxController {
  final dio = Dio();
  final _baseUrl = 'https://reqres.in/api';

  var users = <EmployeeModel>[].obs;
  var isLoading = false.obs;

  Future<void> getUsers() async {
    try {
      isLoading.value = true;
      final response = await dio.get('$_baseUrl/users');
      if (response.statusCode == 200) {
        var data = response.data['data'] as List;
        users.value = data.map((e) => EmployeeModel.fromJson(e)).toList();
      } else {
        Get.snackbar('Error', 'Failed to fetch users');
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> createUser(String name, String job) async {
    try {
      isLoading.value = true;
      final response = await dio.post(
        '$_baseUrl/users',
        data: {'name': name, 'job': job},
      );

      if (response.statusCode == 201) {
        Get.snackbar('Success', 'User created successfully');
        print("User Created: ${response.data}");
      } else {
        Get.snackbar('Error', 'Failed to create user');
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateUser(int userId, String name, String job) async {
    try {
      isLoading.value = true;
      final response = await dio.put(
        '$_baseUrl/users/$userId',
        data: {'name': name, 'job': job},
      );

      if (response.statusCode == 200) {
        Get.snackbar('success', 'User updated successfully');
        print("User Updated: ${response.data}");
      } else {
        Get.snackbar('Error', 'Failed to update user');
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong');
    } finally {
      isLoading.value = false;
    }
  }
}
