import 'package:json_annotation/json_annotation.dart';

import '../../constants.dart';
import '../enums/status.dart';

part 'acquiring_response.g.dart';

/// Базовый класс ответа Acquiring API
@JsonSerializable()
class AcquiringResponse {
  /// Базовый класс ответа Acquiring API
  AcquiringResponse({
    this.success,
    this.status,
    this.errorCode,
    this.message,
    this.details,
  });

  /// Преобразование json в модель
  factory AcquiringResponse.fromJson(Map<String, dynamic> json) =>
      _$AcquiringResponseFromJson(json);

  /// Выполнение операции
  @JsonKey(name: JsonKeys.success)
  final bool success;

  /// Статус платежа
  @JsonKey(name: JsonKeys.status)
  final Status status;

  /// Код ошибки
  ///
  /// Если ошибки не произошло, передается значение «0»
  @JsonKey(name: JsonKeys.errorCode)
  final String errorCode;

  /// Краткое описание ошибки
  @JsonKey(name: JsonKeys.message)
  final String message;

  /// Подробное описание ошибки
  @JsonKey(name: JsonKeys.details)
  final String details;
}
