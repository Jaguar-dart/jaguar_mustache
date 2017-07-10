/// File: main.dart
library jaguar.example;

import 'dart:async';
import 'package:jaguar/jaguar.dart';
import 'package:jaguar_mustache/jaguar_mustache.dart';

const String kTemplate = r"<h1>{{login}}</h1>";

@Api(path: '/api')
class ExampleApi {
  MustacheRender fileRenderer(_) =>
      new MustacheRender('example/test.template.html');

  MustacheStrRender strRenderer(_) => new MustacheStrRender(kTemplate);

  @Get(path: '/file')
  @WrapOne(#fileRenderer)
  Future<Map<String, String>> mustache(_) async {
    return {'login': 'Kleak'};
  }

  @Get(path: '/str')
  @WrapOne(#strRenderer)
  Future<Map<String, String>> mustacheStr(_) async {
    return {'login': 'Kleak'};
  }
}

Future<Null> main(List<String> args) async {
  final server = new Jaguar();
  server.addApiReflected(new ExampleApi());
  await server.serve();
}
