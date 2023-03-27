import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final IconData iconData;

  final String text;

  final VoidCallback onClick;

  const ButtonWidget({
    Key? key,
    required this.iconData,
    required this.text,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(50),
        ),
        child: buildContent(),
        onPressed: onClick,
      );



  Widget buildContent() => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(iconData, size: 28),
      SizedBox(width: 16),
      Text(
        text,
        style: TextStyle(fontSize: 22, color: Colors.white),
      ),
    ],
  );


}
