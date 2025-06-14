import 'package:flutter/material.dart';

import 'vni_use_case.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({
    required VNIValidationUseCase vniValidationUseCase,
  }) : _vniValidationUseCase = vniValidationUseCase;

  final VNIValidationUseCase _vniValidationUseCase;

  String _vni = '';
  String? _vniError;

  String get vni => _vni;
  String? get vniError => _vniError;

  void onVniChanged(String value) {
    _vni = value;
    _vniError = _vniValidationUseCase(_vni);
    notifyListeners();
  }

  void clearVni() {
    _vni = '';
    _vniError = null;
    notifyListeners();
  }
}
