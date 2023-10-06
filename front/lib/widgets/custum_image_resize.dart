import 'package:flutter/material.dart';

class CustumImageResize extends StatelessWidget {
  final String? image;
  const CustumImageResize({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 4 / 1,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  alignment: FractionalOffset.topCenter,
                  image: AssetImage("$image"))),
        ),
      ),
    );
  }
}
