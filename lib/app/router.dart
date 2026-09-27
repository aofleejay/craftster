import 'package:craftster/core/app_version.dart';
import 'package:craftster/core/app_package_info.dart';
import 'package:craftster/core/remote_config.dart';
import 'package:craftster/features/force_update/views/force_update_screen.dart';
import 'package:craftster/features/shops/views/shop_screen.dart';
import 'package:go_router/go_router.dart';

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
    GoRoute(path: '/', builder: (context, state) => const ShopScreen()),
    GoRoute(
      path: '/force-update',
      builder: (context, state) => const ForceUpdateScreen(),
    ),
  ],
);
