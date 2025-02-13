import 'dart:developer';

import 'package:msal_auth/msal_auth.dart';
import 'package:zostel/core/constants/authentication_constants.dart';

class AuthManager {
  Future<MsalAuth> _msalClient() async {
    const kClientID = AuthenticationConstants.kClientID;
    // "5adc2f5d-3f44-42d9-86db-b47b5c6d3d5c";
    const kTenantId = AuthenticationConstants.kTenantID;
    //"0dd32502-a297-4c10-9d3b-322441b00f0a";
    const scopes = <String>[
      AuthenticationConstants.accessTokenScope
      // "api://611a2bdf-3237-4d03-a924-3723267d90a8/.default",
      // 'https://graph.microsoft.com/user.read',
    ];
    const kAuthority = AuthenticationConstants.kAuthority;
    // "https://login.microsoftonline.com/0dd32502-a297-4c10-9d3b-322441b00f0a/oauth2/v2.0/authorize";

    return await MsalAuth.createPublicClientApplication(
      clientId: kClientID,
      scopes: scopes,
      androidConfig: AndroidConfig(
        configFilePath: 'assets/msal_config.json',
        tenantId: kTenantId,
      ),
      iosConfig: IosConfig(
        authority: kAuthority,
        authMiddleware: AuthMiddleware.webView,
        tenantType: TenantType.azureADB2C,
      ),
    );
  }

  Future<MsalUser?> acquireToken() async {
    MsalAuth msalAuth = await _msalClient();
    try {
      return await msalAuth.acquireToken();
    } catch (e) {
      log("Error fetching token: $e");
      return null;
    }
  }

  Future<MsalUser?> getTokenSilently() async {
    try {
      final msalAuth = await _msalClient();

      return await msalAuth.acquireTokenSilent();
    } on MsalException catch (e) {
      log('Msal exception with error: ${e.errorMessage}');
      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<void> logout() async {
    try {
      MsalAuth msalAuth = await _msalClient();
      await msalAuth.logout();
    } on MsalException catch (e) {
      log('Msal exception during logout: ${e.errorMessage}');
    } catch (e) {
      log('Unexpected error during logout: ${e.toString()}');
    }
  }
}
