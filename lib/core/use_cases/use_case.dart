import 'package:dartz/dartz.dart';
import '../errors/failure.dart';

abstract class UseCase<T, int> {
  Future<Either<Failure, T>> call([int pageNo]);
}
