library jaguar_mustache.src.interceptor;

import 'dart:async';
import 'dart:io';

import 'package:jaguar/jaguar.dart';
import 'package:mustache/mustache.dart';

class MustacheRender extends Interceptor {
  final String uri;

  const MustacheRender(this.uri);

  Null pre(_) => null;

  Future<Response<String>> post(_, Response result) async {
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

class MustacheStrRender extends Interceptor {
  final String template;

  const MustacheStrRender(this.template);

  Null pre(_) => null;

  Response<String> post(_, Response result) {
    final Template t = new Template(template);
    final Response<String> ret =
        new Response<String>(t.renderString(result.value));
    return ret;
  }
}
