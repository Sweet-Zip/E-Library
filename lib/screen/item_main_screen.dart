import 'package:flutter/material.dart';
import 'package:mobile/screen/home_screen.dart';
import 'package:mobile/screen/profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../logic/UserLogic.dart';

class ItemMainScreen extends StatefulWidget {
  final int? authenticatedId;

  ItemMainScreen({Key? key, this.authenticatedId}) : super(key: key);

  @override
  State<ItemMainScreen> createState() => _ItemMainScreenState();
}

class _ItemMainScreenState extends State<ItemMainScreen> {
  UserLogic userLogic = UserLogic();

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final userLogic = UserLogic(); // Access the existing instance of UserLogic
    await userLogic.loadUserData();
    // Now you can access the userId
    setState(() {});
  }

  /*Future<void> loadUserData() async {
    final userLogic = Provider.of<UserLogic>(context, listen: false);
    final userId = await userLogic.loadUserData();
    setState(() {
      _userId = userId;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildBody()),
      bottomNavigationBar: _buildNavigationBar(),
    );
  }

  Widget _buildBody() {
    return Consumer<UserLogic>(
      builder: (BuildContext context, userLogic, child) {
        // Load user data to get the userId
        userLogic.loadUserData();
        int? userId = userLogic.authenticatedId;
        print('Home Page: $userId');
        return IndexedStack(
          index: _currentIndex,
          children: [
            HomeScreen(),
            Container(color: Colors.blue),
            Container(color: Colors.purple),
            Container(color: Colors.pink),
            ProfileScreen(
              authenticatedId: userId,
            ),
          ],
        );
      },
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
