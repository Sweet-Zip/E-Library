import 'package:flutter/material.dart';
import 'package:mobile/component/custom_button.dart';
import 'package:mobile/component/custom_textFormField.dart';
import 'package:mobile/screen/forgot_pass_screen.dart';
import 'package:mobile/screen/item_main_screen.dart';
import 'package:mobile/screen/register_screen.dart';

import '../logic/UserLogic.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String _errorMessage = '';

  bool isEmailValid(String email) {
    // Regular expression pattern for a basic email validation
    final RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegex.hasMatch(email);
  }

  UserLogic userLogic = UserLogic();

  Widget _buildTextField() {
    return Column(
      children: [
        CustomTextField(
          hintText: 'Email',
          obscureText: false,
          controller: emailController,
          validValue: 'Please input valid email',
        ),
        const SizedBox(
          height: 15,
        ),
        CustomTextField(
          hintText: 'Password',
          obscureText: true,
          controller: passwordController,
          validValue: 'Please input valid password',
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 150),
          Image.network(
              "https://cdn.freefontsvault.com/2023/09/OnlyFans-new-logo-2021.webp",
              height: 50),
          const SizedBox(height: 25),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Sign in",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          _buildTextField(),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildForgotPass(),
              ],
            ),
          ),
          const SizedBox(height: 25),
          if (_errorMessage.isNotEmpty) // Show error message if it's not empty
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _errorMessage,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          GestureDetector(
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                String email = emailController.text;
                String password = passwordController.text;
                if (isEmailValid(email)) {
                  // Email is valid
                  await userLogic.loginUserWithNewId(
                    context: context, // Pass the BuildContext
                    email: email,
                    password: password,
                  );
                } else {
                  // Email is not valid
                  setState(() {
                    _errorMessage =
                        'Email is not valid'; // Set the error message
                  });
                }
              }
            },
            child: const CustomButton(
              textString: 'Sign In',
            ),
          ),
          const SizedBox(height: 50),
          _buildRegisterBtn(),
        ],
      ),
    );
  }

  Widget _buildForgotPass() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ForgotPassScreen(),
          ),
        );
      },
      child: const Text(
        "Forgot Password?",
        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildRegisterBtn() {
    _handleClick() {
      //Navigator.pop(context); //Kill screen

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => RegisterScreen(),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have any account? ",
          style: TextStyle(color: Colors.grey),
        ),
        GestureDetector(
          onTap: _handleClick,
          child: const Text(
            "Sign Up",
            style: TextStyle(
                color: Color(0xff008CCF), fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
