import 'package:flutter/material.dart';
import 'package:mobile/component/custom_button.dart';
import 'package:mobile/component/custom_textFormField.dart';
import 'package:mobile/screen/register_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildBody(),
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
          const SizedBox(
            height: 100,
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
                  "Sign in",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          _buildTextField(),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildForgotPass(),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          GestureDetector(
            onTap: () {
              if (widget._formKey.currentState!.validate()) {
                // Validation successful, proceed with your action
                String email = widget.emailController.text;
                String password = widget.passwordController.text;
                print("Email: $email");
                print("Password: $password");
              }
            },
            child: CustomButton(
              emailController: widget.emailController,
              passwordController: widget.passwordController,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          _buildRegisterBtn(),
        ],
      ),
    );
  }

  Widget _buildForgotPass() {
    return InkWell(
      onTap: () {},
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
          builder: (context) => const RegisterScreen(),
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
        InkWell(
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
