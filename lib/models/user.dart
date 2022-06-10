// It's a structure of each user section.

class MegaUser {
  final String uid;
  MegaUser({required this.uid});
}

class MegaUserData {
  final String? uid;
  final String? username;
  final String? fullname;
  final String? email;

  MegaUserData({
    this.uid,
    this.username,
    this.fullname,
    this.email,
  });
}
