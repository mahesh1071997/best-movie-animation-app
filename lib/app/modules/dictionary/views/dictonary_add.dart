import 'package:booking/app/modules/dictionary/views/dictionary_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scatter/flutter_scatter.dart';

import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import '../controllers/dictionary_controller.dart';

class DictionaryAddView extends GetView<DictionaryController> {
  const DictionaryAddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dictionary Add Keyword"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller.textController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null; // Return null to indicate no error, otherwise return an error message.
                },
                decoration: const InputDecoration(
                  labelText: 'Enter Text',
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                    () => CheckboxListTile(
                  title: const Text('Rotate Text'),
                  value: controller.isRotated.value,
                  onChanged: (value) {
                    controller.isRotated.value = value!;
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (controller.formKey.currentState!.validate()) {
                    controller.kFlutterHashtags.add(ItemDetails(name: controller.textController.text, rotated: controller.isRotated.value),);
                    controller.controllerDynamicHTML=List.generate(controller.kFlutterHashtags.length, (index) => HtmlEditorController());
                   controller.update(['UpdateView']);
                    Get.back();
                  }

                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),

      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.add),
      //   onPressed: () {
      //     Get.to(()=>);
      //   },
      // ),
    );
  }
}