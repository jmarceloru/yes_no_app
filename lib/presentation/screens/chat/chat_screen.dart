import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/message_bubble_image.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  final imageProfile = 'https://pbs.twimg.com/profile_images/588353819312054274/1FN4L8aG_400x400.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                imageProfile),
          ),
        ),
        title: const Text("Chat"),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    controller: chatProvider.chatScrollController,
                    itemCount: chatProvider.messages.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messages[index];
                      return (message.fromWho == FromWho.hers) 
                        ? MessageBubbleImage(message: message) : MessageBubble(message:message);
                    })),
            MessageFieldBox(onValue: (value) => chatProvider.sendMessage(value),),
            const SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
