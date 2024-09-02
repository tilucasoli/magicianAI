import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magician_ai/domain/entities/entities.dart';

import '../../../services/llm_service.dart';

abstract class GenerateResponseUseCase {
  Future<Message> execute(String userInput);
}

class _GenerateResponseUseCaseImpl implements GenerateResponseUseCase {
  final LlmService _llmService;

  _GenerateResponseUseCaseImpl(this._llmService);

  @override
  Future<Message> execute(String userInput) {
    return _llmService.generateResponse(userInput);
  }
}

// final generateResponseUseCase = Provider<GenerateResponseUseCase>(
//   (ref) => _GenerateResponseUseCaseImpl(ref.read(llmServiceProvider)),
// );
