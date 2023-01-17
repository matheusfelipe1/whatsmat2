import '../../models/user_model.dart';

abstract class ISessionRepository {
    Future<UserModel> doLogin(String email, String password);
    Future<UserModel?> getCurrentUser();
    Future<void> signout();
}