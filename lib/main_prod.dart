import 'package:craftster/app/app.dart';
import 'package:craftster/config/prod/firebase_options_prod.dart';
import 'package:craftster/core/remote_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  const supabasePublishableKey = String.fromEnvironment(
    'SUPABASE_PUBLISHABLE_KEY',
  );

  await Supabase.initialize(
    url: supabaseUrl,
    publishableKey: supabasePublishableKey,
  );

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await RemoteConfig.initialize(minimumFetchInterval: const Duration(hours: 1));

  runApp(const App());
}
