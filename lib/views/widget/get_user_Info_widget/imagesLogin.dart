import 'package:flutter/material.dart';

class ImagesLogin extends StatelessWidget {
  const ImagesLogin({
    super.key, required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset(image));
  }
}
