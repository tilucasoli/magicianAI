import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magician_ai/domain/entities/entities.dart';
import 'package:magician_ai/repository/chat_session.dart';
import 'package:magician_ai/services/llm_service.dart';

import 'chat_session_event.dart';
import 'chat_session_state.dart';

class ChatSessionBloc extends Bloc<ChatSessionEvent, ChatSessionState> {
  final LlmService llmService;
  final ChatSessionRepository chatSessionRepository;

  final chatKey = UniqueKey();

  ChatSessionBloc(
    super.initialState, {
    required this.llmService,
    required this.chatSessionRepository,
  }) {
    on<ChatSessionEventUserSendMessage>(_onUserSendMessage);
    on<ChatSessionEventUserReceiveMessage>(_onUserReceiveMessage);
    on<ChatSessionEventStartChat>(_onStartChat);
    on<ChatSessionChangeChat>(_onChangeChat);
    on<ChatSessionEventLoadMessages>(_onLoadSession);

    add(ChatSessionEventStartChat());
  }

  void _onStartChat(
    ChatSessionEventStartChat event,
    Emitter<ChatSessionState> emit,
  ) async {
    final session = (await chatSessionRepository.loadChatSession(
      state.data.chatSessionId,
    ))!;

    llmService.setModel(session.model!);

    final answer =
        await llmService.generateResponse(session.messages.first.content!);

    add(ChatSessionEventUserReceiveMessage(message: answer));
  }

  void _onLoadSession(
    ChatSessionEventLoadMessages event,
    Emitter<ChatSessionState> emit,
  ) async {
    final chatSession = await chatSessionRepository.loadChatSession(event.id);

    emit(
      state.copyWith(
        data: state.data.copyWith(
          title: chatSession!.title,
          model: chatSession.model,
          messages: chatSession.messages,
        ),
      ),
    );
  }

  void _onUserSendMessage(
    ChatSessionEventUserSendMessage event,
    Emitter<ChatSessionState> emit,
  ) async {
    final message = Message()
      ..content = event.message
      ..role = MessageRole.user;

    final sessionUpdated = state.data.copyWith(
      messages: [
        ...state.data.messages,
        message,
      ],
    );

    await chatSessionRepository.saveChatSession(sessionUpdated);

    add(ChatSessionEventLoadMessages(id: state.data.chatSessionId));

    final answer = await llmService.generateResponse(event.message);

    add(ChatSessionEventUserReceiveMessage(message: answer));
  }

  void _onChangeChat(
    ChatSessionChangeChat event,
    Emitter<ChatSessionState> emit,
  ) async {
    final chatSession =
        await chatSessionRepository.loadChatSession(event.chatSessionId);

    emit(
      ChatSessionState(chatSession!),
    );
  }

  void _onUserReceiveMessage(
    ChatSessionEventUserReceiveMessage event,
    Emitter<ChatSessionState> emit,
  ) async {
    final sessionUpdated = state.data.copyWith(
      messages: [
        ...state.data.messages,
        event.message,
      ],
    );

    await chatSessionRepository.saveChatSession(sessionUpdated);

    add(ChatSessionEventLoadMessages(id: state.data.chatSessionId));
  }
}
