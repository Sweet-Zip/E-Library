import 'package:flutter/material.dart';
import 'package:mobile/screen/home_screen.dart';
import 'package:mobile/screen/profile_screen.dart';

import '../logic/UserLogic.dart';

class ItemMainScreen extends StatefulWidget {
  ItemMainScreen({super.key});

  @override
  State<ItemMainScreen> createState() => _ItemMainScreenState();
}

class _ItemMainScreenState extends State<ItemMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildBody()),
      bottomNavigationBar: _buildNavigationBar(),
    );
  }

  final userLogic = UserLogic();


  Widget _buildBody() {
    print(userLogic.authenticatedUsername);
    return IndexedStack(
      index: _currentIndex,
      children: [
        HomeScreen(),
        Container(color: Colors.blue),
        Container(color: Colors.purple),
        Container(color: Colors.pink),
        ProfileScreen(authenticatedUsername: userLogic.authenticatedUsername),
      ],
    );
  }

  int _currentIndex = 0;

  Widget _buildNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (selectedIndex) {
        setState(() {
          _currentIndex = selectedIndex;
        });
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.cyan,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 26,
      items: const [
        BottomNavigationBarItem(
          icon: Center(child: Icon(Icons.home)),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Center(child: Icon(Icons.people)),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Center(child: Icon(Icons.search)),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Center(child: Icon(Icons.more_horiz)),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Center(child: Icon(Icons.person_rounded)),
          label: "",
        ),
      ],
    );
  }

}
