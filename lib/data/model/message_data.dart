

import 'package:yes_no_app/domain/entities/message.dart';

class MessageData{

  final String answer;
  final bool forced;
  final String image;

  MessageData({required this.answer, required this.forced, required this.image});
  
  factory MessageData.fromJson(Map<String,dynamic> json) => MessageData(
    answer: json["answer"],
    forced: json["forced"],
    image: json["image"]
  );

    Message toDomain() => Message(
      text: answer == 'yes' ? 'Si' : 'No', 
      fromWho: FromWho.hers,
      urlimage: image);

  }

  // funcion de extension 
  // extension messageDataToDomain on MessageData{
   // Message toDomain() => Message(text: answer, fromWho: FromWho.hers);
 //}