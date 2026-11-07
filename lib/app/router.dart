import 'package:craftster/core/app_version.dart';
import 'package:craftster/core/app_package_info.dart';
import 'package:craftster/core/remote_config.dart';
import 'package:craftster/features/force_update/views/force_update_screen.dart';
import 'package:craftster/features/shops/views/shop_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

final router = GoRouter(
  redirect: (context, state) async {
    final minimumVersion = RemoteConfig.getMinimumVersion();
    final currentVersion = await AppPackageInfo.getVersion();

    if (AppVersion.isLowerThan(currentVersion, minimumVersion)) {
      return '/force-update';
    }
    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const ShopScreen(),
    ),
    GoRoute(
      path: '/force-update',
      name: 'force-update',
      builder: (context, state) => const ForceUpdateScreen(),
    ),
  ],
  observers: [SentryNavigatorObserver()],
);
