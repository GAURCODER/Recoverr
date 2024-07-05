import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_found/features/chats/domain/usecases/chat_usecase.dart';
import 'package:lost_found/features/chats/domain/entities/chat.dart';
// import 'package:lost_found/core/usecase/streaming.dart';
// import 'package:lost_found/core/usecase/usecase.dart';
// import 'package:lost_found/features/chats/domain/usecases/chat_information.dart';
// import 'package:lost_found/features/chats/domain/usecases/chat_streaming_usecase.dart';

part 'user_chats_event.dart';
part 'user_chats_state.dart';

class UserChatsBloc extends Bloc<UserChatsEvent, UserChatsState> {
  final ChatUsecase _chatUsecase;
  // final ChatInformation _chatInformation;
  // final ChatStreamingUseCase _chatStream;
  // StreamSubscription<List<Chat>>? _chatSubscription;

  UserChatsBloc({
    required ChatUsecase chatUsecase,
    // required ChatInformation chatInformation,
    // required ChatStreamingUseCase chatStream,
  })  : _chatUsecase = chatUsecase,
        // _chatInformation = chatInformation,
        // _chatStream = chatStream,
        super(UserChatsInitial()) {
    on<UserChatsEvent>((event, emit) => emit(UserChatsLoading()));
    on<UserChatMessagesBloc>(_userChatMessageUpload);
    // on<UserChatInformationBloc>(_getUserChatMessage);
    // on<UserChatStreamBloc>(_streamRealTime);
  }

  void _userChatMessageUpload(
      UserChatMessagesBloc event, Emitter<UserChatsState> emit) async {
    final res = await _chatUsecase(
      ChatParams(
        updatedAt: event.updatedAt,
        content: event.content,
        senderId: event.senderId,
        recieverId: event.recieverId,
      ),
    );

    res.fold(
      (l) => emit(UserChatsFailure(l.message)),
      (r) => emit(UserChatsSuccess(r)),
    );
  }

  /*
  Future<void> _streamRealTime(
      UserChatStreamBloc event, Emitter<UserChatsState> emit) async {
    await _chatSubscription?.cancel();
    _chatSubscription = _chatStream(StreamParams()).listen(
      (List<Chat> chats) {
        if (!emit.isDone) {
          // print("State");
          emit(UserChatsLoaded(chats));
        }
      },
      onError: (error) {
        if (!emit.isDone) {
          emit(UserChatsFailure(error.toString()));
        }
      },
    );
  }

  @override
  Future<void> close() {
    _chatSubscription
        ?.cancel(); // Make sure to cancel subscription on bloc close
    return super.close();
  }

  void _getUserChatMessage(
      UserChatInformationBloc event, Emitter<UserChatsState> emit) async {
    final res = await _chatInformation(NoParams());

    res.fold(
      (l) => emit(UserChatsFailure(l.message)),
      (r) => emit(UserChatInformationSuccess(r)),
    );
  }
  */
}
