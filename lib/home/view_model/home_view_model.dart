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
  const HomeScreenInitial();
}

class HomeScreenLoading extends HomeScreenState {
  const HomeScreenLoading();
}

class HomeScreenError extends HomeScreenState {
  const HomeScreenError(this.error);

  final CarAuctionError error;

  String get errorMessage => error.message;

  HomeScreenError copyWith({CarAuctionError? error}) {
    return HomeScreenError(error ?? this.error);
  }
}

class HomeScreenCarAuctionLoaded extends HomeScreenState {
  const HomeScreenCarAuctionLoaded(this.data, this.choices);

  final CarAuctionData data;
  final Set<CarAuctionChoice> choices;

  HomeScreenCarAuctionLoaded copyWith({
    CarAuctionData? data,
    Set<CarAuctionChoice>? choices,
  }) {
    return HomeScreenCarAuctionLoaded(
      data ?? this.data,
      choices ?? this.choices,
    );
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
       _cosRepository = repository;

  static final _logger = Logger('HomeViewModel');
  final VNIValidationUseCase _vniValidationUseCase;
  final CosRepository _cosRepository;

  HomeScreenState _state = const HomeScreenInitial();
  HomeScreenState get state => _state;

  void onVniChanged(String value) {
    final validation = _vniValidationUseCase(value);

    if (validation != null) {
      _state = HomeScreenVNIError(validation);
    } else {
      _state = HomeScreenVNIValid();
      _fetchCarAuctionData();
    }

    notifyListeners();
  }

  Future<void> _fetchCarAuctionData() async {
    _state = const HomeScreenLoading();
    notifyListeners();

    try {
      final data = await _cosRepository.getCarAuction();

      if (_state case HomeScreenCarAuctionLoaded currentState when data is CarAuctionWithData) {
        _state = currentState.copyWith(data: data.data);
      } else if (_state case HomeScreenCarAuctionLoaded currentState when data is CarAuctionWithChoices) {
        _state = currentState.copyWith(choices: data.choices.toSet());
      } else if (data is CarAuctionWithError) {
        _state = HomeScreenError(data.error);
      }
    } catch (error, stackTrace) {
      _logger.severe('Error fetching car auction data', error, Chain.forTrace(stackTrace));
      _state = HomeScreenError(
        CarAuctionError(
          message: 'Fail to fetch car auction data with error: $error',
          id: 'fetch_error',
        ),
      );
    }

    notifyListeners();
  }
}
