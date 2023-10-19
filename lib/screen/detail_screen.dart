import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.bookmark_add_outlined,
              color: brightness == Brightness.dark
                  ? Colors.white
                  : Colors.grey.shade700,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.menu_book_rounded,
              color: brightness == Brightness.dark
                  ? Colors.white
                  : Colors.grey.shade700,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.edit,
              color: brightness == Brightness.dark
                  ? Colors.white
                  : Colors.grey.shade700,
            ),
            onPressed: () {},
          ),
        ],
        iconTheme: IconThemeData(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.grey.shade700,
        ),
      ),
      body: SafeArea(child: _buildBody()),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(
          Icons.chrome_reader_mode,
          color: Colors.white,
        ),
        label: const Text(
          'Read Now',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Widget _buildBody() {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: null,
          elevation: 0,
          flexibleSpace: FlexibleSpaceBar(
            background: Center(
              child: Image.network(
                'https://bukovero.com/wp-content/uploads/2016/07/Harry_Potter_and_the_Cursed_Child_Special_Rehearsal_Edition_Book_Cover.jpg',
                fit: BoxFit.fitHeight,
                height: 200.0,
              ),
            ),
          ),
          pinned: true,
          floating: false,
          expandedHeight: MediaQuery.of(context).size.height * 0.3,
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          SizedBox(
            height: 2000,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Harry Potter And The Cursed Child',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  _buildRatingBar(85),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                        "\"Harry Potter and the Cursed Child\” is about the journey Albus takes while growing up, and the roles he and his best friend, Scorpius (Draco Malfoy\'s son), play when dark forces, perhaps in league with Voldemort, once again threaten the fate of the planet."),
                  )
                ],
              ),
            ),
          )
        ]))
      ],
    );
  }

  Widget _buildRatingBar(double ratingPercentage) {
    return Row(
      children: [
        RatingBar.builder(
          initialRating: ratingPercentage / 20.0,
          // Since 100% = 5 stars
          minRating: 0,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemSize: 24,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            // You can add logic here if you want to handle rating updates
          },
        ),
        const SizedBox(width: 10), // Adjust the spacing between the rating and text
        Text(
          '${(ratingPercentage/100)*5} / 5',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey, // Customize the text color
          ),
        ),
      ],
    );
  }
}
