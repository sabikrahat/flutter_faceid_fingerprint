import 'package:local_auth/local_auth.dart';

import '../../../utils/logger/logger_helper.dart';

class LocalAuth {
  static final _auth = LocalAuthentication();

  static Future<bool> _canAuthenticate() async =>
      await _auth.isDeviceSupported() || await _auth.canCheckBiometrics;

  static Future<bool> authenticate() async {
    try {
      if (!(await _canAuthenticate())) return false;
      return await _auth.authenticate(
        localizedReason: 'Please authenticate to enter the app.',
      );
    } catch (e) {
      log.e('Local Auth Error: $e');
      return false;
    }
  }
}
