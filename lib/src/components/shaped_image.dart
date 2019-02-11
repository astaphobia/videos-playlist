import 'package:flutter/material.dart';
import 'package:angel_validate/angel_validate.dart';

class ShapedImage extends StatelessWidget {
  final String imgPath;
  ShapedImage({@required this.imgPath})
      : assert(imgPath != null || imgPath.length <= 0);

  @override
  Widget build(BuildContext context) => ClipOval(
        child: _child(imgPath),
      );
}

Widget _child(String path) {
  Validator validator = Validator({"path": isUrl});
  if (validator.check({"path": path}).errors.isEmpty) {
    return Image.network(
      path,
      height: 100,
      width: 100,
      fit: BoxFit.cover,
    );
  }
  return Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.white,
    ),
    child: Center(
      child: Text(
        path[0].toUpperCase(),
        style: TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
          fontSize: 40,
        ),
      ),
    ),
  );
}
