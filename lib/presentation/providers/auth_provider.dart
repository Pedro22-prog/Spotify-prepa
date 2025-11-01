import 'package:flutter/material.dart';
import 'package:spotify_prepa/data/repositories/auth_repository_impl.dart';
import 'package:spotify_prepa/data/sources/firebase_auth_datasource.dart';
import 'package:spotify_prepa/domain/entities/user.dart';
import 'package:spotify_prepa/domain/usecases/signin_usecase.dart';
import 'package:spotify_prepa/domain/usecases/signup_usecase.dart';

class AuthProvider extends ChangeNotifier {
  late final AuthRepositoryImpl _repository;
  
  User? _currentUser;
  bool _isLoading = false;
  String? _errorMessage;

  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isAuthenticated => _currentUser != null;

  AuthProvider() {
    _repository = AuthRepositoryImpl(FirebaseAuthDataSourceImpl());
    _initAuthListener();
  }

  void _initAuthListener() {
    _repository.authStateChanges.listen((user) {
      _currentUser = user;
      notifyListeners();
    });
  }

  Future<bool> signIn(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final signInUseCase = SignInUseCase(_repository);
      final user = await signInUseCase(email, password);
      
      if (user != null) {
        _currentUser = user;
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = 'Credenciales inválidas';
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> signUp(String fullName, String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final signUpUseCase = SignUpUseCase(_repository);
      final user = await signUpUseCase(fullName, email, password);
      
      if (user != null) {
        _currentUser = user;
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = 'Error al crear la cuenta';
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> signOut() async {
    await _repository.signOut();
    _currentUser = null;
    notifyListeners();
  }

  Future<void> checkAuthStatus() async {
    _isLoading = true;
    notifyListeners();

    try {
      _currentUser = await _repository.getCurrentUser();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
