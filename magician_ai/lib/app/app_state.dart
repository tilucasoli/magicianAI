import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:magician_ai/domain/entities/entities.dart';
import 'package:magician_ai/features/chat/bloc/chat_session_state.dart';

import '../domain/entities/src/chat_session.dart';
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

class AppBloc extends HydratedBloc<AppEvent, AppState> {
  AppBloc() : super(AppState(sessions: [])) {
    on<AppEventNewChat>(_onNewChat);
    on<AppEventStartChat>(_onStartChat);
    on<AppEventSelectChat>(_onAccessChat);
    on<AppEventChangeModel>(_onChangeModel);
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

  void _onStartChat(AppEventStartChat event, Emitter<AppState> emit) {
    final chatKey = UniqueKey();
    emit(
      state.copyWith(
        sessions: [
          ...state.sessions,
          ChatSessionState(
            ChatSession(
              messages: [
                Message(event.message, role: MessageRole.user),
              ],
              key: chatKey.toString(),
              model: event.model,
              title: event.message,
              isAITyping: true,
            ),
          ),
        ],
      ),
    );

    add(AppEventSelectChat(chatId: chatKey.toString()));
  }

  void _onAccessChat(AppEventSelectChat event, Emitter<AppState> emit) {
    emit(
      state.copyWith(
        activeSession: state.sessions.firstWhere(
          (session) => session.data.key.toString() == event.chatId,
        ),
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

  @override
  AppState? fromJson(Map<String, dynamic> json) {
    print('AppBloc.fromJson: $json');
    return AppState(
      sessions: json['sessions'] ?? [],
      model: json['model'],
    );
  }

  @override
  Map<String, dynamic>? toJson(AppState state) {
    print('AppBloc.toJson: ${state.model}');
    return {
      'sessions': state.sessions.map((e) => e.data.toJson()).toList(),
      'model': state.model,
    };
  }
}
