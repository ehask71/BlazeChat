import 'dart:async';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:blaze_chat/blocs/groups/groups.dart';

class GroupRepository {
  HttpClientWithInterceptor client;

  GroupRepository(this.client);

  Future<List> _fetchGroups(int startIndex, int limit) async {

    final token = await _userRepository.getToken();
    final response = await _httpClient.get(
        Constants().API +'groups?_start=$startIndex&_limit=$limit');
  }
}