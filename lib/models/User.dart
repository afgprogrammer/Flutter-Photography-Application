import 'package:flutter_photography/models/Collocation.dart';

class User {
  final String name;
  final String profilePicture;
  final String username;
  final int followers;
  final int following;
  final List<Collocation> collocation;

  User({this.name, this.profilePicture, this.username, this.followers, this.following, this.collocation});

}