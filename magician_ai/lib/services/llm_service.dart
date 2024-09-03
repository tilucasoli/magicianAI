import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:langchain/langchain.dart';
import 'package:langchain_ollama/langchain_ollama.dart';

import '../domain/entities/entities.dart';

abstract interface class LlmService {
  Future<Message> generateResponse(String userInput);
  void setModel(String model);
}

class LocalLlmServiceImpl implements LlmService {
  BaseLanguageModel? llm;
  final history = ChatMessageHistory();

  LocalLlmServiceImpl();

  @override
  Future<Message> generateResponse(String userInput) async {
    print('User input: $userInput');
    final messages = await history.getChatMessages();
    print(messages.map((e) => e.contentAsString).toList());
    final conversation = ConversationChain(
      llm: llm!,
      memory: ConversationBufferMemory(chatHistory: history),
    );

    final result = await conversation.run(userInput);
    print('AI output: $result');
    final message = Message()
      ..content = result
      ..role = MessageRole.ai;
    return message;
  }

  @override
  void setModel(String model) {
    llm = Ollama(defaultOptions: OllamaOptions(model: model));
  }
}
