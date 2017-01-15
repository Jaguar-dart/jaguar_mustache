/// File: main.dart
library jaguar.example;

import 'dart:io';
import 'dart:async';
import 'package:jaguar/jaguar.dart';
import 'package:jaguar_mustache/jaguar_mustache.dart';

part 'main.g.dart';

const String kTemplate = r"<h1>{{login}}</h1>";

@Api(path: '/api')
class ExampleApi extends _$JaguarExampleApi {
  @Get(path: '/file')
  @WrapMustacheRender('example/test.template.html')
  Future<Map<String, String>> mustache() async {
    return {'login': 'Kleak'};
  }

  @Get(path: '/str')
  @WrapMustacheStrRender(kTemplate)
  Future<Map<String, String>> mustacheStr() async {
    return {'login': 'Kleak'};
  }
}

Future<Null> main(List<String> args) async {
  ExampleApi api = new ExampleApi();

  Configuration configuration = new Configuration();
  configuration.addApi(api);

  await serve(configuration);
}
