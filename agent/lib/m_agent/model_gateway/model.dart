import 'package:meta/meta.dart';

@immutable
class ModelRequest {
  const ModelRequest({
    required this.model,
    required this.input,
    this.systemPrompt,
    this.temperature,
    this.maxOutputTokens,
    this.metadata = const <String, Object?>{},
  });

  final String model;
  final String input;
  final String? systemPrompt;
  final double? temperature;
  final int? maxOutputTokens;
  final Map<String, Object?> metadata;
}

@immutable
class ModelResponse {
  const ModelResponse({
    required this.provider,
    required this.model,
    required this.output,
    this.finishReason,
    this.usage,
  });

  final String provider;
  final String model;
  final String output;
  final String? finishReason;
  final ModelUsage? usage;
}

@immutable
class ModelUsage {
  const ModelUsage({
    this.inputTokens,
    this.outputTokens,
    this.totalTokens,
  });

  final int? inputTokens;
  final int? outputTokens;
  final int? totalTokens;
}

@immutable
class ModelStreamChunk {
  const ModelStreamChunk({
    required this.text,
    this.isFinal = false,
  });

  final String text;
  final bool isFinal;
}
