import 'package:lost_found/features/chats/domain/entities/chat.dart';

class ChatModel extends Chat {
  ChatModel({
    required super.id,
    required super.updatedAt,
    required super.content,
    required super.generatedId,
    required super.senderId,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'updated_at': updatedAt.toIso8601String(),
      'content': content,
      'generated_id': generatedId,
      'sender_id': senderId,
    };
  }

  factory ChatModel.fromJson(Map<String, dynamic> map) {
    return ChatModel(
      id: map['id'] as String,
      updatedAt: map['updated_at'] == null
          ? DateTime.now()
          : DateTime.parse(map['updated_at'] as String),
      content: map['content'] as String,
      generatedId: map['generated_id'] as String,
      senderId: map['sender_id'] as String,
    );
  }

  ChatModel copyWith({
    String? id,
    DateTime? updatedAt,
    String? content,
    String? generatedId,
    String? senderId,
  }) {
    return ChatModel(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      content: content ?? this.content,
      generatedId: generatedId ?? this.generatedId,
      senderId: senderId ?? this.senderId,
    );
  }
}
