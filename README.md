# jaguar_mustache

Jaguar interceptors to render mustache templates

# Example

```dart
@Api(path: '/api')
class ExampleApi extends _$JaguarExampleApi {
  @Get(path: '/file')
  @WrapMustacheRender('example/test.template.html')
  Future<Map<String, String>> mustacheFile() async {
    return {'login': 'Kleak'};
  }

  @Get(path: '/str')
  @WrapMustacheStrRender(kTemplate)
  Future<Map<String, String>> mustacheStr() async {
    return {'login': 'Kleak'};
  }
}
```