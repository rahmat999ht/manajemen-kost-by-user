import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/profile_update.controller.dart';

class ProfileUpdateScreen extends GetView<ProfileUpdateController> {
  const ProfileUpdateScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileUpdateScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfileUpdateScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
