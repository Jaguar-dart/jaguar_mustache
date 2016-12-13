library jaguar_mustache.src.interceptor;

import 'dart:async';
import 'dart:io';

import 'package:jaguar/jaguar.dart';
import 'package:mustache/mustache.dart';

class WrapMustacheRender implements RouteWrapper<MustacheRender>{
  final String uri;

  final String id;
  final Map<Symbol, MakeParam> makeParams;

  const WrapMustacheRender({this.uri, this.id, this.makeParams});

  MustacheRender createInterceptor() => new MustacheRender(uri: uri);
}

class MustacheRender extends Interceptor {
  final String uri;

  const MustacheRender({this.uri});

  @InputRouteResponse()
  Future<Response<String>> post(Response result) async {
    File f = new File(uri);
    if (!await f.exists()) {
      throw "file not found !";
    }
    Template t = new Template(await f.readAsString());
    return new Response<String>(t.renderString(result.value));
  }
}
