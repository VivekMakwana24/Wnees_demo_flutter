// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      userId: fields[0] as int?,
      id: fields[1] as int?,
      role: fields[2] as String?,
      fullName: fields[3] as String?,
      email: fields[4] as String?,
      countryCode: fields[5] as String?,
      mobileNumber: fields[6] as String?,
      entertainmentType: fields[7] as String?,
      gender: fields[8] as String?,
      bio: fields[9] as String?,
      location: fields[10] as String?,
      latitude: fields[11] as String?,
      longitude: fields[12] as String?,
      profileImage: fields[13] as String?,
      cityName: fields[14] as String?,
      dob: fields[15] as String?,
      instagramLink: fields[16] as String?,
      facebookLink: fields[17] as String?,
      twitterLink: fields[18] as String?,
      youtubeLink: fields[19] as String?,
      forgotpwtoken: fields[20] as String?,
      changepwdate: fields[21] as String?,
      loginType: fields[22] as String?,
      isVerify: fields[23] as int?,
      login: fields[24] as String?,
      step: fields[25] as int?,
      avgRating: fields[26] as String?,
      otp: fields[27] as String?,
      status: fields[28] as String?,
      statusReason: fields[29] as String?,
      insertdate: fields[30] as String?,
      isUserMode: fields[31] as String?,
      totalRating: fields[32] as int?,
      isUserNotification: fields[33] as int?,
      isAdminNotification: fields[34] as int?,
      token: fields[35] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(36)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.role)
      ..writeByte(3)
      ..write(obj.fullName)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.countryCode)
      ..writeByte(6)
      ..write(obj.mobileNumber)
      ..writeByte(7)
      ..write(obj.entertainmentType)
      ..writeByte(8)
      ..write(obj.gender)
      ..writeByte(9)
      ..write(obj.bio)
      ..writeByte(10)
      ..write(obj.location)
      ..writeByte(11)
      ..write(obj.latitude)
      ..writeByte(12)
      ..write(obj.longitude)
      ..writeByte(13)
      ..write(obj.profileImage)
      ..writeByte(14)
      ..write(obj.cityName)
      ..writeByte(15)
      ..write(obj.dob)
      ..writeByte(16)
      ..write(obj.instagramLink)
      ..writeByte(17)
      ..write(obj.facebookLink)
      ..writeByte(18)
      ..write(obj.twitterLink)
      ..writeByte(19)
      ..write(obj.youtubeLink)
      ..writeByte(20)
      ..write(obj.forgotpwtoken)
      ..writeByte(21)
      ..write(obj.changepwdate)
      ..writeByte(22)
      ..write(obj.loginType)
      ..writeByte(23)
      ..write(obj.isVerify)
      ..writeByte(24)
      ..write(obj.login)
      ..writeByte(25)
      ..write(obj.step)
      ..writeByte(26)
      ..write(obj.avgRating)
      ..writeByte(27)
      ..write(obj.otp)
      ..writeByte(28)
      ..write(obj.status)
      ..writeByte(29)
      ..write(obj.statusReason)
      ..writeByte(30)
      ..write(obj.insertdate)
      ..writeByte(31)
      ..write(obj.isUserMode)
      ..writeByte(32)
      ..write(obj.totalRating)
      ..writeByte(33)
      ..write(obj.isUserNotification)
      ..writeByte(34)
      ..write(obj.isAdminNotification)
      ..writeByte(35)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    userId: json['user_id'] as int?,
    id: json['id'] as int?,
    role: json['role'] as String?,
    fullName: json['full_name'] as String?,
    email: json['email'] as String?,
    countryCode: json['country_code'] as String?,
    mobileNumber: json['mobile_number'] as String?,
    entertainmentType: json['entertainment_type'] as String?,
    gender: json['gender'] as String?,
    bio: json['bio'] as String?,
    location: json['location'] as String?,
    latitude: json['latitude'] as String?,
    longitude: json['longitude'] as String?,
    profileImage: json['profile_image'] as String?,
    cityName: json['city_name'] as String?,
    dob: json['dob'] as String?,
    instagramLink: json['instagramLink'] as String?,
    facebookLink: json['facebookLink'] as String?,
    twitterLink: json['twitterLink'] as String?,
    youtubeLink: json['youtubeLink'] as String?,
    forgotpwtoken: json['forgotpwtoken'] as String?,
    changepwdate: json['changepwdate'] as String?,
    loginType: json['loginType'] as String?,
    isVerify: json['isVerify'] as int?,
    login: json['login'] as String?,
    step: json['step'] as int?,
    avgRating: json['avg_rating'] as String?,
    otp: json['otp'] as String?,
    status: json['status'] as String?,
    statusReason: json['statusReason'] as String?,
    insertdate: json['insertdate'] as String?,
    isUserMode: json['isUserMode'] as String?,
    totalRating: json['total_rating'] as int?,
    isUserNotification: json['isUserNotification'] as int?,
    isAdminNotification: json['isAdminNotification'] as int?,
    token: json['token'] as String?,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'user_id': instance.userId,
      'id': instance.id,
      'role': instance.role,
      'full_name': instance.fullName,
      'email': instance.email,
      'country_code': instance.countryCode,
      'mobile_number': instance.mobileNumber,
      'entertainment_type': instance.entertainmentType,
      'gender': instance.gender,
      'bio': instance.bio,
      'location': instance.location,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'profile_image': instance.profileImage,
      'city_name': instance.cityName,
      'dob': instance.dob,
      'instagramLink': instance.instagramLink,
      'facebookLink': instance.facebookLink,
      'twitterLink': instance.twitterLink,
      'youtubeLink': instance.youtubeLink,
      'forgotpwtoken': instance.forgotpwtoken,
      'changepwdate': instance.changepwdate,
      'loginType': instance.loginType,
      'isVerify': instance.isVerify,
      'login': instance.login,
      'step': instance.step,
      'avg_rating': instance.avgRating,
      'otp': instance.otp,
      'status': instance.status,
      'statusReason': instance.statusReason,
      'insertdate': instance.insertdate,
      'isUserMode': instance.isUserMode,
      'total_rating': instance.totalRating,
      'isUserNotification': instance.isUserNotification,
      'isAdminNotification': instance.isAdminNotification,
      'token': instance.token,
    };
