import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/form_pembayaran.controller.dart';

class FormPembayaranScreen extends GetView<FormPembayaranController> {
  const FormPembayaranScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FormPembayaranScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FormPembayaranScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
