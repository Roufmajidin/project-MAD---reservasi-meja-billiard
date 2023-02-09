import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class onBoardingSider extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  // const onBoardingSider({super.key});
  onBoardingSider(
      {required this.title, required this.description, required this.image});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: Color.fromARGB(248, 11, 18, 34),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            image,
            width: width * 0.6,
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Text(
              description,
              style: TextStyle(
                  height: 1.5,
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  letterSpacing: 0.7,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}
