part of 'user_chats_bloc.dart';

@immutable
sealed class UserChatsEvent {}

final class UserChatMessagesBloc extends UserChatsEvent {
  final DateTime updatedAt;
  final String content;
  final String senderId;
  final String recieverId;

  UserChatMessagesBloc({
    required this.updatedAt,
    required this.content,
    required this.senderId,
    required this.recieverId,
  });
}

// final class UserChatInformationBloc extends UserChatsEvent {}

// final class UserChatStreamBloc extends UserChatsEvent {}
