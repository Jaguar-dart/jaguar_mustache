// GENERATED CODE - DO NOT MODIFY BY HAND

part of jaguar.example;

// **************************************************************************
// Generator: ApiGenerator
// Target: class ExampleApi
// **************************************************************************

abstract class _$JaguarExampleApi implements RequestHandler {
  static const List<RouteBase> routes = const <RouteBase>[
    const Get(path: '/file'),
    const Get(path: '/str')
  ];

  Future<Map<String, String>> mustache();

  Future<Map<String, String>> mustacheStr();

  Future<Response> handleRequest(Request request, {String prefix: ''}) async {
    prefix += '/api';
    PathParams pathParams = new PathParams();
    bool match = false;

//Handler for mustache
    match =
        routes[0].match(request.uri.path, request.method, prefix, pathParams);
    if (match) {
      Response<Map> rRouteResponse0 = new Response(null);
      MustacheRender iMustacheRender;
      try {
        iMustacheRender = new WrapMustacheRender(
          'example/test.template.html',
        )
            .createInterceptor();
        rRouteResponse0.statusCode = 200;
        rRouteResponse0.setContentType('text/plain; charset=us-ascii');
        rRouteResponse0.value = await mustache();
        Response<String> rRouteResponse1 = await iMustacheRender.post(
          rRouteResponse0,
        );
        return rRouteResponse1;
      } catch (e) {
        await iMustacheRender?.onException();
        rethrow;
      }
    }

//Handler for mustacheStr
    match =
        routes[1].match(request.uri.path, request.method, prefix, pathParams);
    if (match) {
      Response<Map> rRouteResponse0 = new Response(null);
      MustacheStrRender iMustacheStrRender;
      try {
        iMustacheStrRender = new WrapMustacheStrRender(
          kTemplate,
        )
            .createInterceptor();
        rRouteResponse0.statusCode = 200;
        rRouteResponse0.setContentType('text/plain; charset=us-ascii');
        rRouteResponse0.value = await mustacheStr();
        Response<String> rRouteResponse1 = iMustacheStrRender.post(
          rRouteResponse0,
        );
        return rRouteResponse1;
      } catch (e) {
        await iMustacheStrRender?.onException();
        rethrow;
      }
    }

    return null;
  }
}
