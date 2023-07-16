import 'package:cuidapet/application/config/database_connection_configuration.dart';
import 'package:cuidapet/application/config/service_locator_config.dart';
import 'package:cuidapet/application/logger/i_logger.dart';
import 'package:cuidapet/application/logger/logger.dart';
import 'package:dotenv/dotenv.dart' show env, load;
import 'package:get_it/get_it.dart';

class ApplicationConfig {
  Future<void> loadConfigApplication() async {
    await _loadEnv();
    _loadDatabaseConfig();
    _configLogger();
    _loadDependencies();
  }

  Future<void> _loadEnv() async => load();
}

void _loadDatabaseConfig() {
  final databaseConfig = DatabaseConnectionConfiguration(
    host: env['DATABASE_HOST'] ?? env['databaseHost']!,
    user: env['DATABASE_USER'] ?? env['databaseUser']!,
    password: env['DATABASE_PASSWORD'] ?? env['databasePassword']!,
    databaseName: env['DATABASE_NAME'] ?? env['databaseName']!,
    port: int.tryParse(env['DATABASE_PORT'] ?? env['databasePort']!) ?? 0,
  );
  GetIt.I.registerSingleton(databaseConfig);
}

void _configLogger() => GetIt.I.registerLazySingleton<ILogger>(() => Logger());

void _loadDependencies() => configureDependencies();
