import 'package:whatsmat/datasources/datasource.dart';
import 'package:whatsmat/repositories/register/iregister_repository.dart';

class RegisterRepository implements IRegisterRepository{
  
  final DataSource _dataSource = DataSource();

  @override
  Future<void> createUser(String email, String password, String name) async {
    final user = await _dataSource.createUserWithEmailAndPassword(
        email.trim(), password.trim());
    final id = user.user!.uid;
    await _dataSource.register(email.trim(), name.trim(), id);
  }
}
