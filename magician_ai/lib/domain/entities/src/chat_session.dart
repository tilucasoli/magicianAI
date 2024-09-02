import '../entities.dart';

final class ChatSession {
  final List<Message> messages;
  final bool isAITyping;
  final String? model;
  final String? title;
  final String key;

  ChatSession({
    required this.key,
    required this.messages,
    this.isAITyping = false,
    this.model,
    this.title,
  });

  ChatSession copyWith({
    List<Message>? messages,
    bool? isAITyping,
    String? model,
    String? title,
  }) {
    return ChatSession(
      messages: messages ?? this.messages,
      isAITyping: isAITyping ?? this.isAITyping,
      model: model ?? this.model,
      title: title ?? this.title,
      key: key,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'messages': messages.map((message) => message.toJson()).toList(),
      'isAITyping': isAITyping,
      'model': model,
      'title': title,
    };
  }
}
