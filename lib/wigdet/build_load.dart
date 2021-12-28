import 'package:ecommerce/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

buildLoadingWidget() {
  return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingAnimationWidget.fourRotatingDots(
          size: 50.w, color: Colors.purple,
        ),
        ],
      ));
}

buildErrorWidget(String error) {
  return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Error occured: $error"),
        ],
      ));
}