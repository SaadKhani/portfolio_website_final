import 'package:url_launcher/url_launcher.dart' as launcher;

class UrlLauncherUtils {
  UrlLauncherUtils._();

  static Future<void> launchUrl(String url) async {
    final uri = Uri.parse(url);

    if (!await launcher.canLaunchUrl(uri)) {
      return;
    }

    await launcher.launchUrl(
      uri,
      mode: launcher.LaunchMode.externalApplication,
    );
  }

  static Future<void> launchAsset(String assetPath) async {
    final uri = Uri.parse(assetPath);

    if (!await launcher.canLaunchUrl(uri)) {
      return;
    }

    await launcher.launchUrl(uri, webOnlyWindowName: '_blank');
  }
}
