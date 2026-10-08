import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SRSP 2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  bool isFirstImage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SRSP 2: Images, Stack, Buttons'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),

            const Text(
              'Image.asset базовый вывод:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Image.asset(
              'assets/image_1.jpg',
              width: 250,
              height: 150,
            ),

            const SizedBox(height: 24),

            const Text(
              'Эксперимент с BoxFit:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              width: 250,
              height: 150,
              color: Colors.grey[300],
              child: Image.asset(
                'assets/image_1.jpg',
                fit: BoxFit.fill,
                // BoxFit.fill — изображение растягивается на всю область,
                // пропорции НЕ сохраняются, картинка может исказиться.
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Stack (фон + текст):',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Stack(
                children: [
                  // Изображение переключается по кнопке Toggle Image
                  Positioned.fill(
                    child: Image.asset(
                      isFirstImage ? 'assets/image_1.jpg' : 'assets/image_2.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Полупрозрачный чёрный слой поверх картинки
                  Positioned.fill(
                    child: Container(
                      color: Colors.black.withValues(alpha: 0.4),
                    ),
                  ),
                  // Текст поверх всего, для читаемости — белый и крупный
                  const Center(
                    child: Text(
                      'Welcome to Flutter',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ---------------------------------------------------
            // ЧАСТЬ 4. Три кнопки с заданными стилями
            // ---------------------------------------------------
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a SnackBar!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: const Size(200, 50),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text('Show SnackBar'),
            ),

            const SizedBox(height: 12),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondScreen()),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.green,
                minimumSize: const Size(200, 50),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text('Go to Second Screen'),
            ),

            const SizedBox(height: 12),

            OutlinedButton(
              onPressed: () {
                setState(() {
                  isFirstImage = !isFirstImage;
                });
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.black,
                side: const BorderSide(color: Colors.black),
                minimumSize: const Size(200, 50),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text('Toggle Image'),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------
// Второй экран, на который переходим по кнопке "Go to Second Screen"
// -----------------------------------------------------------
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Это второй экран',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Назад'),
            ),
          ],
        ),
      ),
    );
  }
}