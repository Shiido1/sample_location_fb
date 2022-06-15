// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class InstantTripEntity extends Equatable {
  String? picklat;
  String? picklng;
  String? droplat;
  String? droplng;
  String? vehicletype;
  String? paymentopt;
  String? pickaddress;
  String? dropaddress;
  dynamic drivers;

  InstantTripEntity(
      {this.paymentopt,
      this.drivers,
      this.dropaddress,
      this.droplat,
      this.droplng,
      this.pickaddress,
      this.picklat,
      this.picklng,
      this.vehicletype});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["payment_opt"] = paymentopt;
    data["drivers"] = drivers;
    data["drop_address"] = dropaddress;
    data["drop_lat"] = droplat;
    data["drop_lng"] = droplng;
    data["pick_address"] = pickaddress;
    data["vehicle_type"] = vehicletype;
    data["pick_lat"] = picklat;
    data["pick_lng"] = picklng;
    return data;
  }

  @override
  List<Object?> get props => [];
}
