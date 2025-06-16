import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class MessageBubbleImage extends StatelessWidget {
  final Message message;

  const MessageBubbleImage(
      {super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
                    message.text,
                    style: const TextStyle(color: Colors.white),
                  ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        if (message.urlimage != null)
          _ImageBubble(imageUrl: message.urlimage!),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width * 0.7;
    const heigth = 150.0;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(imageUrl,
        width: width,
        height: heigth,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: width,
            height: heigth,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text("your darling is sending message"),
          );
        },
      ),
    );
  }
}
