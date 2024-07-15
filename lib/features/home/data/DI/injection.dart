import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import 'injection.config.dart';


final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => $initGetIt(getIt);

@module
abstract class RegisterModule {
  @lazySingleton
  http.Client get client => http.Client();
}

