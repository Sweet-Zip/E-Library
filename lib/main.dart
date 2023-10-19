import 'package:flutter/material.dart';
import 'package:mobile/logic/UserLogic.dart';
import 'package:mobile/screen/item_main_screen.dart';
import 'package:mobile/screen/login_screen.dart';
import 'package:mobile/theme/theme.dart';
import 'package:mobile/theme/themeProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  final userLogic = UserLogic(); // Create an instance of UserLogic
  await userLogic.loadUserData(); // Load user data from SharedPreferences
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserLogic()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    final userLogic = Provider.of<UserLogic>(context);
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,
      // home: userLogic.authenticatedUsername != null
      //     ? ItemMainScreen()
      //     : LoginScreen(),

      home: ItemMainScreen(),
    );
  }
}

/*
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/logic/UserLogic.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String errorMessage = '';

  Future<void> registerUser(String email, String password) async {
    final url = Uri.parse(
        'http://192.168.50.115:3000/users'); // Replace with your JSON server URL

    try {
      final response = await http.post(
        url,
        body: json.encode({'email': email, 'password': password}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 500) {
        // Authentication successful
        // You can navigate to the next screen or perform the desired action.
        print('Authentication successful');
      } else {
        // Authentication failed, display an error message.
        print('Authentication failed');
      }
    } catch (e) {
      // Handle network errors
      print('Network error: $e');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                UserLogic userLogic = UserLogic();
                await userLogic.loginUser(
                  email: emailController.text,
                  password: passwordController.text,
                );
              },
              child: const Text('Login'),
            ),
            if (errorMessage.isNotEmpty)
              Text(
                errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
*/
