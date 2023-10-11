import 'package:flutter/material.dart';
import 'package:mobile/component/custom_button.dart';
import 'package:mobile/component/custom_textFormField.dart';

import '../logic/UserLogic.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});



  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  UserLogic userLogic = UserLogic();

  Widget _buildBody() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Image.network(
            "https://cdn.freefontsvault.com/2023/09/OnlyFans-new-logo-2021.webp",
            height: 50,
          ),
          const SizedBox(
            height: 25,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Register",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
            hintText: 'Username',
            controller: usernameController,
            obscureText: false,
            validValue: 'Please input valid username',
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
            hintText: 'Email',
            controller: emailController,
            obscureText: false,
            validValue: 'Please input valid email',
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
            hintText: 'Password',
            controller: passwordController,
            obscureText: true,
            validValue: 'Please input valid password',
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
            hintText: 'Confirm password',
            controller: confirmPasswordController,
            obscureText: true,
            validValue: 'Password not match',
          ),
          const SizedBox(
            height: 25,
          ),
          GestureDetector(
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                // Validation successful, proceed with your action
                String user = emailController.text;
                String email = emailController.text;
                String password = passwordController.text;
                String confirmPass = confirmPasswordController.text;
                await userLogic.registerUser(
                  context: context,
                  username: user,
                  email: email,
                  password: password,
                );
              }
            },
            child: const CustomButton(
              textString: 'Sign Up',
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account? '),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pop(); // Navigate back to the previous screen
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff008CCF),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
