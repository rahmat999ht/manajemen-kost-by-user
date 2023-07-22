import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/tentang_app.controller.dart';

class TentangAppScreen extends GetView<TentangAppController> {
  const TentangAppScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TentangAppScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TentangAppScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
