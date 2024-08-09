import 'package:flutter/material.dart';
import 'package:msal_auth/msal_auth.dart';

class AuthManager {
  late MsalAuth msalAuth;

  Future<MsalAuth> authClient() async {
    const kClientID = "5adc2f5d-3f44-42d9-86db-b47b5c6d3d5c";
    const scopes = <String>[
      'https://graph.microsoft.com/user.read',
    ];
    const kAuthority =
        "https://login.microsoftonline.com/0dd32502-a297-4c10-9d3b-322441b00f0a";
    try {
      msalAuth = await MsalAuth.createPublicClientApplication(
        clientId: kClientID,
        scopes: scopes,
        androidConfig: AndroidConfig(
          configFilePath: 'assets/msal_config.json',
        ),
        iosConfig: IosConfig(
          authority: kAuthority,
          // tenantType: TenantType.azureADB2C,
        ),
        // androidConfig: AndroidConfig(
        //   configFilePath: 'assets/msal_config.json',
        //   // tenantId: '<MICROSOFT_TENANT_ID (Optional)>',
        // ),
        // iosConfig: IosConfig(
        //   authority:
        //       'https://login.microsoftonline.com/<MICROSOFT_TENANT_ID>/oauth2/v2.0/authorize',
        //   // Change auth middleware if you need.
        //   authMiddleware: AuthMiddleware.msAuthenticator,
        //   tenantType: TenantType.entraIDAndMicrosoftAccount,
        // ),
      );
      return msalAuth;
    } catch (e) {
      debugPrint('Error initializing auth client: $e');
      return msalAuth;
    }
  }
}
