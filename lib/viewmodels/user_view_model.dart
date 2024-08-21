import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/api_service.dart';

class UserViewModel extends ChangeNotifier {
  List<User> _users = [];
  bool _isLoading = false;
  String _errorMessage = "";

  List<User> get users => _users;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  final ApiService apiService = ApiService();

  Future<void> loadUsers() async {
    _isLoading = true;
    _errorMessage = "";
    notifyListeners();

    try {
      _users = await apiService.fetchUsers();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
