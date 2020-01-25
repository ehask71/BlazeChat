import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:blaze_chat/common/api_interceptor.dart';
import 'package:blaze_chat/blocs/groups/groups.dart';
import 'package:blaze_chat/user_repository.dart';
import 'package:blaze_chat/common/constants.dart';
import 'package:blaze_chat/models/group.dart';

class GroupRepository {
  HttpClientWithInterceptor client =
      HttpClientWithInterceptor.build(interceptors: [ApiInterceptor()]);
  final _userRepository = UserRepository();

  Future<List> fetchGroups(int startIndex, int limit) async {
    final token = await _userRepository.getToken();
    final response = await client.get(
        Constants().API + 'groups?_start=$startIndex&_limit=$limit',
        headers: {HttpHeaders.authorizationHeader: "Bearer "+token});
    return allGroupsFromJson(response.body);
  }

  Future<List> fetchGroup(int id, int startIndex, int limit) async {
    final token = await _userRepository.getToken();
    final response = await client.get(
        Constants().API + 'group/$id?_start=$startIndex&_limit=$limit',
        headers: {HttpHeaders.authorizationHeader: "Bearer "+token});
    return allGroupsFromJson(response.body);
  }
}
