import 'dart:collection';

import 'package:cos/data/repositories/cos_repository.dart';
import 'package:cos/domain/model/car_auction.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:stack_trace/stack_trace.dart';

import 'vni_use_case.dart';

sealed class HomeScreenState {
  const HomeScreenState();
}

class HomeScreenInitial extends HomeScreenState {
  const HomeScreenInitial(this.data);

  final Map<String, CarAuctionModel> data;
}

class HomeScreenLoading extends HomeScreenState {
  const HomeScreenLoading();
}

class HomeScreenError extends HomeScreenState {
  const HomeScreenError(this.error);

  final CarAuctionErrorModel error;

  String get errorMessage => error.message;

  HomeScreenError copyWith({CarAuctionErrorModel? error}) {
    return HomeScreenError(error ?? this.error);
  }
}

class HomeScreenCarAuctionLoaded extends HomeScreenState {
  const HomeScreenCarAuctionLoaded(this.data);

  final CarAuctionModel data;

  HomeScreenCarAuctionLoaded copyWith({CarAuctionModel? data}) {
    return HomeScreenCarAuctionLoaded(data ?? this.data);
  }
}

class HomeScreenVNIValid extends HomeScreenState {}

class HomeScreenVNIError extends HomeScreenState {
  const HomeScreenVNIError(this.error);

  final String error;

  HomeScreenVNIError copyWith({String? error}) {
    return HomeScreenVNIError(error ?? this.error);
  }
}

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({
    required VNIValidationUseCase vniValidationUseCase,
    required CosRepository repository,
  }) : _vniValidationUseCase = vniValidationUseCase,
       _cosRepository = repository {
    repository
        .getAllCarAuctions()
        .then((data) {
          _state = HomeScreenInitial(data);
          notifyListeners();
        })
        .catchError((error, stackTrace) {
          _logger.severe('Error fetching initial car auctions', error, Chain.forTrace(stackTrace));
          _state = HomeScreenError(
            CarAuctionErrorModel(
              message: error.toString(),
              id: 'initial_fetch_error',
            ),
          );
          notifyListeners();
        });
  }

  static final _logger = Logger('HomeViewModel');
  final VNIValidationUseCase _vniValidationUseCase;
  final CosRepository _cosRepository;

  HomeScreenState _state = const HomeScreenLoading();
  HomeScreenState get state => _state;

  void onVniChanged(String value) {
    final validation = _vniValidationUseCase(value);

    if (validation != null) {
      _state = HomeScreenVNIError(validation);
    } else {
      _state = HomeScreenVNIValid();
      _fetchCarAuctionData(value);
    }

    notifyListeners();
  }

  Future<void> _fetchCarAuctionData(String key) async {
    _state = const HomeScreenLoading();
    notifyListeners();

    try {
      final data = await _cosRepository.getCarAuction(key: key);

      if (data case CarAuctionWithChoices(choices: final choices)) {
        if (_state case HomeScreenCarAuctionLoaded(data: final data) when data is CarAuctionWithChoices) {
          _state = HomeScreenCarAuctionLoaded(
            CarAuctionWithChoices(
              SplayTreeSet<CarAuctionChoiceModel>.from(
                data.choices.union(choices),
                (a, b) => a.compareTo(b),
              ),
            ),
          );
        } else {
          _state = HomeScreenCarAuctionLoaded(data);
        }
      } else {
        _logger.info('Received (${data.runtimeType}): $data');
        _state = HomeScreenCarAuctionLoaded(
          data ??
              CarAuctionModel.error(
                CarAuctionErrorModel(
                  message: 'No data found for key: $key',
                  id: 'no_data',
                ),
              ),
        );
      }
    } catch (error, stackTrace) {
      _logger.severe('Error fetching car auction data', error, Chain.forTrace(stackTrace));
      _state = HomeScreenError(
        CarAuctionErrorModel(
          message: error.toString(),
          id: 'fetch_error',
        ),
      );
    }

    notifyListeners();
  }
}
