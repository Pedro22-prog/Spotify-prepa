import 'package:spotify_prepa/domain/entities/user.dart';
import 'package:spotify_prepa/domain/repository/authrepository.dart';

class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<User?> call(String email, String password) async {
    return await repository.signIn(email, password);
  }
}
