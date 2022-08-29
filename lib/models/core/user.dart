class User {
  User({
    required this.name,
    required this.email,
    this.imgPath = '',
    required this.posts,
    required this.following,
    required this.followers,
  });

  final String name;
  final String email;
  final String imgPath;

  final int posts;
  final int following;
  final int followers;
}
