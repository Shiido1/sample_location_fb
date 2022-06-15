import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_location/core/folder/data/model.dart';
import 'package:flutter_location/core/folder/data/repo/repo.dart';

import '../../error/failures.dart';
import '../../usecases/usecase.dart';
import 'entities.dart';
import 'package:meta/meta.dart';

class InstantUseCase implements UseCase<InstantTripEntity, Params> {
  final AuthorizationRepositoryImpl repository;

  InstantUseCase(this.repository);

  @override
  Future<Either<Failure, InstantTripModel>> call(Params params) async {
    return await repository.instant(params.instantTripEntity!);
  }
}

class Params extends Equatable {
  final InstantTripEntity? instantTripEntity;

  const Params({@required this.instantTripEntity});

  @override
  List<Object> get props => [instantTripEntity!];
}
