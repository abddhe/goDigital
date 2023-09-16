class UserModel{
  String displayName;
  String avatar;
  UserModel({required this.displayName,required this.avatar});
  factory UserModel.fromMap(Map map){
    return UserModel(displayName: map['display_name'], avatar: map['avatar']);
  }
}