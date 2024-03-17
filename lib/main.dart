import 'package:flutter/material.dart';



import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Заголовок',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Заголовок'), // Убрана точка после Text
          centerTitle: true, // Добавлено свойство для центрирования заголовка
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => _launchURL('site1'),
                child: const Text('открыть site1'),
              ),
              const SizedBox(height: 20), // Добавляет пространство между кнопками
              ElevatedButton(
                onPressed: () => _launchURL('site2'),
                child: const Text('открыть site2'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(String urlString) async {
    // ignore: deprecated_member_use
    if (await canLaunch(urlString)) {
      // ignore: deprecated_member_use
      await launch(urlString);
    } else {
      throw 'Не могу открыть $urlString';
    }
  }
}

