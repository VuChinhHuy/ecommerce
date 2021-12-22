import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

buildLoadingWidget() {
  return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Loading data from API..."), CircularProgressIndicator()],
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