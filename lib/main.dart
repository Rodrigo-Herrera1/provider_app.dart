import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TextProvider(),
        )
      ],
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 80, 42, 145),
            ),
            useMaterial3: true,
          ),
          home: const HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Flutter'),
      ),
      body: const ListWidget(),
    );
  }
}

class ListWidget extends StatelessWidget {
  const ListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textProvider = context.watch<TextProvider>();

    return ListView(
      children: [
        Text(textProvider.text1),
        Text(textProvider.text2),
        ElevatedButton(
          onPressed: () {
            context
                .read<TextProvider>()
                .setTexts(value1: 'New Text 4', value2: 'New Text 5');
          },
          child: const Text('Texto Nuevo nuevo'),
        ),
        TextFormField(
          onChanged: (value) {
            final (text1, text2) = context.read<TextProvider>().setTexts(
                  value1: value.toUpperCase(),
                  value2: value.toString(),
                );
            print(text1 + text2);
          },
        )
      ],
    );
  }
}
