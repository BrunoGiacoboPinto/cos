import 'package:cos/data/repositories/cos/cos_repository.dart';
import 'package:cos/domain/model/car_auction.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

sealed class VehicleAuctionScreenState {}

class VehicleAuctionScreenStateInitial extends VehicleAuctionScreenState {}

class VehicleAuctionScreenStateLoading extends VehicleAuctionScreenState {}

class VehicleAuctionScreenStateLoaded extends VehicleAuctionScreenState {
  VehicleAuctionScreenStateLoaded(this.data);

  final Map<String, CarAuctionModel> data;
}

class VehicleAuctionScreenStateError extends VehicleAuctionScreenState {
  VehicleAuctionScreenStateError(this.error);

  final String error;
}

class VehicleAuctionViewModel extends ChangeNotifier {
  VehicleAuctionViewModel({required CosRepository repository}) : _repository = repository;

  static final _logger = Logger('VehicleAuctionViewModel');
  final CosRepository _repository;

  VehicleAuctionScreenState _state = VehicleAuctionScreenStateInitial();
  VehicleAuctionScreenState get state => _state;

  Future<void> loadVehicleAuctionData() async {
    _state = VehicleAuctionScreenStateLoading();
    notifyListeners();

    try {
      final data = await _repository.getAllCarAuctions();
      _state = VehicleAuctionScreenStateLoaded(data);
    } catch (error, stackTrace) {
      _logger.severe('Error refreshing car auctions', error, stackTrace);
      _state = VehicleAuctionScreenStateError(error.toString());
    }

    notifyListeners();
  }
}
