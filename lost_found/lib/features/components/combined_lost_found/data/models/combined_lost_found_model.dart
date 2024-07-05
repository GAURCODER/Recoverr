import 'package:lost_found/features/components/combined_lost_found/domain/entities/combined_lost_found.dart';

class CombinedLostFoundModel extends CombinedLostFound {
  CombinedLostFoundModel({
    required super.id,
    required super.updatedAt,
    required super.status,
    required super.title,
    required super.description,
    required super.location,
    required super.imageUrl,
    required super.lostDate,
    required super.lostTime,
    required super.collectionCenter,
    required super.userId,
    required super.category,
    required super.claimed,
    required super.claimedId,
    required super.claimedTime,
    super.posterName,
    super.posterId,
    super.claimerName,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'updated_at': updatedAt.toIso8601String(),
      'status': status,
      'title': title,
      'description': description,
      'location': location,
      'image_url': imageUrl,
      'lost_date': lostDate,
      'lost_time': lostTime,
      'collection_center': collectionCenter,
      'user_id': userId,
      'category': category,
      'claimed': claimed,
      'claimed_id': claimedId,
      'claimed_time': claimedTime!.toIso8601String(),
    };
  }

  factory CombinedLostFoundModel.fromJson(Map<String, dynamic> map) {
    return CombinedLostFoundModel(
      id: map['id'],
      updatedAt: map['updated_at'] == null
          ? DateTime.now()
          : DateTime.parse(
              map['updated_at'] as String,
            ),
      status: map['status'],
      title: map['title'] as String,
      description: map['description'] as String,
      location: map['location'] as String,
      imageUrl: map['image_url'] as String,
      lostDate: map['lost_date'] as String,
      lostTime: map['lost_time'] as String,
      collectionCenter: map['collection_center'] as String,
      userId: map['user_id'] as String,
      category: map['category'] as String,
      claimed: map['claimed'] as bool,
      claimedId: map['claimed_id'] as String,
      claimedTime: map['claimed_time'] == null
          ? DateTime.now()
          : DateTime.parse(
              map['claimed_time'] as String,
            ),
    );
  }

  CombinedLostFoundModel copyWith({
    String? id,
    DateTime? updatedAt,
    String? status,
    String? title,
    String? description,
    String? location,
    String? imageUrl,
    String? lostDate,
    String? lostTime,
    String? collectionCenter,
    String? userId,
    String? category,
    bool? claimed,
    String? posterName,
    String? posterId,
    String? claimedId,
    DateTime? claimedTime,
    String? claimerName,
  }) {
    return CombinedLostFoundModel(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      status: status ?? this.status,
      title: title ?? this.title,
      description: description ?? this.description,
      location: location ?? this.location,
      imageUrl: imageUrl ?? this.imageUrl,
      lostDate: lostDate ?? this.lostDate,
      lostTime: lostTime ?? this.lostTime,
      collectionCenter: collectionCenter ?? this.collectionCenter,
      userId: userId ?? this.userId,
      category: category ?? this.category,
      claimed: claimed ?? this.claimed,
      claimedId: claimedId ?? this.claimedId,
      claimedTime: claimedTime ?? this.claimedTime,
      posterName: posterName ?? this.posterName,
      posterId: posterId ?? this.posterId,
      claimerName: claimerName ?? this.claimerName,
    );
  }
}
