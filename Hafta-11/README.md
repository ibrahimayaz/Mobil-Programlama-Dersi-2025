# StatefulWidget Nedir? Teorik ve Kodlu Açıklama

Flutter'da iki ana widget türü vardır: `StatelessWidget` ve `StatefulWidget`. `StatefulWidget`, durumu (state) değişebilen, yani ekranda gösterdiği veri ve yapı kullanıcı etkileşimi veya dışarıdan gelen veri ile değişebilen widget'lardır. State, widget'ın yaşam döngüsü boyunca değiştirilebilir ve arayüz güncellenir.

### Nerede kullanılır?
- Sayaç, form, liste gibi kullanıcı etkileşimi gerektiren arayüzler
- Dinamik veri gösterimi
- Animasyon, geçici mesajlar, buton tıklama gibi değişen durumlar

### StatefulWidget'ın avantajları
- Kullanıcı etkileşimine tepki verebilir
- Arayüzdeki değişiklikleri anında gösterebilir
- Uygulamanın dinamik ve interaktif olmasını sağlar

---

## Temel Kod Örneği

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const Sayac());
}

class Sayac extends StatefulWidget {
  const Sayac({super.key});

  @override
  State<Sayac> createState() => _SayacState();
}

class _SayacState extends State<Sayac> {
  int _sayi = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Text('Sayı: $_sayi'),
            ElevatedButton(
              onPressed: () => setState(() => _sayi++),
              child: const Text('Arttır'),
            ),
          ],
        ),
      ),
    );
  }
}
```

Bu örnekte, butona basıldıkça `_sayi` değişir ve arayüz güncellenir. `setState` fonksiyonu ile state değiştiğinde Flutter arayüzü yeniden oluşturur.

---

# Hafta-11 - StatefulWidget ile Dinamik Arayüzler ve Navigasyon

Konu: Bu hafta, dinamik arayüzler için `StatefulWidget` kullanımı ve state yönetimi temelleri anlatılacak. Ayrıca sayfalar arası geçiş (Navigator), named routes, form widget'ları (`Form`, `TextFormField`), doğrulama ve kullanıcı girdisi örnekleri verilecek.

Hedef: StatefulWidget ile değişen arayüzler oluşturmak, state yönetimini ve etkileşimi öğrenmek, navigasyon ve form işlemlerini uygulamak.

---

## StatefulWidget ile Basit Sayaç Örneği

```dart
class Sayac extends StatefulWidget {
  const Sayac({super.key});

  @override
  State<Sayac> createState() => _SayacState();
}

class _SayacState extends State<Sayac> {
  int _sayi = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Sayı: $_sayi'),
        ElevatedButton(
          onPressed: () => setState(() => _sayi++),
          child: const Text('Arttır'),
        ),
      ],
    );
  }
}
```

Bu örnekte, butona basıldıkça `_sayi` değişir ve arayüz güncellenir. StatelessWidget ile bu yapılamazdı; çünkü state yoktur.

---

## Örnek 1 — Basit navigasyon

```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => DetailPage()),
);
```

## Örnek 2 — Named Routes

```dart
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => const HomePage(),
    '/detail': (context) => const DetailPage(),
  },
);

// Kullanım:
Navigator.pushNamed(context, '/detail');
```

## Örnek 3 — Form ve TextFormField

```dart
final _formKey = GlobalKey<FormState>();

Form(
  key: _formKey,
  child: Column(
    children: [
      TextFormField(
        validator: (value) => value == null || value.isEmpty ? 'Boş olamaz' : null,
      ),
      ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // gönder
          }
        },
        child: Text('Gönder'),
      ),
    ],
  ),
)
```

## Örnek 4 — Girdi ile sayfa arası veri geçişi

```dart
// Gönderme
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => ResultPage(data: 'Merhaba')),
);

// Kabul eden sayfa
class ResultPage extends StatelessWidget {
  final String data;
  const ResultPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) => Scaffold(body: Text(data));
}
```

## Örnek 5 — Snackbar ve geri bildirim

```dart
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(content: Text('İşlem tamam')),
);
```

---

Notlar:
- Form doğrulaması `validator` ile yapılır; kullanıcı deneyimi için anlık doğrulama uygulanabilir.
- Navigator ile veri döndürme (`pop`) ve bekleme (`await Navigator.push`) sık kullanılan kalıplardır.
