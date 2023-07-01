import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_native/flutter_rating_native.dart';

class ActivityWidget extends StatelessWidget {
  final String imageUrl;
  final int price;
  final String name;
  final String type;
  final double rating;
  final List<String> times;

  const ActivityWidget(
      {required this.imageUrl,
      required this.price,
      required this.name,
      required this.type,
      required this.rating,
      required this.times});

  @override
  Widget build(BuildContext context) {
    final double _containerHeight = 150.0;
    final double _containerWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      width: _containerWidth,
      height: _containerHeight + 10,
      child: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Positioned(
              right: 10.0,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: Container(
                    width: _containerWidth - 50,
                    height: _containerHeight - 5,
                    child: null),
              )),
          Positioned(
            top: 20.0,
            right: 30.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("\$ $price",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                Text("per pax", style: TextStyle(color: Colors.grey))
              ],
            ),
          ),
          Positioned(
            top: 20,
            left: _containerWidth / 4 + 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                    width: _containerWidth / 3,
                    child: AutoSizeText("$name",
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0))),
                Text("$type",
                    style: TextStyle(color: Colors.grey, fontSize: 12.0)),
                FlutterRating(
                  rating: 3.5,
                  starCount: 5,
                  borderColor: Colors.grey,
                  color: Colors.amber,
                  allowHalfRating: true,
                  size: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  onRatingChanged: (rating) {
                    print(rating);
                  },
                ),
                _buildSchedule(times)
              ],
            ),
          ),
          Positioned(
              left: 10.0,
              top: 15.0,
              child: Container(
                width: _containerWidth / 4,
                height: _containerHeight - 30,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                        image: NetworkImage(imageUrl), fit: BoxFit.cover)),
              ))
        ],
      ),
    );
  }

  Widget _buildSchedule(List<String> times) {
    List<Padding> slots = <Padding>[];
    for (String time in times) {
      var slot = Padding(
        padding: EdgeInsets.only(left: 2.0, right: 2.0),
        child: new Chip(
          label: Text(time),
          backgroundColor: Colors.blue[100],
        ),
      );

      slots.add(slot);
    }
    return Row(children: slots.toList());
  }
}
