import 'package:dartz/dartz.dart';
import 'package:flutter_location/core/folder/domain/entities.dart';

import '../../error/failures.dart';
import '../data/model.dart';

abstract class AuthorizationRepository {
  Future<Either<Failure, InstantTripModel>> instant(
      InstantTripEntity instantEntity);
}
