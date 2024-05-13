import 'package:equatable/equatable.dart';
import 'package:project/app/core/util/exception.dart';

abstract class Failure extends Equatable {
  const Failure({required this.message});

  final String message;

  String get errorMessage => 'Error: $message';

  @override
  List<dynamic> get props => [message];
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message});
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});

  ServerFailure.fromException(ServerException exception)
      : this(message: exception.message);
}
