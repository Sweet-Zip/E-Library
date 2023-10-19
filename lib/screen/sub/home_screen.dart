import 'package:flutter/material.dart';

import '../detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(56),
      child: Builder(builder: (context) {
        Brightness brightness = Theme.of(context).brightness;
        return AppBar(
          title: Text(
            'Home Screen',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: brightness == Brightness.dark ? Colors.white : Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.grey.shade700,
          ),
          elevation: 0,
          centerTitle: true,
        );
      }),
    );
  }

  Widget _buildBody() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 2 items in each row
        mainAxisExtent: 250,
      ),
      itemBuilder: (BuildContext context, int index) {
        return _buildGridItem(
          'Harry Potter And The Cursed Child',
          'https://bukovero.com/wp-content/uploads/2016/07/Harry_Potter_and_the_Cursed_Child_Special_Rehearsal_Edition_Book_Cover.jpg',
        );
      },
      itemCount: 15, // Number of items in the grid
    );
  }

  Widget _buildGridItem(String title, String imageUrl) {
    return GestureDetector(
      onTap: () {
        // Navigate to the detail screen when the item is clicked
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(),
          ),
        );
      },
      child: Card(
        elevation: 1,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                height: 175,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7),
              child: Text(title),
            ),
          ],
        ),
      ),
    );
  }


}
