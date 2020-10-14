import 'package:json_annotation/json_annotation.dart';

import '../../constants.dart';
import '../base/acquiring_response.dart';
import '../enums/status.dart';

part 'cancel_response.g.dart';

/// Ответ от сервера на отмену платежа
///
/// [CancelResponse](https://oplata.tinkoff.ru/develop/api/payments/cancel-response/)
@JsonSerializable()
class CancelResponse extends AcquiringResponse {
  /// Создает экземпляр ответа от сервера на отмену платежа
  CancelResponse({
    Status status,
    bool success,
    String errorCode,
    String message,
    String details,
    this.terminalKey,
    this.orderId,
    this.paymentId,
    this.originalAmount,
    this.newAmount,
  }) : super(
          status: status,
          success: success,
          errorCode: errorCode,
          message: message,
          details: details,
        );

  /// Преобразование json в модель
  factory CancelResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelResponseFromJson(json);

  @override
  String toString() {
    return 'CancelResponse(terminalKey: $terminalKey, orderId: $orderId, success: $success, status: $status, paymentId: $paymentId, errorCode: $errorCode, message: $message, details: $details, originalAmount: $originalAmount, newAmount: $newAmount)';
  }

  /// Преобразование модели в json
  Map<String, dynamic> toJson() => _$CancelResponseToJson(this);

  /// Идентификатор терминала.
  /// Выдается продавцу банком при заведении терминала
  @JsonKey(name: JsonKeys.terminalKey)
  final String terminalKey;

  /// Идентификатор заказа в системе продавца
  @JsonKey(name: JsonKeys.orderId)
  final String orderId;

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.paymentId)
  final String paymentId;

  /// Сумма до возврата в копейках
  @JsonKey(name: JsonKeys.originalAmount)
  final int originalAmount;

  /// Сумма после возврата в копейках
  @JsonKey(name: JsonKeys.newAmount)
  final int newAmount;
}
