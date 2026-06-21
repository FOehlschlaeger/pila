import 'package:flutter/material.dart';
import 'package:pila/utils/logger.dart';
import 'package:url_launcher/url_launcher.dart';

/// [ClickableTextUrl]
///
/// This widget generates a clickable link provided with a text string to show and a given URL.
/// This may be used for linking the project in the documentation.
/// 
/// This feature may need the developer mode in Windows.
class ClickableTextUrl extends StatelessWidget {
  final String text;
  final String url;
  final TextStyle? style;

  const ClickableTextUrl({
    super.key,
    required this.text,
    required this.url,
    this.style,
  });

  Future<void> _launchUrl() async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
    log("[ClickableTextUrl] Launching following URL : $uri");
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launchUrl,
      child: Text(
        text,
        textAlign: TextAlign.left, 
        style: style ?? const TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
