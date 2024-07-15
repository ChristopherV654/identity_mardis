import 'package:identity_engine/core/application/Interfaces/ilogin_qr_provider.dart';
import 'package:identity_engine/core/domain/Models/login/login_request.dart';
import 'package:identity_engine/core/domain/Models/login/login_response.dart';
import 'package:identity_engine/core/infraestructure/Apis/request/login_qr_request_get.dart';
import 'package:identity_engine/core/infraestructure/Apis/request/login_qr_request_post.dart';

class LoginProvider extends ILoginProvider {
  final LoginRequestPost _loginRequest = LoginRequestPost();
  final LoginRequestGet _loginResponse = LoginRequestGet();

  @override
  Future<QRCodeResponse> authenticatior(
      {required LoginRequestModel loginRequest, required String tenant}) async {
    return await _loginRequest.callAuthenticate(loginRequest, tenant);
  }

  @override
  Future<QRCodeResponse> getUserFromQR(
      {required String idUser, required String tenant}) async {
    return await _loginResponse.getUser(idUser, tenant);
  }
}