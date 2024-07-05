import 'package:fpdart/fpdart.dart';
import 'package:lost_found/core/error/exceptions.dart';
import 'package:lost_found/core/error/failures.dart';
import 'package:lost_found/core/utils/generate_chat_id.dart';
import 'package:lost_found/features/chats/data/datasources/chat_remote_data_source.dart';
import 'package:lost_found/features/chats/data/models/chat_model.dart';
import 'package:lost_found/features/chats/domain/entities/chat.dart';
import 'package:lost_found/features/chats/domain/repository/chat_repository.dart';
import 'package:uuid/uuid.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource chatRemoteDataSource;

  ChatRepositoryImpl(this.chatRemoteDataSource);

  @override
  Future<Either<Failure, Chat>> sendChatsToBackend({
    required DateTime updatedAt,
    required String content,
    required String senderId,
    required String recieverId,
  }) async {
    try {
      final generatedChatId = generateChatId(senderId, recieverId);

      final ChatModel chats = ChatModel(
        id: const Uuid().v4(),
        updatedAt: DateTime.now(),
        content: content,
        generatedId: generatedChatId,
        senderId: senderId,
      );

      final res = await chatRemoteDataSource.uploadChats(chats);

      return right(res);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  /*
  @override
  Stream<List<Chat>> streamChats() {
    try {
      return chatRemoteDataSource.streamChats();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Either<Failure, List<Chat>>> getUserChats() async {
    try {
      final userChats = await chatRemoteDataSource.getUserChats();

      return right(userChats);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  */
}
