import 'package:flutter/material.dart';
import 'package:yes_no_app/data/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messages = [];

  Future<void> sendMessage(String text) async{
    messages.add(Message(text: text, fromWho: FromWho.me));
    if(text.endsWith('?')){
      final Message herMessage = Message(text: 'Escribiendo ..', fromWho: FromWho.hers);
      messages.add(herMessage);
      notifyListeners();
      moveScrollToBottom();
      await herReply(herMessage);
    }
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply(Message message) async{
    final herMessage = await getYesNoAnswer.getAnswer();
    message.text = herMessage.toDomain().text;
    message.urlimage = herMessage.toDomain().urlimage;
  }

  void moveScrollToBottom() async{

    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut);
  }
}