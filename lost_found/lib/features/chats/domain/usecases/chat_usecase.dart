import 'package:fpdart/fpdart.dart';
import 'package:lost_found/core/error/failures.dart';
import 'package:lost_found/core/usecase/usecase.dart';
import 'package:lost_found/features/chats/domain/entities/chat.dart';
import 'package:lost_found/features/chats/domain/repository/chat_repository.dart';

class ChatUsecase implements UseCase<Chat, ChatParams> {
  final ChatRepository chatRepository;
  ChatUsecase(this.chatRepository);

  @override
  Future<Either<Failure, Chat>> call(ChatParams params) async {
    return await chatRepository.sendChatsToBackend(
      updatedAt: params.updatedAt,
      content: params.content,
      senderId: params.senderId,
      recieverId: params.recieverId,
    );
  }
}

class ChatParams {
  final DateTime updatedAt;
  final String content;
  final String senderId;
  final String recieverId;

  ChatParams({
    required this.updatedAt,
    required this.content,
    required this.senderId,
    required this.recieverId,
  });
}
