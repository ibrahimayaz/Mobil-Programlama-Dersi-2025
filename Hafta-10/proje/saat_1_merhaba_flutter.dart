/*
SAAT 1: FLUTTER'A GİRİŞ VE KURULUM
===================================
Bu bölümde:
- Flutter kurulumu
- İlk proje oluşturma
- Temel widget'ler
- Hot Reload özelliği
*/

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Uygulama konfigürasyonu
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Merhaba Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

// Ana Sayfa
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Dersi - Saat 1'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Başlık
              const Text(
                'Merhaba Flutter! 👋',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Açıklama
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue.shade200),
                ),
                child: const Text(
                  'Flutter, Google tarafından geliştirilen açık kaynaklı UI framework\'üdür. '
                  'Dart programlama dilini kullanarak iOS, Android, Web ve Desktop uygulamaları '
                  'oluşturabilirsiniz.',
                  style: TextStyle(fontSize: 16, height: 1.6),
                ),
              ),
              const SizedBox(height: 32),

              // Temel Konseptler
              const SectionTitle('Temel Konseptler'),
              _buildConceptCard(
                icon: Icons.widgets,
                title: 'Widget\'ler',
                description:
                    'Flutter\'da her şey widget\'tir. UI\'nın yapı taşlarıdır.',
              ),
              const SizedBox(height: 12),
              _buildConceptCard(
                icon: Icons.flash_on,
                title: 'Hot Reload',
                description: 'Kod değişikliklerini anında görebilirsiniz.',
              ),
              const SizedBox(height: 12),
              _buildConceptCard(
                icon: Icons.phonelink,
                title: 'Cross-Platform',
                description: 'Tek kod ile birden çok platform uygulaması.',
              ),
              const SizedBox(height: 32),

              // Proje Yapısı
              const SectionTitle('Proje Yapısı'),
              const ProjectStructureWidget(),
              const SizedBox(height: 32),

              // Butonlar
              const SectionTitle('Widget Örnekleri'),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Merhaba! ElevatedButton tıklandı.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      child: const Text('Tıkla'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('OutlinedButton tıklandı.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      child: const Text('Tıkla'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  // Konsept Kartı Widget'i
  Widget _buildConceptCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: Colors.blue,
                size: 28,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Başlık Widget'i
class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

// Proje Yapısı Widget'i
class ProjectStructureWidget extends StatelessWidget {
  const ProjectStructureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        fontFamily: 'monospace',
      ),
      child: const Text(
        '''my_app/
├── android/
├── ios/
├── lib/
│   └── main.dart    ← Ana dosya
├── pubspec.yaml     ← Bağımlılıklar
└── test/''',
        style: TextStyle(
          fontFamily: 'Courier New',
          fontSize: 12,
        ),
      ),
    );
  }
}

/*
ALIŞTIRAMA 1: HOŞ GELDİNİZ EKRANI
==================================

GÖREV: Aşağıdaki özelliklerle bir hoş geldiniz ekranı oluşturun:
1. Uygulama başlığı
2. Logo/Ikon
3. Açıklama metni
4. Başla butonu

İPUCU: Scaffold, AppBar, Column, Center widget'lerini kullanın
*/

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Icon(
                    Icons.flutter_dash,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),

                // Başlık
                const Text(
                  'Flutter Eğitimine\nHoş Geldiniz',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                // Açıklama
                Text(
                  'Bu eğitim serisinde profesyonel Flutter uygulamaları '
                  'geliştirmeyi öğreneceksiniz.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 60),

                // Başla Butonu
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Sonraki sayfaya git
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Başla',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
