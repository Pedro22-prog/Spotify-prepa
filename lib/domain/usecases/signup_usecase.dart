import 'package:spotify_prepa/domain/entities/user.dart';
import 'package:spotify_prepa/domain/repository/authrepository.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<User?> call(String fullName, String email, String password) async {
    return await repository.signUp(fullName, email, password);
  }
}
