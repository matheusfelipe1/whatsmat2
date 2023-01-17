abstract class IRegisterRepository {
  Future<void> createUser(String email, String password, String name);
}