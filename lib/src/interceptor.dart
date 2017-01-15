library jaguar_mustache.src.interceptor;

import 'dart:async';
import 'dart:io';

import 'package:jaguar/jaguar.dart';
import 'package:mustache/mustache.dart';

class WrapMustacheRender implements RouteWrapper<MustacheRender> {
  final String uri;

  final String id;

  final Map<Symbol, MakeParam> makeParams;

  const WrapMustacheRender(this.uri, {this.id, this.makeParams});

  MustacheRender createInterceptor() => new MustacheRender(uri);
}

class MustacheRender extends Interceptor {
  final String uri;

  const MustacheRender(this.uri);

  @InputRouteResponse()
  Future<Response<String>> post(Response result) async {
    final File f = new File(uri);
    if (!await f.exists()) {
      throw "file not found !";
    }
    final Template t = new Template(await f.readAsString());
    final Response<String> ret =
        new Response<String>(t.renderString(result.value));
    return ret;
  }
}

class WrapMustacheStrRender implements RouteWrapper<MustacheStrRender> {
  final String template;

  final String id;

  final Map<Symbol, MakeParam> makeParams;

  const WrapMustacheStrRender(this.template, {this.id, this.makeParams});

  MustacheStrRender createInterceptor() => new MustacheStrRender(template);
}

class MustacheStrRender extends Interceptor {
  final String template;

  const MustacheStrRender(this.template);

  @InputRouteResponse()
  Response<String> post(Response result) {
    final Template t = new Template(template);
    final Response<String> ret =
        new Response<String>(t.renderString(result.value));
    return ret;
  }
}
