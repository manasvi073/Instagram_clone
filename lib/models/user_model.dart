class UserModel {
  final String userid;
  final String username;
  final String email;
  final String? image;
  final String? name;
  final String? bio;
  final String? link;
  final DateTime? time;

  UserModel({
    required this.userid,
    required this.username,
    required this.email,
    this.image,
    this.name,
    this.bio,
    this.link,
    this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'userid': userid,
      'username': username,
      'email': email,
      'image': image ?? '',
      'name': name ?? '',
      'bio': bio ?? '',
      'link': link ?? '',
      'time': time?.toIso8601String(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userid: map['userid'],
      username: map['username'],
      email: map['email'],
      image: map['image'],
      name: map['name'],
      bio: map['bio'],
      link: map['link'],
      time: map['time'] != null ? DateTime.parse(map['time']) : null,
    );
  }
}
