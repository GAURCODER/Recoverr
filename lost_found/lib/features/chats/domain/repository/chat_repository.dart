import 'package:fpdart/fpdart.dart';
import 'package:lost_found/core/error/failures.dart';
import 'package:lost_found/features/chats/domain/entities/chat.dart';

abstract interface class ChatRepository {
  Future<Either<Failure, Chat>> sendChatsToBackend({
    required DateTime updatedAt,
    required String content,
    required String senderId,
    required String recieverId,
  });
  // Future<Either<Failure, List<Chat>>> getUserChats();
  // Stream<List<Chat>> streamChats();
}
