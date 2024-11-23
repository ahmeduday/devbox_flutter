import 'package:devbox_flutter/utils/enums/prog_lang.dart';
import 'package:devbox_flutter/widgets/io_editor/io_editor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yaru/yaru.dart';

class ClassJsonGeneratorController extends GetxController {
  final inputController = TextEditingController();
  final outputController = TextEditingController();

  final inputText = ''.obs;
  final outputText = ''.obs;

  final programmingLanguage = ProgLanguage.dart.obs;

  void updateInputText(String text) {
    inputText.value = text;
  }

  void updateOutputText(String text) {
    outputText.value = text;
  }
}

class ClassJsonGeneratorPage extends GetView<ClassJsonGeneratorController> {
  const ClassJsonGeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ClassJsonGeneratorController());

    return SizedBox(
      height: MediaQuery.of(context).size.height - kToolbarHeight,
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(8.0),
            child: YaruSection(
              headline: const Text("configuration"),
              child:
                  // ... rest of your code ...
                  YaruTile(
                enabled: true,
                leading: const Icon(
                  Icons.code,
                  size: 25,
                ),
                title: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "programming_language",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                trailing: DropdownButton<ProgLanguage>(
                    value: controller.programmingLanguage.value,
                    items: ProgLanguage.values
                        .map(
                          (language) => DropdownMenuItem<ProgLanguage>(
                            value: controller.programmingLanguage.value,
                            child: Text(
                              language.displayName,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (selected) =>
                        controller.programmingLanguage.value = selected!),
              ),
            ),
          ),
          IOEditor(
            inputController: controller.inputController,
            outputController: controller.outputController,
            inputOnChanged: (text) => controller.updateInputText(text),
            outputOnChanged: (text) => controller.updateOutputText(text),
          ),
          // IOEditor(
          //   controller: controller.outputController,
          //   language: dart,
          //   text: controller.outputText.value,
          // ),
        ],
      ),
    );
  }
}
