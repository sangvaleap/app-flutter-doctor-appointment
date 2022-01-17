/*
In this model, we give example about using private variable
 */

class ChatModel {
  int _id;
  String? _type;
  String _isTextImageDate;
  String _message;
  String? _date;
  bool? _read;

  ChatModel(this._id, this._type, this._isTextImageDate, this._message, this._date, this._read);

  int get getId{
    return _id;
  }

  String? get getType{
    return _type;
  }

  String get getTextImageDate{
    return _isTextImageDate;
  }

  String get getMessage{
    return _message;
  }

  String? get getDate{
    return _date;
  }

  bool? get getRead{
    return _read;
  }
}