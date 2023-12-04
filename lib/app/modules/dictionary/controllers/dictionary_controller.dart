import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import '../views/dictionary_view.dart';

class DictionaryController extends GetxController {
  //TODO: Implement DictionaryController

  final count = 0.obs;
  final TextEditingController textController = TextEditingController();
  final RxBool isRotated = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<ItemDetails> kFlutterHashtags = <ItemDetails>[];

  List<HtmlEditorController> controllerDynamicHTML=<HtmlEditorController>[];
  // final HtmlEditorController controllerHTML = HtmlEditorController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
