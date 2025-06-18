import 'package:cos/data/repositories/cos_repository.dart';
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
  VehicleAuctionViewModel({required CosRepository repository}) : _repository = repository {
    _state = VehicleAuctionScreenStateLoading();
    notifyListeners();
    _repository
        .getAllCarAuctions()
        .then(
          (data) {
            _state = VehicleAuctionScreenStateLoaded(data);
            notifyListeners();
          },
        )
        .catchError(
          (error, stackTrace) {
            _logger.severe('Error fetching car auctions', error, stackTrace);
            _state = VehicleAuctionScreenStateError(error.toString());
            notifyListeners();
          },
        );
  }

  static final _logger = Logger('VehicleAuctionViewModel');
  final CosRepository _repository;

  VehicleAuctionScreenState _state = VehicleAuctionScreenStateInitial();
  VehicleAuctionScreenState get state => _state;
}
