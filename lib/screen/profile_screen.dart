import 'package:flutter/material.dart';
import 'package:mobile/component/custom_button.dart';
import 'package:mobile/screen/login_screen.dart';

import '../logic/UserLogic.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key, required this.authenticatedUsername});
  final String? authenticatedUsername;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: SafeArea(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        const SizedBox(height: 25),
        //circle profile
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FullSizeImageScreen(
                  imageUrl:
                      "https://media.npr.org/assets/img/2016/03/29/ap_090911089838_sq-3271237f28995f6530d9634ff27228cae88e3440.jpg",
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.blue, // Border color
                width: 2.0, // Border width
              ),
            ),
            child: const ClipOval(
              clipBehavior: Clip.antiAlias,
              child: CircleAvatar(
                radius: 100, // Adjust the size of the CircleAvatar
                backgroundImage: NetworkImage(
                  "https://media.npr.org/assets/img/2016/03/29/ap_090911089838_sq-3271237f28995f6530d9634ff27228cae88e3440.jpg",
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          widget.authenticatedUsername ?? "Unknown", // Display the authenticated username if available
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },
          child: const CustomButton(textString: 'Sign Out'),
        )
      ],
    );
  }
}

class FullSizeImageScreen extends StatelessWidget {
  final String imageUrl;

  FullSizeImageScreen({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        // You can remove this line if you want the body to be fully black
        child: Center(
          child: Image.network(imageUrl),
        ),
      ),
    );
  }
}
