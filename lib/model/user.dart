import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 1)
class User {
  User({
    this.userId,
    this.id,
    this.role,
    this.fullName,
    this.email,
    this.countryCode,
    this.mobileNumber,
    this.entertainmentType,
    this.gender,
    this.bio,
    this.location,
    this.latitude,
    this.longitude,
    this.profileImage,
    this.cityName,
    this.dob,
    this.instagramLink,
    this.facebookLink,
    this.twitterLink,
    this.youtubeLink,
    this.forgotpwtoken,
    this.changepwdate,
    this.loginType,
    this.isVerify,
    this.login,
    this.step,
    this.avgRating,
    this.otp,
    this.status,
    this.statusReason,
    this.insertdate,
    this.isUserMode,
    this.totalRating,
    this.isUserNotification,
    this.isAdminNotification,
    this.token,
  });

  @HiveField(0)
  @JsonKey(name: "user_id")
  int? userId;
  @HiveField(1)
  int? id;
  @HiveField(2)
  String? role;
  @HiveField(3)
  @JsonKey(name: "full_name")
  String? fullName;
  @HiveField(4)
  String? email;
  @HiveField(5)
  @JsonKey(name: "country_code")
  String? countryCode;
  @HiveField(6)
  @JsonKey(name: "mobile_number")
  String? mobileNumber;
  @HiveField(7)
  @JsonKey(name: "entertainment_type")
  String? entertainmentType;
  @HiveField(8)
  String? gender;
  @HiveField(9)
  String? bio;
  @HiveField(10)
  String? location;
  @HiveField(11)
  String? latitude;
  @HiveField(12)
  String? longitude;
  @HiveField(13)
  @JsonKey(name: "profile_image")
  String? profileImage;
  @HiveField(14)
  @JsonKey(name: "city_name")
  String? cityName;
  @HiveField(15)
  String? dob;
  @HiveField(16)
  String? instagramLink;
  @HiveField(17)
  String? facebookLink;
  @HiveField(18)
  String? twitterLink;
  @HiveField(19)
  String? youtubeLink;
  @HiveField(20)
  String? forgotpwtoken;
  @HiveField(21)
  String? changepwdate;
  @HiveField(22)
  String? loginType;
  @HiveField(23)
  int? isVerify;
  @HiveField(24)
  String? login;
  @HiveField(25)
  int? step;
  @HiveField(26)
  @JsonKey(name: "avg_rating")
  String? avgRating;
  @HiveField(27)
  String? otp;
  @HiveField(28)
  String? status;
  @HiveField(29)
  String? statusReason;
  @HiveField(30)
  String? insertdate;
  @HiveField(31)
  String? isUserMode;
  @HiveField(32)
  @JsonKey(name: "total_rating")
  int? totalRating;
  @HiveField(33)
  int? isUserNotification;
  @HiveField(34)
  int? isAdminNotification;
  @HiveField(35)
  String? token;

  static fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

/*
class Default_address {
  Default_address({
      this.id, 
      this.userId, 
      this.location, 
      this.locationName, 
      this.city, 
      this.isDefault, 
      this.status, 
      this.insertdate, 
      this.type, 
      this.latitude, 
      this.longitude,});

  Default_address.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    location = json['location'];
    locationName = json['location_name'];
    city = json['city'];
    isDefault = json['is_default'];
    status = json['status'];
    insertdate = json['insertdate'];
    type = json['type'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
  int? id;
  int? userId;
  String? location;
  String? locationName;
  String? city;
  int? isDefault;
  String? status;
  String? insertdate;
  String? type;
  String? latitude;
  String? longitude;

  Map<String?, dynamic> toJson() {
    final map = <String?, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['location'] = location;
    map['location_name'] = locationName;
    map['city'] = city;
    map['is_default'] = isDefault;
    map['status'] = status;
    map['insertdate'] = insertdate;
    map['type'] = type;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    return map;
  }

}

class User_device {
  User_device({
      this.id, 
      this.userId, 
      this.token, 
      this.deviceType, 
      this.deviceToken, 
      this.uuid, 
      this.osVersion, 
      this.deviceName, 
      this.modelName, 
      this.ip, 
      this.language, 
      this.insertdate, 
      this.updatetime,});

  User_device.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    token = json['token'];
    deviceType = json['device_type'];
    deviceToken = json['device_token'];
    uuid = json['uuid'];
    osVersion = json['os_version'];
    deviceName = json['device_name'];
    modelName = json['model_name'];
    ip = json['ip'];
    language = json['language'];
    insertdate = json['insertdate'];
    updatetime = json['updatetime'];
  }
  int? id;
  int? userId;
  String? token;
  String? deviceType;
  String? deviceToken;
  String? uuid;
  String? osVersion;
  String? deviceName;
  String? modelName;
  String? ip;
  String? language;
  String? insertdate;
  String? updatetime;

  Map<String?, dynamic> toJson() {
    final map = <String?, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['token'] = token;
    map['device_type'] = deviceType;
    map['device_token'] = deviceToken;
    map['uuid'] = uuid;
    map['os_version'] = osVersion;
    map['device_name'] = deviceName;
    map['model_name'] = modelName;
    map['ip'] = ip;
    map['language'] = language;
    map['insertdate'] = insertdate;
    map['updatetime'] = updatetime;
    return map;
  }

}*/
