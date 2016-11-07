/// File: main.dart
library jaguar.example;

import 'dart:async';
import 'dart:io';
import 'package:jaguar/jaguar.dart';
import 'package:jaguar_mustache/jaguar_mustache.dart';

part 'main.g.dart';

/// Example of basic API class
@Api(path: '/api')
class ExampleApi extends _$JaguarExampleApi {
  /// Example of basic route with mongo
  @Get('/')
  @MustacheRender(uri: 'example/test.template.html')
  Future<Map<String, String>> mustache() async {
    return {'login': 'Kleak'};
  }
}

Future<Null> main(List<String> args) async {
  ExampleApi api = new ExampleApi();

  Configuration configuration = new Configuration();
  configuration.addApi(api);

  await serve(configuration);
}
