import 'package:flutter_photography/models/Post.dart';

class Collocation {
  final String name;
  final String thumbnail;
  final List<String> tags;
  final List<Post> posts;

  Collocation({this.name, this.thumbnail, this.tags, this.posts});
}