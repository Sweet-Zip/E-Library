import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff00AEEF),
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 25),
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: const Center(
        child: Text(
          "Sign In",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
