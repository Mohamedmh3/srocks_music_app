import 'package:flutter/foundation.dart';
import '../repositories/service_repository.dart';
import '../models/service.dart';

class HomeViewModel extends ChangeNotifier {
  final ServiceRepository _serviceRepository;
  List<Service> _services = [];
  bool _isLoading = true;
  String? _errorMessage;

  List<Service> get services => _services;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  HomeViewModel({required ServiceRepository serviceRepository})
    : _serviceRepository = serviceRepository {
    _listenToServices();
  }

  void _listenToServices() {
    _serviceRepository.getServices().listen(
      (serviceList) {
        _services = serviceList;
        _isLoading = false;
        _errorMessage = null;
        notifyListeners();
      },
      onError: (error) {
        _isLoading = false;
        _errorMessage = 'Failed to load services: $error';
        notifyListeners();
        debugPrint('Error fetching services: $error');
      },
    );
  }

  void onTapService(String serviceTitle) {
    debugPrint('ViewModel: Tapped on: $serviceTitle');
  }
}
