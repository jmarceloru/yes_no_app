import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {

  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outLineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(20));

    final inputDecoration = InputDecoration(
        hintText: "send your message",
        enabledBorder: outLineInputBorder,
        focusedBorder: outLineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            final messagebox = textController.value.text.trim();
            if(messagebox.isNotEmpty){
              onValue(messagebox);
              textController.clear();
            }
          },
        ));
    return TextFormField(
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        if(value.isNotEmpty){
          onValue(value);
          textController.clear();
          focusNode.requestFocus();
        }
      },
    );
  }
}
