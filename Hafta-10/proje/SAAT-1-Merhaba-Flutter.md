# SAAT 1: Flutter'a Giriş ve Kurulum

## 📌 Bu Saatin Hedefleri

- ✅ Flutter'ın ne olduğunu anlamak
- ✅ Flutter'ı bilgisayarınıza kurmak
- ✅ İlk Flutter projesini oluşturmak
- ✅ Hot Reload özelliğini deneyimlemek
- ✅ Temel widget'leri öğrenmek

---

## 1.1 Flutter Nedir?

**Flutter**, Google tarafından geliştirilen açık kaynaklı bir UI framework'üdür. **Dart** programlama dilini kullanarak mobil, web ve desktop uygulamaları oluşturmaya olanak tanır.

### Temel Özellikler

| Özellik | Açıklama |
|---------|----------|
| **Hot Reload** | Kod değişikliklerini anında görebilirsiniz |
| **Cross-Platform** | Tek kod ile birden çok platform uygulaması |
| **Rich Widgets** | Hazır bileşenlerin geniş yelpazesi |
| **High Performance** | Native performans sağlar |
| **Beautiful UI** | Material Design ve Cupertino tasarımları |

---

## 1.2 Kurulum Adımları

### Windows Kurulumu

```bash
# 1. Flutter SDK'yı indir
# https://flutter.dev/docs/get-started/install/windows adresinden indir

# 2. ZIP dosyasını çıkart
# C:\flutter klasörüne koy

# 3. PATH'e ekle
# Sistem Değişkenleri → PATH → Yeni → C:\flutter\bin

# 4. Terminal'i yeniden aç ve doktor çalıştır
flutter doctor

# 5. Sorunları düzelt (kırmızı ✗ işaretleri)
```

### macOS Kurulumu

```bash
# 1. Homebrew ile kur (Intel Mac)
arch -x86_64 sudo gem install ffi

# 2. GitHub'dan klonla
cd ~/development
git clone https://github.com/flutter/flutter.git -b stable

# 3. PATH'e ekle (~/.zshrc veya ~/.bash_profile)
export PATH="$PATH:$HOME/development/flutter/bin"

# 4. Kaynakla ve doktor çalıştır
source ~/.zshrc
flutter doctor
```

### Linux Kurulumu

```bash
# 1. Gerekli paketleri yükle
sudo apt-get install -y git curl unzip xz-utils zip libglu1-mesa

# 2. Flutter'ı indir ve çıkart
cd ~/development
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_*.tar.xz
tar xf flutter_linux_*.tar.xz

# 3. PATH'e ekle
export PATH="$PATH:$HOME/development/flutter/bin"
```

---

## 1.3 İlk Flutter Projesi Oluşturma

```bash
# Yeni proje oluştur
flutter create merhaba_flutter

# Proje klasörüne gir
cd merhaba_flutter

# Projeyi çalıştır
flutter run

# iOS üzerinde çalıştır (macOS'ta)
flutter run -d macos

# Web üzerinde çalıştır
flutter run -d chrome
```

---

## 1.4 Proje Yapısı

```
merhaba_flutter/
├── android/              # Android platform kodu
├── ios/                  # iOS platform kodu
├── lib/                  # Dart kodları (ANA KLASÖR)
│   └── main.dart         # Giriş noktası (başlangıç dosyası)
├── test/                 # Test dosyaları
├── web/                  # Web uygulaması
├── pubspec.yaml          # Bağımlılıklar ve proje bilgileri
├── pubspec.lock          # Kilitli versiyon numaraları
└── README.md             # Proje açıklaması
```

### pubspec.yaml Nedir?

`pubspec.yaml` dosyası projenizin ayar dosyasıdır. İçinde:
- Proje adı ve versiyon
- Bağımlılıklar (packages)
- Assets (resimler, fontlar)
- Konfigürasyonlar

```yaml
name: merhaba_flutter
description: A new Flutter project.

publish_to: 'none'

version: 1.0.0+1

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  http: ^0.13.5
  provider: ^6.0.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0

flutter:
  uses-material-design: true
  assets:
    - assets/images/
```

---

