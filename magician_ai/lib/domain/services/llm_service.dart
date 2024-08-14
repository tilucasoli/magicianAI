import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:langchain/langchain.dart';
import 'package:langchain_ollama/langchain_ollama.dart';

import '../entities/entities.dart';

abstract interface class LlmService {
  Future<Message> generateResponse(String userInput);
}

class _LocalLlmServiceImpl implements LlmService {
  final BaseLanguageModel llm;
  final history = ChatMessageHistory();

  _LocalLlmServiceImpl(this.llm);

  @override
  Future<Message> generateResponse(String userInput) async {
    final conversation = ConversationChain(
      llm: llm,
      memory: ConversationBufferMemory(chatHistory: history),
    );
    print(userInput);
    final result = await conversation.run(userInput);

    debugPrint(result);
    return Message(result, role: MessageRole.ai);
  }

  // void _addMessage(Message message) {
  //   if (message.role == ChatMessageRole.human) {
  //     history.addHumanChatMessage(message.content);
  //     return;
  //   }
  //   history.addAIChatMessage(message.content);
  // }
}

final llmServiceProvider = Provider<LlmService>(
  (ref) => _LocalLlmServiceImpl(
    Ollama(defaultOptions: OllamaOptions(model: 'llama3')),
  ),
);
