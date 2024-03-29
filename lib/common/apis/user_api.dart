import 'package:ulearning/common/entities/entities.dart';

import '../util/http_util.dart';

class UserAPI {
  static login({LoginRequestEntity? params}) async {
    print(params?.toJson());
    var response = await HttpUtil().post('create-user', data: params?.toJson());
    return UserLoginResponseEntity.fromJson(response);
  }
}
