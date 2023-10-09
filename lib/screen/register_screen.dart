import 'package:flutter/material.dart';
import 'package:mobile/component/custom_button.dart';
import 'package:mobile/component/custom_textFormField.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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

  Widget _buildBody() {
    return Form(
      key: widget._formKey,
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
            controller: widget.usernameController,
            obscureText: false,
            validValue: 'Please input valid username',
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
            hintText: 'Email',
            controller: widget.emailController,
            obscureText: false,
            validValue: 'Please input valid email',
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
            hintText: 'Password',
            controller: widget.passwordController,
            obscureText: true,
            validValue: 'Please input valid password',
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
            hintText: 'Confirm password',
            controller: widget.confirmPasswordController,
            obscureText: true,
            validValue: 'Password not match',
          ),
          const SizedBox(
            height: 25,
          ),
          GestureDetector(
            onTap: () {
              if (widget._formKey.currentState!.validate()) {
                // Validation successful, proceed with your action
                String user = widget.emailController.text;
                String email = widget.emailController.text;
                String password = widget.passwordController.text;
                String confirmPass = widget.confirmPasswordController.text;

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
