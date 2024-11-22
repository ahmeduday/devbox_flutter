import 'package:code_text_field/code_text_field.dart';
import 'package:devbox_flutter/src/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get.dart';

import 'themes.dart';

class CodeEditorController extends GetxController {
  CodeEditorController();
}

class CodeEditorWrapper extends GetView<CodeEditorController> {
  final TextEditingController? textEditingController;
  final bool usesCodeControllers;
  final bool readOnly;
  final Function(String value)? onChanged;
  final int? minLines;

  const CodeEditorWrapper(
      {super.key,
      required this.usesCodeControllers,
      this.textEditingController,
      this.onChanged,
      this.minLines = 10,
      this.readOnly = false});

  @override
  Widget build(
    BuildContext context,
  ) {
    if (usesCodeControllers) {
      return CodeTheme(
        data:
            CodeThemeData(styles: textEditorThemes[Settings.textEditorTheme]!),
        child: CodeField(
          wrap: Settings.textEditorWrap,
          lineNumbers: Settings.textEditorDisplayLineNumbers,
          textStyle: TextStyle(
              fontFamily: Settings.textEditorFontFamily,
              fontSize: Settings.textEditorFontSize,
              color: Theme.of(context).textTheme.bodyMedium!.color,
              inherit: false,
              textBaseline: TextBaseline.alphabetic),
          readOnly: readOnly,
          expands: true,
          onChanged: onChanged,
          controller:
              (textEditingController ?? CodeController()) as CodeController,
        ),
      );
    } else {
      return TextFormField(
        maxLines: Settings.textEditorWrap ? null : (minLines! + 1),
        style: TextStyle(
            fontFamily: Settings.textEditorFontFamily,
            fontSize: Settings.textEditorFontSize,
            color: Theme.of(context).textTheme.bodyMedium!.color,
            inherit: false,
            textBaseline: TextBaseline.alphabetic),
        minLines: minLines,
        enabled: true,
        controller: textEditingController ?? TextEditingController(),
        onChanged: onChanged,
        keyboardType: TextInputType.multiline,
      );
    }
  }
}
