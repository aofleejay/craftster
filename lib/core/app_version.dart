class AppVersion {
  AppVersion._();

  static bool isLowerThan(String current, String minimum) {
    final currentParts = current.split('.').map(int.parse).toList();
    final minimumParts = minimum.split('.').map(int.parse).toList();

    final length = currentParts.length > minimumParts.length
        ? currentParts.length
        : minimumParts.length;

    for (var i = 0; i < length; i++) {
      final currentPart = i < currentParts.length ? currentParts[i] : 0;
      final minimumPart = i < minimumParts.length ? minimumParts[i] : 0;

      if (currentPart < minimumPart) {
        return true;
      }

      if (currentPart > minimumPart) {
        return false;
      }
    }

    return false;
  }
}
