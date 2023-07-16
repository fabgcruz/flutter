import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'controller.g.dart';

class Controller {
  @Route.get('/')
  Response hello(Request request) {
    return Response.ok('My First App =D!\n');
  }

  Router get router => _$ControllerRouter(this);
}
