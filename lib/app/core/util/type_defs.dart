import 'package:dartz/dartz.dart';
import 'package:project/app/core/util/failures.dart';
import '../errors/failures.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef PermissionMap = Map<String, bool>;
typedef DataMap = Map<String, dynamic>;
