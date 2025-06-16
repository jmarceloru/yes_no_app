
enum FromWho{
  me,hers
}

class Message{
  String text;
  String? urlimage;
  final FromWho fromWho;

  Message({required this.text, this.urlimage, required this.fromWho});

  set newText(String newText){
    text = newText;
  }
  
  set newUrlImage(String newUrlImage){
    urlimage = newUrlImage;
  }

  
}