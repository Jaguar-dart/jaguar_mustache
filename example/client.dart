library jaguar_mux.example.simple.client;

import 'dart:async';
import 'dart:io';
import 'dart:convert';

const String kHostname = 'localhost';

const int kPort = 8080;

final HttpClient _client = new HttpClient();

Future<Null> printHttpClientResponse(HttpClientResponse resp) async {
  StringBuffer contents = new StringBuffer();
  await for (String data in resp.transform(UTF8.decoder)) {
    contents.write(data);
  }

  print('=========================');
  print("body:");
  print(contents.toString());
  print("statusCode:");
  print(resp.statusCode);
  print("headers:");
  print(resp.headers);
  print("cookies:");
  print(resp.cookies);
  print('=========================');
}

Future<Null> execMustacheFile() async {
  HttpClientRequest req = await _client.get(kHostname, kPort, '/api/file');
  HttpClientResponse resp = await req.close();

  printHttpClientResponse(resp);
}

Future<Null> execMatchStr() async {
  HttpClientRequest req = await _client.get(kHostname, kPort, '/api/str');
  HttpClientResponse resp = await req.close();

  printHttpClientResponse(resp);
}

main() async {
  await execMustacheFile();
  await execMatchStr();
}
