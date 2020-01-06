import 'package:http_interceptor/http_interceptor.dart';

class ApiInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async => data;

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print('Response Intercept:');
    print(data.headers);
    return data;
  }
}