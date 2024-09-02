import '../../../domain/entities/src/chat_session.dart';
import '../../../domain/entities/src/message.dart';

// States

final class ChatSessionState {
  final ChatSession data;

  ChatSessionState(this.data);

  ChatSessionState copyWith({
    List<Message>? messages,
    bool? isAITyping,
    String? model,
    String? title,
  }) {
    return ChatSessionState(
      data.copyWith(
        messages: messages,
        isAITyping: isAITyping,
        model: model,
        title: title,
      ),
    );
  }
}
