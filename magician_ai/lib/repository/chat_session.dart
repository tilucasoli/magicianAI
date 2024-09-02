import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:magician_ai/app/app_state.dart';

import '../domain/entities/src/chat_session.dart';

abstract interface class ChatSessionRepository {
  Future<void> create(String id);
  Future<ChatSession?> read(String id);
  Future<void> update(ChatSession chatSession);
  Future<void> delete(String id);
  Future<List<ChatSession>> getAll();
}

class ChatSessionRepositoryImpl implements ChatSessionRepository {
  @override
  Future<void> create(String id) {
    HydratedBloc.storage.read('$AppBloc')['sessions'] as List<dynamic>;
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<List<ChatSession>> getAll() {
    // TODO: implement getAllChatSessions
    throw UnimplementedError();
  }

  @override
  Future<ChatSession?> read(String id) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> update(ChatSession chatSession) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
