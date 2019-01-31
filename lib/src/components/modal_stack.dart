import 'package:flutter/material.dart';

///Wrapper component that create a `Slack` widget.
///
/// _parameters_:
/// ```dart
/// @required bool isLoading
/// @required Widget child
/// bool cancelable
/// ```
/// purpose to create loading screen with opacity transparent and include CircularProgressIndicator()
class ModalStack extends StatelessWidget {
  final bool isLoading;
  final bool cancelable;
  final Widget child;
  ModalStack(
      {@required this.isLoading, this.cancelable = false, @required this.child})
      : assert(child != null),
        assert(cancelable != null);
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(child);
    if (isLoading) {
      final modal = [
        Opacity(
          opacity: 0.2,
          child: ModalBarrier(
            dismissible: cancelable,
            color: Colors.grey,
          ),
        ),
        Center(
          child: CircularProgressIndicator(),
        )
      ];
      widgetList += modal;
    }
    return Stack(children: widgetList);
  }
}
