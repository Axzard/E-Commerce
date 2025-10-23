import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:uts/screen/write_review_screen.dart';
import '../models/review_model.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  final List<ReviewModel> reviews = [
    ReviewModel(
      name: 'Haylie Aminoff',
      avatarUrl: 'https://randomuser.me/api/portraits/women/10.jpg',
      timeAgo: '32 minutes ago',
      rating: 4.5,
      comment:
          'Lorem ipsum dolor sit amet, consectetur sadi sspcsing elitr, sed diam nonumy',
    ),
    ReviewModel(
      name: 'Carla Septimus',
      avatarUrl: 'https://randomuser.me/api/portraits/women/44.jpg',
      timeAgo: '32 minutes ago',
      rating: 4.5,
      comment:
          'Lorem ipsum dolor sit amet, consectetur sadi sspcsing elitr, sed diam nonumy',
    ),
    ReviewModel(
      name: 'Carla George',
      avatarUrl: 'https://randomuser.me/api/portraits/women/68.jpg',
      timeAgo: '32 minutes ago',
      rating: 4.5,
      comment:
          'Lorem ipsum dolor sit amet, consectetur sadi sspcsing elitr, sed diam nonumy',
    ),
    ReviewModel(
      name: 'Maren Kenter',
      avatarUrl: 'https://randomuser.me/api/portraits/women/85.jpg',
      timeAgo: '32 minutes ago',
      rating: 4.5,
      comment:
          'Lorem ipsum dolor sit amet, consectetur sadi sspcsing elitr, sed diam nonumy',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Reviews",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.plusCircle, color: Colors.black),
            onPressed: () {
              // Aksi tambah review nanti
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WriteReviewScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          final review = reviews[index];
          return _buildReviewCard(review);
        },
      ),
    );
  }

  Widget _buildReviewCard(ReviewModel review) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header user
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(review.avatarUrl),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    review.timeAgo,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Divider(color: Colors.grey.shade300, height: 1),
          const SizedBox(height: 10),

          // Rating bar
          Row(
            children: [
              Text(
                review.rating.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.5,
                ),
              ),
              const SizedBox(width: 6),
              _buildRatingStars(review.rating),
            ],
          ),
          const SizedBox(height: 10),

          // Comment
          Text(
            review.comment,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingStars(double rating) {
    List<Widget> stars = [];
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;

    for (int i = 0; i < fullStars; i++) {
      stars.add(const Icon(Icons.star, color: Colors.amber, size: 18));
    }
    if (hasHalfStar) {
      stars.add(const Icon(Icons.star_half, color: Colors.amber, size: 18));
    }
    while (stars.length < 5) {
      stars.add(const Icon(Icons.star_border, color: Colors.amber, size: 18));
    }

    return Row(children: stars);
  }
}
