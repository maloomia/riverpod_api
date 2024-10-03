
import 'dart:convert';

import 'package:get_api/get_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'api_provider.g.dart';



@riverpod
Future<List<GetApi>> getApi(GetApiRef ref) async {
  var response = await http.get(Uri.parse("https://freefakeapi.io/api/posts?limit=6"));
  List<dynamic> api = jsonDecode(response.body);



  return api.map((item) => GetApi.fromJson(item)).toList();
}