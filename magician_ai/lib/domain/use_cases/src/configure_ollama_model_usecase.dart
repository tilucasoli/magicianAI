import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magician_ai/services/ollama_service.dart';

import '../../../services/llm_service.dart';

abstract class ConfigureOllamaModelUseCase {
  Future<List<String>> execute();
  void setModel(String model);
}

class _ConfigureOllamaModelUseCaseImpl implements ConfigureOllamaModelUseCase {
  final OllamaService _ollamaService;
  final LlmService _llmService;

  _ConfigureOllamaModelUseCaseImpl(this._ollamaService, this._llmService);

  @override
  Future<List<String>> execute() {
    return _ollamaService.listAvailableModels();
  }

  @override
  void setModel(String model) {
    return _llmService.setModel(model);
  }
}

// final configureOllamaModelUseCase = Provider<ConfigureOllamaModelUseCase>(
//   (ref) => _ConfigureOllamaModelUseCaseImpl(
//     ref.read(ollamaServiceProvider),
//     ref.read(llmServiceProvider),
//   ),
// );
