import 'package:ecommerce/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({Key? key,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.w),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(132, 95, 161, 1),
        borderRadius: BorderRadius.circular(29.w),
      ),
      child: child,
    );
  }
}

