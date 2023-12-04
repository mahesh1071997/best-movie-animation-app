import 'package:booking/app/modules/dictionary/views/dictonary_add.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scatter/flutter_scatter.dart';

import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import '../controllers/dictionary_controller.dart';

class DictionaryView extends GetView<DictionaryController> {
  const DictionaryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dictionary Example"),
      ),
      body: const WordCloudExample(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          controller.textController.text = "";
          controller.isRotated.value = false;
          Get.to(() => const DictionaryAddView());
        },
      ),
    );
  }
}

class WordCloudExample extends GetView<DictionaryController> {
  const WordCloudExample({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: 'UpdateView',
      init: DictionaryController(),
      builder: (_) {
        List<Widget> widgets = <Widget>[];
        for (var i = 0; i < controller.kFlutterHashtags.length; i++) {
          widgets.add(ScatterItem(controller.kFlutterHashtags[i], i));
        }
        final screenSize = MediaQuery.of(context).size;
        final ratio = screenSize.width / (screenSize.height / 2);
        return Center(
          child: controller.kFlutterHashtags.length > 4
              ? FittedBox(
                  child: Scatter(
                    fillGaps: true,
                    alignment: Alignment.center,
                    delegate: ArchimedeanSpiralScatterDelegate(ratio: ratio),
                    children: widgets,
                  ),
                )
              : Container(
                  child: Scatter(
                    fillGaps: true,
                    alignment: Alignment.center,
                    delegate: ArchimedeanSpiralScatterDelegate(ratio: ratio),
                    children: widgets,
                  ),
                ),
        );
      },
    );
  }
}

class ScatterItem extends GetView<DictionaryController> {
  const ScatterItem(this.hashtag, this.index, {super.key});

  final ItemDetails hashtag;
  final int index;

  @override
  Widget build(BuildContext context) {
    final TextStyle? style = Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: hashtag.size!.toDouble(),
          color: hashtag.color,
        );
    return InkWell(
      onTap: () {
        Get.defaultDialog(
          title: "Add Some Notes Here",
          barrierDismissible: false,
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Flex(
              direction: Axis.vertical,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey), // Border decoration
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  // Rounded corners
                  child: SizedBox(
                    height: 290,
                    width: Get.width,
                    child: HtmlEditor(
                      controller: controller.controllerDynamicHTML[index],
                      htmlEditorOptions: const HtmlEditorOptions(
                        hint: 'Enter Notes',
                        shouldEnsureVisible: true,
                      ),
                      htmlToolbarOptions: HtmlToolbarOptions(
                        defaultToolbarButtons: [
                          const FontButtons(
                              bold: true,
                              italic: true,
                              underline: true,
                              subscript: false,
                              superscript: false,
                              clearAll: false,
                              strikethrough: false),
                        ],
                        toolbarPosition: ToolbarPosition.belowEditor,
                        //by default
                        toolbarType: ToolbarType.nativeScrollable,
                        //by default
                        onButtonPressed: (ButtonType type, bool? status,
                            Function? updateStatus) {
                          return true;
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle form submission
                    Get.back();
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        );
      },
      child: RotatedBox(
        quarterTurns: hashtag.rotated! ? 1 : 0,
        child: Text(
          hashtag.name!,
          style: style,
        ),
      ),
    );
  }
}

class ItemDetails {
  const ItemDetails({
    this.name,
    this.color = Colors.black,
    this.size = 18,
    this.rotated = false,
  });

  final String? name;
  final Color? color;
  final int? size;
  final bool? rotated;
}
