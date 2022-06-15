import 'package:flutter_location/core/folder/data/model.dart';

import '../../domain/entities.dart';
import '../service/ins_service.dart';

abstract class AuthorizationSources {
  Future<InstantTripModel> instant(InstantTripEntity instantEntity);
}

class AuthorizationSourcesImpl implements AuthorizationSources {
  final AuthorizationService _authorizationService;

  AuthorizationSourcesImpl({required AuthorizationService authorizationService})
      : _authorizationService = authorizationService;

  @override
  Future<InstantTripModel> instant(InstantTripEntity instantEntity) =>
      _authorizationService.instant(instantEntity);
}
