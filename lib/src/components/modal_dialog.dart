import 'package:flutter/material.dart';

class ModalDialog extends StatelessWidget {
  static String tag = "open_dialog";
  final String title;
  final String content;
  final bool loading;
  ModalDialog(
      {@required this.title, @required this.content, this.loading = false});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(this.title),
      content: Text(this.content),
      actions: <Widget>[
        FlatButton(
          child: Text("Close"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
