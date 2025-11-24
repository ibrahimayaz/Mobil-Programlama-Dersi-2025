# Hafta-14 - Animasyonlar ve Orta Seviye Widget'lar

Konu: Basit animasyonlar (`AnimatedContainer`, `AnimatedOpacity`), `Hero` animasyonu, `CustomPainter`, performans ipuçları.

Hedef: Temel animasyonları uygulamak ve arayüzü zenginleştirmek.

## Örnek 1 — `AnimatedContainer`

```dart
class AnimExample extends StatefulWidget { /* ... */ }

class _AnimExampleState extends State<AnimExample> {
  bool _flag = false;
  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () => setState(() => _flag = !_flag),
    child: AnimatedContainer(
      duration: Duration(milliseconds: 500),
      width: _flag ? 200 : 100,
      height: _flag ? 200 : 100,
      color: _flag ? Colors.red : Colors.blue,
    ),
  );
}
```

## Örnek 2 — `Hero` animasyonu

```dart
// Başlangıç ekranında
Hero(tag: 'pic', child: Image.network('...'))

// Hedef ekranda
Hero(tag: 'pic', child: Image.network('...'))
```

## Örnek 3 — `AnimatedOpacity`

```dart
AnimatedOpacity(
  opacity: _visible ? 1.0 : 0.0,
  duration: Duration(milliseconds: 300),
  child: Text('Görünürlük örneği'),
)
```

## Örnek 4 — `CustomPainter` (basit çizim)

```dart
class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.green;
    canvas.drawCircle(Offset(size.width/2, size.height/2), 40, paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Kullanım: CustomPaint(painter: MyPainter())
```

## Örnek 5 — Performans ipuçları

- Büyük listelerde `ListView.builder` kullanın.
- Gereksiz yeniden çizimleri önlemek için widget'ları parçalayın.
- `const` kullanımı performansı artırır.

---

Notlar:
- Animasyonlar UI'yı zenginleştirir; ama aşırı animasyon kullanıcı deneyimini düşürebilir.
- Daha ileri animasyonlar için `AnimationController` ve `Tween` konusuna bakın.
