import 'package:flutter/cupertino.dart';

///
///  Vertical Space using sized box
class Vs extends StatelessWidget {
  const Vs({Key? key, required this.height}) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

///
///  Horizontal Space using sized box
class Hs extends StatelessWidget {
  const Hs({Key? key, required this.width}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
