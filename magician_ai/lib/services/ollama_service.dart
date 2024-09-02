import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ollama_dart/ollama_dart.dart';

abstract interface class OllamaService {
  Future<List<String>> listAvailableModels();
  Stream<GenerateChatCompletionResponse> generate(
      String prompt, String model, List<Message> messages);
}

class OllamaServiceImpl implements OllamaService {
  final client = OllamaClient();

  @override
  Future<List<String>> listAvailableModels() async {
    final models = await client.listModels();
    // TODO Create a error handling for this
    return models.models!.map((e) => e.model ?? '').toList();
  }

  Stream<GenerateChatCompletionResponse> generate(
      String prompt, String model, List<Message> messages) {
    return client.generateChatCompletionStream(
      request: GenerateChatCompletionRequest(
        model: model,
        messages: messages,
        stream: true,
      ),
    );
  }
}

final ollamaServiceProvider = Provider<OllamaService>(
  (ref) => OllamaServiceImpl(),
);
