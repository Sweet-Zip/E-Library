import 'package:flutter/material.dart';
import 'package:mobile/screen/item_main_screen.dart';

import '../models/user_model.dart';
import '../services/user_service.dart';

class UserLogic with ChangeNotifier {
  List<UserModel>? _userList;

  List<UserModel>? get userList => _userList;

  String? _authenticatedUsername;

  String? get authenticatedUsername => _authenticatedUsername;

  set authenticatedUsername(String? username) {
    _authenticatedUsername = username;
    notifyListeners(); // Notify listeners to trigger updates
  }

  Future<void> loginUser({
    required BuildContext context, // Add a BuildContext parameter
    required String email,
    required String password,
  }) async {
    await UserService.readUser(
      email: email,
      password: password,
      onResult: (List<UserModel>? users) {
        if (users != null && users.isNotEmpty) {
          // Authentication successful, update user list
          print('First user: ${users[0].username}');
          _userList = users;
          _authenticatedUsername = users[0].username;
          print('Authenticated username: $_authenticatedUsername');
          notifyListeners();
          // Navigate to the new screen upon successful authentication
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => ItemMainScreen(),
            ),
          );
        } else {
          // Authentication failed, handle the error
          print('Authentication failed');
        }
      },
      onReject: (String? error) {
        // Handle network or server errors
        if (error != null) {
          print('Network error: $error');
        }
      },
    );
  }
}
