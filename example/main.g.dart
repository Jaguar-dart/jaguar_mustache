// GENERATED CODE - DO NOT MODIFY BY HAND

part of jaguar.example;

// **************************************************************************
// Generator: ApiGenerator
// Target: class ExampleApi
// **************************************************************************

abstract class _$JaguarExampleApi implements RequestHandler {
  static const List<RouteBase> routes = const <RouteBase>[const Get(path: '/')];

  Future<Map<String, String>> mustache();

  Future<bool> handleRequest(HttpRequest request, {String prefix: ''}) async {
    prefix += '/api';
    PathParams pathParams = new PathParams();
    bool match = false;

//Handler for mustache
    match =
        routes[0].match(request.uri.path, request.method, prefix, pathParams);
    if (match) {
      Response rRouteResponse = new Response(null);
      MustacheRender iMustacheRender = new WrapMustacheRender(
        uri: 'example/test.template.html',
      )
          .createInterceptor();
      rRouteResponse.statusCode = 200;
      rRouteResponse.value = await mustache();
      rRouteResponse = await iMustacheRender.post(
        rRouteResponse,
      );
      await rRouteResponse.writeResponse(request.response);
      return true;
    }

    return false;
  }
}
