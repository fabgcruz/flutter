import 'dart:io';

//import 'package:cuidapet/application/middlewares/cors/cors_middlewares.dart';
//import 'package:cuidapet/controller.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import 'package:cuidapet/application/config/application_config.dart';

// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..get('/echo/<message>', _echoHandler);

//router.mount('/helloController/',Controller().router);

Response _rootHandler(Request req) {
  return Response.ok('My First App =D!\n');
}

Response _echoHandler(Request request) {
  //final message = request.params['message'];
  return Response.ok('MESSAGE TEST\n');
}

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  //Application Config
  final appConfig = ApplicationConfig();
  appConfig.loadConfigApplication();

  // Configure a pipeline that logs requests.
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}
