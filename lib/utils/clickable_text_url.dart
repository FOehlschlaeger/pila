import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
