
import 'package:dio/dio.dart';
import 'package:yes_no_app/data/model/message_data.dart';

class GetYesNoAnswer {
  
  final _dio = Dio();

  Future<MessageData> getAnswer() async{

    final response = await _dio.get("https://yesno.wtf/api");

    return MessageData.fromJson(response.data);

  }

}