## 1.5 Ana Uygulama - main.dart

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

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
      home: const MyHomePage(title: 'Ana Sayfa'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Merhaba Flutter!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Hoş geldiniz! 👋',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Kodu Açıklayalım

1. **`import 'package:flutter/material.dart'`** - Material Design paketini dahil et
2. **`void main()`** - Uygulamanın başlangıç noktası
3. **`runApp(const MyApp())`** - Uygulamayı başlat
4. **`StatelessWidget`** - Durumu olmayan widget
5. **`MaterialApp`** - Uygulamanın temel ayarları
6. **`Scaffold`** - Sayfa yapısı (AppBar, body, vb.)
7. **`Center`** - İçeriği ortala
8. **`Column`** - Dikey düzen

---

## 1.6 Temel Widget'ler

### Text Widget

```dart
Text(
  'Merhaba Dünya',
  style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  ),
)
```

### Button Widget'leri

```dart
// ElevatedButton
ElevatedButton(
  onPressed: () {
    print('Buton tıklandı!');
  },
  child: const Text('Tıkla'),
)

// OutlinedButton
OutlinedButton(
  onPressed: () {},
  child: const Text('Kenarı Çizgili Buton'),
)

// TextButton
TextButton(
  onPressed: () {},
  child: const Text('Metin Butonu'),
)
```

### Container Widget

```dart
Container(
  width: 200,
  height: 200,
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10,
        offset: const Offset(0, 5),
      ),
    ],
  ),
  child: const Center(child: Text('Container')),
)
```

### Icon Widget

```dart
Icon(
  Icons.favorite,
  size: 32,
  color: Colors.red,
)
```

### Image Widget

```dart
// Ağdan resim yükle
Image.network(
  'https://via.placeholder.com/150',
  width: 150,
  height: 150,
  fit: BoxFit.cover,
)

// Yerel dosyadan resim yükle
Image.asset(
  'assets/images/logo.png',
  width: 150,
  height: 150,
)
```

---

## 1.7 Hot Reload Nasıl Kullanılır?

Hot Reload, uygulamayı durdurmanız gerekmeden kod değişikliklerini görmenize olanak tanır.

### Keyboard Kısayolu

```
r   → Hot reload
R   → Hot restart
q   → Quit
```

### Örnek

Kodunuzu değiştirin:

```dart
// Değişmeden önce
Text('Merhaba Flutter!')

// Değiştikten sonra
Text('Merhaba Dünya!')
```

Terminalde `r` tuşuna basın ve değişikliği anında göreceksiniz! 🔄

---

## 1.8 Alıştırma 1: Hoş Geldiniz Ekranı

### Görev

Aşağıdaki özelliklerle bir "Hoş Geldiniz" ekranı oluşturun:

1. **Başlık**: "Flutter Eğitimine Hoş Geldiniz"
2. **Ikon**: Bir Flutter ikon veya logo (Icon widget)
3. **Açıklama**: "Bu serinin sonunda profesyonel Flutter uygulamaları geliştirebileceksiniz."
4. **Buton**: "Başla" - Tıklandığında SnackBar gösterecek

### İpuçları

- `Scaffold` kullanın yapı için
- `Column` ile widget'leri dikey düzenleyin
- `SizedBox` ile boşluk ekleyin
- `ElevatedButton` ile buton oluşturun
- `ScaffoldMessenger` ile SnackBar gösterin

### Çözüm

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hoş Geldiniz',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const WelcomeScreen(),
    );
  }
}

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
                // Ikon
                const Icon(
                  Icons.flutter_dash,
                  size: 100,
                  color: Colors.purple,
                ),
                const SizedBox(height: 32),
                
                // Başlık
                const Text(
                  'Flutter Eğitimine\nHoş Geldiniz',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                
                // Açıklama
                Text(
                  'Bu serinin sonunda profesyonel Flutter uygulamaları '
                  'geliştirebileceksiniz.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 48),
                
                // Buton
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Başlamaya hazırsınız!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 48,
                      vertical: 16,
                    ),
                  ),
                  child: const Text('Başla'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

---

## 1.9 Sık Yapılan Hatalar

### ❌ Hata 1: Unutulan `const`

```dart
// Yanlış
Text('Merhaba')

// Doğru
const Text('Merhaba')
```

### ❌ Hata 2: `build` method'u

```dart
// Yanlış - return yok
@override
Widget build(BuildContext context) {
  Text('Merhaba');
}

// Doğru
@override
Widget build(BuildContext context) {
  return Text('Merhaba');
}
```

### ❌ Hata 3: ListView'de `shrinkWrap`

```dart
// Yanlış - sonsuz boyut hatası
ListView(
  children: [Text('Item')],
)

// Doğru
ListView(
  shrinkWrap: true,
  children: [Text('Item')],
)
```

---

## 1.10 Sorun Giderme

### "flutter: command not found"

```bash
# Windows: PATH'e C:\flutter\bin ekle
# macOS/Linux: ~/.bashrc veya ~/.zshrc'ye ekle
export PATH="$PATH:$HOME/development/flutter/bin"
```

### "Doctor says SDK problem"

```bash
flutter doctor --android-licenses
```

### Emulator çalışmıyor

```bash
flutter emulators
flutter emulators launch emulator_adı
flutter run
```

---

## 📚 Kaynaklar

- [Flutter Resmi Dokümantasyonu](https://flutter.dev/docs)
- [Dart Language](https://dart.dev)
- [Flutter Cookbook](https://flutter.dev/docs/cookbook)

---

## ✅ Bu Saatin Özeti

- Flutter'ın kurulumunu tamamladınız
- İlk projeyi oluşturdunuz
- Temel widget'leri öğrendiniz
- Hot Reload'ı denediniz
- Hoş geldiniz ekranı tasarladınız

**Tebrikler! Saat 1 tamamlandı! 🎉**

---

## Sonraki Saat

**SAAT 2: Widget'ler ve UI Tasarımı**
- Layout widget'leri (Column, Row, Stack)
- Card ve Container
- Ürün listesi tasarımı
- Grid layout'lar
