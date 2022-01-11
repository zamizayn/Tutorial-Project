import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarClass extends StatefulWidget {
  const RatingBarClass({Key? key}) : super(key: key);

  @override
  _RatingBarClassState createState() => _RatingBarClassState();
}

class _RatingBarClassState extends State<RatingBarClass> {
  double ratingValue = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rating Bar"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  ratingValue = rating;
                  setState(() {});
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text("Rating is $ratingValue")
            ],
          ),
        ),
      ),
    );
  }
}
