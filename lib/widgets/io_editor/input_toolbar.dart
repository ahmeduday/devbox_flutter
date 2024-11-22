import 'package:devbox_flutter/helpers/helpers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io' as io;

import 'io_toolbar.dart';

class InputToolBar extends StatelessWidget {
  final TextEditingController inputController;

  final String? toolbarTitle;

  const InputToolBar(
      {super.key, required this.inputController, this.toolbarTitle});

  @override
  Widget build(BuildContext context) {
    return IOToolbar(title: toolbarTitle ?? "input", actions: [
      ElevatedButton.icon(
        icon: const Icon(Icons.copy),
        label: const Text("copy"),
        onPressed: () async => await copyToClipboard(inputController.text),
      ),
      ElevatedButton.icon(
        icon: const Icon(Icons.paste),
        label: const Text("paste"),
        onPressed: () async {
          inputController.text = await Clipboard.getData("text/plain")
              .then((value) => value?.text ?? "");
        },
      ),
      ElevatedButton.icon(
        icon: const Icon(Icons.upload),
        label: const Text("upload_file"),
        onPressed: () async {
          var result = await FilePicker.platform.pickFiles();
          if (result != null) {
            if (kIsWeb) {
              inputController.text =
                  String.fromCharCodes(result.files.first.bytes!);
            } else {
              final file = io.File(result.files.single.path!);
              inputController.text = await file.readAsString();
            }
          }
        },
      ),
      ElevatedButton.icon(
        icon: const Icon(Icons.clear),
        label: const Text("clear"),
        onPressed: () => inputController.clear(),
      ),
    ]);
  }
}
