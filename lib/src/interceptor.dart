library jaguar_mustache.src.interceptor;

import 'dart:async';
import 'dart:io';

import 'package:jaguar/jaguar.dart';
import 'package:mustache/mustache.dart';

@InterceptorClass(writesResponse: true)
class MustacheRender extends Interceptor {
  final String uri;

  const MustacheRender({this.uri});

  @Input(RouteResponse)
  Future<Null> post(HttpRequest request, dynamic result) async {
    File f = new File(uri);
    if (!await f.exists()) {
      throw "file not found !";
    }
    Template t = new Template(await f.readAsString());
    String data = t.renderString(result);
    request.response.write(data);
  }
}
