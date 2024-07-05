class Chat {
  final String id;
  final DateTime updatedAt;
  final String content;
  final String generatedId;
  final String senderId;

  Chat({
    required this.id,
    required this.updatedAt,
    required this.content,
    required this.generatedId,
    required this.senderId,
  });
}
