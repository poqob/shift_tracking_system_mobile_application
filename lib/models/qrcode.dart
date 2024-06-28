
import 'package:shift_tracking_system_mobile_application/models/actions.dart';

class QrCode {
  final int? id;
  final String? time;
  final String? code;
  final Actions? action;

  QrCode({
    this.id,
    this.time,
    this.code,
    this.action,
  });

  factory QrCode.parse(Map<String, dynamic> data) {
    return QrCode(
      id: data['id'] as int?,
      time: data['time'] as String?,
      code: data['code'] as String?,
      action: data['action'] != null ? Actions.parse(data['action']) : null,
    );
  }

  Map<String, dynamic> serialize() {
    return {
      'id': id,
      'time': time,
      'code': code,
      'action': action?.serialize(),
    };
  }
}
