import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const FarmaCarloApp());
}

class FarmaCarloApp extends StatelessWidget {
  const FarmaCarloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FarmaCarlo Móvil',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WebScreen(),
    );
  }
}

class WebScreen extends StatefulWidget {
  const WebScreen({super.key});

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onWebResourceError: (WebResourceError error) {
            debugPrint('Error al cargar la pagina: ${error.description}');
          },
        ),
      )
      ..loadRequest(Uri.parse('https://farmacarlo-movil.onrender.com'));
  } 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FarmaCarlo Móvil'),
        backgroundColor: const Color(0xFF1E3A8A),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}