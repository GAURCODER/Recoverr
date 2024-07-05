class CombinedLostFound {
  final String id;
  final DateTime updatedAt;
  final String status;
  final String title;
  final String description;
  final String location;
  final String imageUrl;
  final String? lostDate;
  final String? lostTime;
  final String? collectionCenter;
  final String userId;
  final String category;
  final bool claimed;
  final String? claimedId;
  final DateTime? claimedTime;
  final String? posterName;
  final String? posterId;
  final String? claimerName;

  CombinedLostFound({
    required this.id,
    required this.updatedAt,
    required this.status,
    required this.title,
    required this.description,
    required this.location,
    required this.imageUrl,
    required this.lostDate,
    required this.lostTime,
    required this.collectionCenter,
    required this.userId,
    required this.category,
    required this.claimed,
    required this.claimedId,
    required this.claimedTime,
    this.posterName,
    this.posterId,
    this.claimerName,
  });
}
