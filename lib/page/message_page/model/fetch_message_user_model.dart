class FetchMessageUserModel {
  FetchMessageUserModel({
    bool? status,
    String? message,
    List<MessageData>? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  FetchMessageUserModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(MessageData.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<MessageData>? _data;
  FetchMessageUserModel copyWith({
    bool? status,
    String? message,
    List<MessageData>? data,
  }) =>
      FetchMessageUserModel(
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
      );
  bool? get status => _status;
  String? get message => _message;
  List<MessageData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class MessageData {
  MessageData({
    String? id,
    String? chatTopicId,
    String? senderId,
    String? message,
    int? unreadCount,
    String? userId,
    String? name,
    String? userName,
    String? image,
    bool? isProfilePicBanned,
    bool? isVerified,
    bool? isFake,
    String? time,
  }) {
    _id = id;
    _chatTopicId = chatTopicId;
    _senderId = senderId;
    _message = message;
    _unreadCount = unreadCount;
    _userId = userId;
    _name = name;
    _userName = userName;
    _image = image;
    _isProfilePicBanned = isProfilePicBanned;
    _isVerified = isVerified;
    _isFake = isFake;
    _time = time;
  }

  MessageData.fromJson(dynamic json) {
    _id = json['_id'];
    _chatTopicId = json['chatTopicId'];
    _senderId = json['senderId'];
    _message = json['message'];
    _unreadCount = json['unreadCount'];
    _userId = json['userId'];
    _name = json['name'];
    _userName = json['userName'];
    _image = json['image'];
    _isProfilePicBanned = json['isProfilePicBanned'];
    _isVerified = json['isVerified'];
    _isFake = json['isFake'];
    _time = json['time'];
  }
  String? _id;
  String? _chatTopicId;
  String? _senderId;
  String? _message;
  int? _unreadCount;
  String? _userId;
  String? _name;
  String? _userName;
  String? _image;
  bool? _isProfilePicBanned;
  bool? _isVerified;
  bool? _isFake;
  String? _time;
  MessageData copyWith({
    String? id,
    String? chatTopicId,
    String? senderId,
    String? message,
    int? unreadCount,
    String? userId,
    String? name,
    String? userName,
    String? image,
    bool? isProfilePicBanned,
    bool? isVerified,
    bool? isFake,
    String? time,
  }) =>
      MessageData(
        id: id ?? _id,
        chatTopicId: chatTopicId ?? _chatTopicId,
        senderId: senderId ?? _senderId,
        message: message ?? _message,
        unreadCount: unreadCount ?? _unreadCount,
        userId: userId ?? _userId,
        name: name ?? _name,
        userName: userName ?? _userName,
        image: image ?? _image,
        isProfilePicBanned: isProfilePicBanned ?? _isProfilePicBanned,
        isVerified: isVerified ?? _isVerified,
        isFake: isFake ?? _isFake,
        time: time ?? _time,
      );
  String? get id => _id;
  String? get chatTopicId => _chatTopicId;
  String? get senderId => _senderId;
  String? get message => _message;
  int? get unreadCount => _unreadCount;
  String? get userId => _userId;
  String? get name => _name;
  String? get userName => _userName;
  String? get image => _image;
  bool? get isProfilePicBanned => _isProfilePicBanned;
  bool? get isVerified => _isVerified;
  bool? get isFake => _isFake;
  String? get time => _time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['chatTopicId'] = _chatTopicId;
    map['senderId'] = _senderId;
    map['message'] = _message;
    map['unreadCount'] = _unreadCount;
    map['userId'] = _userId;
    map['name'] = _name;
    map['userName'] = _userName;
    map['image'] = _image;
    map['isProfilePicBanned'] = _isProfilePicBanned;
    map['isVerified'] = _isVerified;
    map['isFake'] = _isFake;
    map['time'] = _time;
    return map;
  }
}
