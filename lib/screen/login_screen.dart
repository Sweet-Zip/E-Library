import 'package:flutter/material.dart';
import 'package:mobile/component/custom_button.dart';
import 'package:mobile/component/custom_textFormField.dart';
import 'package:mobile/screen/forgot_pass_screen.dart';
import 'package:mobile/screen/item_main_screen.dart';
import 'package:mobile/screen/register_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String _errorMessage = '';

  bool isEmailValid(String email) {
    // Regular expression pattern for a basic email validation
    final RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegex.hasMatch(email);
  }

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

  Widget _buildTextField() {
    return Column(
      children: [
        CustomTextField(
          hintText: 'Email',
          obscureText: false,
          controller: widget.emailController,
          validValue: 'Please input valid email',
        ),
        const SizedBox(
          height: 15,
        ),
        CustomTextField(
          hintText: 'Password',
          obscureText: true,
          controller: widget.passwordController,
          validValue: 'Please input valid password',
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Form(
      key: widget._formKey,
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
          if (widget._errorMessage.isNotEmpty) // Show error message if it's not empty
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget._errorMessage,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          GestureDetector(
            onTap: () {
              if (widget._formKey.currentState!.validate()) {
                String email = widget.emailController.text;
                String password = widget.passwordController.text;
                if (widget.isEmailValid(email)) {
                  // Email is valid
                  if (email == 'kuong@gmail.com' && password == 'pass') {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => ItemMainScreen(),
                      ),
                    );
                  } else {
                    setState(() {
                      widget._errorMessage = 'Incorrect email or password'; // Set the error message
                    });
                  }
                } else {
                  // Email is not valid
                  setState(() {
                    widget._errorMessage = 'Email is not valid'; // Set the error message
                  });
                }

              }
            },
            child: const CustomButton(
              textString: 'Sign Up',
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
