part of 'user_chats_bloc.dart';

@immutable
sealed class UserChatsState {}

final class UserChatsInitial extends UserChatsState {}

final class UserChatsLoading extends UserChatsState {}

final class UserChatsFailure extends UserChatsState {
  final String message;
  UserChatsFailure(this.message);
}

final class UserChatsSuccess extends UserChatsState {
  final Chat chats;
  UserChatsSuccess(this.chats);
}

// final class UserChatInformationSuccess extends UserChatsState {
//   final List<Chat> chats;
//   UserChatInformationSuccess(this.chats);
// }

// final class UserChatsLoaded extends UserChatsState {
//   final List<Chat> chats;
//   UserChatsLoaded(this.chats);
// }
