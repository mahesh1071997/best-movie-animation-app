import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/watchui_controller.dart';

class WatchuiView extends GetView<WatchuiController> {
  const WatchuiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WatchuiView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'WatchuiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
