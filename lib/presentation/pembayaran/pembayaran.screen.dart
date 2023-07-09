import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/pembayaran.controller.dart';

class PembayaranScreen extends GetView<PembayaranController> {
  const PembayaranScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PembayaranScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PembayaranScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
