// GENERATED CODE - DO NOT MODIFY BY HAND

part of jaguar.example;

// **************************************************************************
// Generator: ApiGenerator
// Target: class ExampleApi
// **************************************************************************

abstract class _$JaguarExampleApi implements RequestHandler {
  static const List<RouteBase> _routes = const <RouteBase>[const Get('/')];

  Future<Map<String, String>> mustache();

  Future<bool> requestHandler(HttpRequest request, {String prefix: ''}) async {
    prefix += '/api';
    PathParams pathParams = new PathParams();
    bool match = false;

    match =
        _routes[0].match(request.uri.path, request.method, prefix, pathParams);
    if (match) {
      MustacheRender iMustacheRender = new MustacheRender(
        uri: 'example/test.template.html',
      );
      Map<String, String> rRouteResponse;
      rRouteResponse = await mustache();
      request.response.statusCode = 200;
      await iMustacheRender.post(
        request,
        rRouteResponse,
      );
      return true;
    }

    return false;
  }
}