// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

enum Status { initial, loading, loaded, error }

class AppState<T> extends Equatable {
  final Status status;
  final String? message;
  final T? data;
  AppState({
    required this.status,
    this.message,
    this.data,
  });

  AppState<T> copyWith({
    Status? status,
    String? message,
    T? data,
  }) {
    return AppState<T>(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  bool operator ==(covariant AppState<T> other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status &&
      other.message == message &&
      other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;

  @override
  List<Object?> get props => [status, message, data];
}
