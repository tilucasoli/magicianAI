import '../../../domain/entities/src/chat_session.dart';
import '../../../domain/entities/src/message.dart';

final class ChatSessionState {
  final ChatSession data;
  final bool isAITyping;

  ChatSessionState(this.data)
      : isAITyping = data.messages.last.role == MessageRole.user;

  ChatSessionState copyWith({
    ChatSession? data,
  }) {
    return ChatSessionState(
      data ?? this.data,
    );
  }
}
