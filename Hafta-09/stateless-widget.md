# StatelessWidget Nedir? Teorik ve Kodlu Anlatım

Flutter'da iki ana widget türü vardır: `StatelessWidget` ve `StatefulWidget`. Bu dosyada, `StatelessWidget` kavramını en temelden, hem teorik hem kodlu örneklerle açıklayacağız.

---

## Teorik Bilgi

### StatelessWidget nedir?
`StatelessWidget`, durumu (state) değişmeyen, yani ekranda gösterdiği veri ve yapı sabit olan widget'lardır. Kullanıcı etkileşimi veya dışarıdan gelen veri ile kendiliğinden değişmezler. Her oluşturulduğunda aynı arayüzü üretirler.

### Nerede kullanılır?
- Sabit metinler, ikonlar, görseller
- Sadece arayüzü gösteren, etkileşim gerektirmeyen bileşenler
- Sıkça kullanılan, tekrar eden UI parçaları

### StatelessWidget'ın avantajları
- Daha hızlı render edilir, çünkü değişen bir state yoktur.
- Kodun okunabilirliği ve bakımı kolaydır.
- Performans açısından daha verimlidir.

---

## Temel Kod Örneği

Aşağıda en basit StatelessWidget örneği verilmiştir:

```dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('StatelessWidget Örneği')),
        body: const Center(
          child: Text('Bu bir StatelessWidget!'),
        ),
      ),
    );
  }
}
```

Bu örnekte `MyApp` bir StatelessWidget'dır. Ekranda sabit bir metin gösterir.

---

## StatelessWidget ile Özelleştirme

StatelessWidget'lar parametre alarak farklı içerik gösterebilir. Örneğin:

```dart
class SelamWidget extends StatelessWidget {
  final String isim;
  const SelamWidget({super.key, required this.isim});

  @override
  Widget build(BuildContext context) {
    return Text('Merhaba, $isim!');
  }
}

// Kullanım:
Center(child: SelamWidget(isim: 'Ali'))
```

Burada, `SelamWidget` parametre ile aldığı ismi ekranda gösterir. Yine de widget'ın kendisi state tutmaz.

---

## StatelessWidget ile Basit UI Parçaları

Sıkça kullanılan sabit UI parçalarını StatelessWidget ile tanımlayabilirsiniz:

```dart
class InfoCard extends StatelessWidget {
  final String baslik;
  final String aciklama;
  const InfoCard({super.key, required this.baslik, required this.aciklama});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(baslik, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(aciklama),
          ],
        ),
      ),
    );
  }
}

// Kullanım:
InfoCard(baslik: 'Flutter', aciklama: 'Flutter ile mobil uygulama geliştirin.')
```

---

## StatelessWidget ve Performans

StatelessWidget'lar, state tutmadığı için yeniden oluşturulmaları gerektiğinde (örneğin parent widget yeniden build edildiğinde) hızlıca yeniden çizilir. State olmadığı için, widget'ın içeriği değişmez.

---

## Kısa Özet
- StatelessWidget, sabit ve değişmeyen arayüzler için kullanılır.
- Parametre ile özelleştirilebilir ama kendi içinde state tutmaz.
- Kodunuzu sade ve performanslı tutmak için, mümkün olduğunda StatelessWidget tercih edin.

Daha ileri örnekler veya sorularınız için dosyayı genişletebilirim.