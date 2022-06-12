class Users {
  final String uID;
  Users({
    required this.uID,
  });
}

class UserData {
  final String uid;
  final String name;
  final String sugar;
  final int strength;

  UserData({
    required this.name,
    required this.uid,
    required this.strength,
    required this.sugar,
  });
}
