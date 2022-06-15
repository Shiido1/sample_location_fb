import 'package:dartz/dartz.dart';
import 'package:flutter_location/core/error/failures.dart';
import 'package:flutter_location/core/folder/data/model.dart';
import 'package:flutter_location/core/folder/domain/entities.dart';

import '../../domain/repo.dart';
import '../source/ins_source.dart';

class AuthorizationRepositoryImpl implements AuthorizationRepository {
  final AuthorizationSourcesImpl? authorizationSources;

  AuthorizationRepositoryImpl(this.authorizationSources);

  @override
  Future<Either<Failure, InstantTripModel>> instant(
      InstantTripEntity instantEntity) async {
    return await _instantTrip(instantEntity);
  }

  Future<Either<Failure, InstantTripModel>> _instantTrip(
      InstantTripEntity instantEntity) async {
    try {
      final instant = await authorizationSources!.instant(instantEntity);

      /// Cache users information here
      // SessionManager.instance.authLogging = true;
      // SessionManager.instance.authToken = _login.data!.token!;
      // SessionManager.instance.userId = _login.data!.userId!;
      // SessionManager.instance.usersData = _login.data!.toJson();
      return Right(instant);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
