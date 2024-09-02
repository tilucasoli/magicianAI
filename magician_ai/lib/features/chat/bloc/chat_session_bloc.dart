import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:magician_ai/domain/entities/entities.dart';
import 'package:magician_ai/services/llm_service.dart';

import '../../../domain/entities/src/chat_session.dart';
import 'chat_session_event.dart';
import 'chat_session_state.dart';

class ChatSessionBloc extends Bloc<ChatSessionEvent, ChatSessionState> {
  final LlmService llmService;

  final chatKey = UniqueKey();

  ChatSessionBloc(
    super.initialState, {
    required this.llmService,
  }) {
    on<ChatSessionEventUserSendMessage>(_onUserSendMessage);
    on<ChatSessionEventUserReceiveMessage>(_onUserReceiveMessage);
    on<ChatSessionEventStartChat>(_onStartChat);
    on<ChatSessionChangeChat>(_onChangeChat);

    add(ChatSessionEventStartChat());
  }

  void _onStartChat(
    ChatSessionEventStartChat event,
    Emitter<ChatSessionState> emit,
  ) async {
    llmService.setModel(state.data.model!);
    final answer =
        await llmService.generateResponse(state.data.messages.first.content);

    add(ChatSessionEventUserReceiveMessage(message: answer));
  }

  void _onUserSendMessage(
    ChatSessionEventUserSendMessage event,
    Emitter<ChatSessionState> emit,
  ) async {
    final message = Message(event.message, role: MessageRole.user);

    emit(
      state.copyWith(
        isAITyping: true,
        messages: [...state.data.messages, message],
        title: state.data.messages.firstOrNull?.content,
      ),
    );

    final answer = await llmService.generateResponse(event.message);

    add(ChatSessionEventUserReceiveMessage(message: answer));
  }

  void _onChangeChat(
    ChatSessionChangeChat event,
    Emitter<ChatSessionState> emit,
  ) async {
    print(HydratedBloc.storage.read('AppBloc')['sessions'] as List<dynamic>);

    emit(
      ChatSessionState(ChatSession(key: event.key, messages: event.messages)),
    );
  }

  void _onUserReceiveMessage(
    ChatSessionEventUserReceiveMessage event,
    Emitter<ChatSessionState> emit,
  ) async {
    emit(
      state.copyWith(
        isAITyping: false,
        messages: [
          ...state.data.messages,
          event.message,
        ],
      ),
    );
  }
}
