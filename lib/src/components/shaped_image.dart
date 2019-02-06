import 'package:flutter/material.dart';

class ShapedImage extends StatelessWidget {
  final String imgPath;
  ShapedImage({@required this.imgPath})
      : assert(imgPath != null || imgPath.length <= 0);

  @override
  Widget build(BuildContext context) => ClipOval(
        child: Image.network(
          imgPath,
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
      );
}
