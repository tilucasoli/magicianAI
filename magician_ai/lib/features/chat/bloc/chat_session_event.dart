// Events
import '../../../domain/entities/src/message.dart';

sealed class ChatSessionEvent {}

final class ChatSessionEventLoadMessages extends ChatSessionEvent {
  final String id;

  ChatSessionEventLoadMessages({required this.id});
}

final class ChatSessionEventUserSendMessage extends ChatSessionEvent {
  final String message;

  ChatSessionEventUserSendMessage({required this.message});
}

final class ChatSessionEventUserReceiveMessage extends ChatSessionEvent {
  final Message message;

  ChatSessionEventUserReceiveMessage({required this.message});
}

final class ChatSessionEventStartChat extends ChatSessionEvent {}

final class ChatSessionChangeChat extends ChatSessionEvent {
  final String chatSessionId;

  ChatSessionChangeChat({
    required this.chatSessionId,
  });
}
