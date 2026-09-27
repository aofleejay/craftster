import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfig {
  RemoteConfig._();

  static Future<void> initialize({
    required Duration minimumFetchInterval,
  }) async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: minimumFetchInterval,
      ),
    );
    await remoteConfig.setDefaults(const {"minimum_version": "1.0.0"});
    await remoteConfig.fetchAndActivate();
  }

  static String getMinimumVersion() {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getString('minimum_version');
  }
}
