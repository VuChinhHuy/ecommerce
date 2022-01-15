import 'dart:async';

import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

class ARView extends StatefulWidget {
  const ARView({Key? key}) : super(key: key);

  @override
  _ARViewState createState() => _ARViewState();
}

class _ARViewState extends State<ARView> {
  late ARKitController arkitController;
  Timer? timer;

  @override
  void dispose() {
    timer?.cancel();
    arkitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('View Product with AR')),
    body: Container(
      child: ARKitSceneView(
        onARKitViewCreated: (arkitController)=>onARKitViewCreated(arkitController),
      ),
    ),
  );

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;

    final material = ARKitMaterial(
      lightingModelName: ARKitLightingModel.lambert,
      diffuse: ARKitMaterialProperty.image("assets/images/img.png"),
      doubleSided: true
    );
    final sphere = ARKitSphere(
      materials: [material],
      radius: 0.1,
    );

    final node = ARKitNode(
      geometry: sphere,
      position: Vector3(0, 0, -0.5),
      eulerAngles: Vector3.zero(),
    );
    this.arkitController.add(node);

    timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      final rotation = node.eulerAngles;
      rotation.x += 0.01;
      node.eulerAngles = rotation;
    });
  }
}