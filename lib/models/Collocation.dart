import 'package:flutter_photography/models/Post.dart';

class Collocation {
  final String name;
  final String thumbnail;
  final List<String> tags;
  final List<Post> posts;

  Collocation({required this.name, required this.thumbnail, required this.tags, required this.posts});
}