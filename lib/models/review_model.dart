class ReviewModel {
  final String name;
  final String avatarUrl;
  final String timeAgo;
  final double rating;
  final String comment;

  ReviewModel({
    required this.name,
    required this.avatarUrl,
    required this.timeAgo,
    required this.rating,
    required this.comment,
  });
}
