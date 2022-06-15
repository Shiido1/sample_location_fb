import 'package:flutter_location/core/folder/data/model.dart';
import 'package:flutter_location/core/network/network_service.dart';

import '../../../network/url_config.dart';
import '../../domain/entities.dart';

class AuthorizationService {
  final NetworkService _networkService;

  AuthorizationService({required NetworkService networkService})
      : _networkService = networkService;

  Future<InstantTripModel> instant(InstantTripEntity instantEntity) async {
    try {
      final response = await _networkService.call(
          UrlConfig.instant, RequestMethod.post,
          data: instantEntity.toJson());
      return InstantTripModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
