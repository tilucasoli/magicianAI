import 'dart:math';

import 'package:flutter/material.dart';
import 'package:magician_ai/domain/entities/entities.dart';
import 'package:bloc/bloc.dart';
import 'package:magician_ai/features/chat/bloc/chat_session_state.dart';
import 'package:uuid/uuid.dart';

import '../domain/entities/src/chat_session.dart';
import '../repository/chat_session.dart';
import '../services/database_services.dart';
import '../services/ollama_service.dart';

final class AppState {
  final List<ChatSessionState> sessions;
  final ChatSessionState? activeSession;
  final String? model;

  AppState({
    required this.sessions,
    this.activeSession,
    this.model,
  });

  AppState copyWith({
    List<ChatSessionState>? sessions,
    ChatSessionState? activeSession,
    String? model,
  }) {
    return AppState(
      sessions: sessions ?? this.sessions,
      activeSession: activeSession ?? this.activeSession,
      model: model ?? this.model,
    );
  }
}

final class AppEvent {}

final class AppEventLoadSessions extends AppEvent {
  AppEventLoadSessions();
}

final class AppEventNewChat extends AppEvent {
  AppEventNewChat();
}

final class AppEventStartChat extends AppEvent {
  final String model;
  final String message;

  AppEventStartChat({
    required this.model,
    required this.message,
  });
}

final class AppEventSelectChat extends AppEvent {
  final String chatId;

  AppEventSelectChat({required this.chatId});
}

final class AppEventChangeModel extends AppEvent {
  final String model;

  AppEventChangeModel({required this.model});
}

class AppBloc extends Bloc<AppEvent, AppState> {
  final ChatSessionRepository _chatSessionRepository;

  AppBloc(this._chatSessionRepository) : super(AppState(sessions: [])) {
    on<AppEventLoadSessions>(_onLoadSessions);
    on<AppEventNewChat>(_onNewChat);
    on<AppEventStartChat>(_onStartChat);
    on<AppEventSelectChat>(_onSelectChat);
    on<AppEventChangeModel>(_onChangeModel);

    add(AppEventLoadSessions());
  }

  void _onLoadSessions(
      AppEventLoadSessions event, Emitter<AppState> emit) async {
    final chatSessions = await _chatSessionRepository.loadAllChatSessions();
    // print(chatSessions.first.messages);

    emit(
      state.copyWith(
        sessions: chatSessions.map((e) => ChatSessionState(e)).toList(),
      ),
    );
  }

  void _onNewChat(AppEventNewChat event, Emitter<AppState> emit) {
    emit(
      AppState(
        activeSession: null,
        sessions: state.sessions,
        model: state.model,
      ),
    );
  }

  void _onStartChat(AppEventStartChat event, Emitter<AppState> emit) async {
    final id = Uuid().v4();

    await _chatSessionRepository.createNewChatSession(
      id: id,
      title: event.message,
      model: event.model,
      message: event.message,
    );

    add(AppEventSelectChat(chatId: id.toString()));
    add(AppEventLoadSessions());
  }

  void _onSelectChat(AppEventSelectChat event, Emitter<AppState> emit) async {
    final newChat = state.sessions
        .firstWhere((element) => element.data.chatSessionId == event.chatId);

    emit(
      state.copyWith(
        activeSession: newChat,
      ),
    );
  }

  void _onChangeModel(AppEventChangeModel event, Emitter<AppState> emit) {
    emit(
      state.copyWith(
        model: event.model,
      ),
    );
  }

  Future<List<String>> listAllModels() async {
    final ollamaService = OllamaServiceImpl();
    final availableModels = await ollamaService.listAvailableModels();
    // if (state.model == null) {
    //   model = availableModels.first;
    // }

    return availableModels;
  }
}
