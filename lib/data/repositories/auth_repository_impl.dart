import 'package:spotify_prepa/data/sources/firebase_auth_datasource.dart';
import 'package:spotify_prepa/domain/entities/user.dart' as domain;
import 'package:spotify_prepa/domain/repository/authrepository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);

  @override
  Future<domain.User?> signIn(String email, String password) async {
    try {
      final userModel = await _dataSource.signInWithEmailAndPassword(
        email,
        password,
      );
      return userModel;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<domain.User?> signUp(
    String fullName,
    String email,
    String password,
  ) async {
    try {
      final userModel = await _dataSource.signUpWithEmailAndPassword(
        fullName,
        email,
        password,
      );
      return userModel;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _dataSource.signOut();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<domain.User?> getCurrentUser() async {
    try {
      final userModel = await _dataSource.getCurrentUser();
      return userModel;
    } catch (e) {
      rethrow;
    }
  }

  Stream<domain.User?> get authStateChanges => _dataSource.authStateChanges;
}
