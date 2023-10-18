import 'package:flutter/material.dart';
import 'package:mobile/component/custom_button.dart';
import 'package:mobile/screen/login_screen.dart';
import 'package:provider/provider.dart';

import '../../logic/UserLogic.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key, required this.authenticatedId});

  final int? authenticatedId;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? authenticatedUsername;
  String? email;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final userLogic = Provider.of<UserLogic>(context, listen: false);
    await userLogic.loadUserData();
    setState(() {
      authenticatedUsername = userLogic.authenticatedUsername ?? "DefaultUsername";
      email = userLogic.email ?? "DefaultEmail";
    });
  }


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

  // String? findUsernameById(int? id) {
  //   if (id != null) {
  //     // Search for the user with the specified id
  //     final user = _userList?.firstWhere((user) => user.id == id, orElse: () => null);
  //     return user?.username;
  //   }
  //   return null;
  // }

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
          authenticatedUsername ?? "DefaultUsername",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                // border: TableBorder.all(color: Colors.grey),
                columnWidths: const <int, TableColumnWidth>{
                  0: IntrinsicColumnWidth(),
                  1: FlexColumnWidth(),
                  2: IntrinsicColumnWidth(),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.email,
                          color: Colors.grey,
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            email ?? "email",
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.email,
                          color: Colors.grey,
                        ),
                      ), // Remove the additional Padding widget here
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            email ?? "email",
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            UserLogic().logout();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },
          child: const CustomButton(textString: 'Sign Out'),
        ),
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
