# Hafta-12 - State Yönetimi: setState, Lift State Up, Provider Giriş

Konu: `setState` kullanımı, state'i yukarı taşımak (lifting state up), basit `InheritedWidget`/`Provider` kullanımı.

Hedef: Uygulama genelinde basit state paylaşımı için Provider kullanımına giriş.

## Örnek 1 — setState tekrar (kısa)

```dart
// StatefulWidget içinde
int _counter = 0;
ElevatedButton(onPressed: () => setState(() => _counter++), child: Text('+'))
```

## Örnek 2 — Lift State Up

```dart
// Parent widget içinde state tutup child'e callback verirsiniz
class Parent extends StatefulWidget { /* ... */ }

// ParentState içinde
void _guncelle(int val) => setState(() => _value = val);

// Child çağrısı: widget.onChanged(newVal);
```

## Örnek 3 — Basit Provider kullanımı

```dart
// pubspec.yaml: provider: ^6.0.0

class CounterModel extends ChangeNotifier {
  int _count = 0;
  int get count => _count;
  void increment() { _count++; notifyListeners(); }
}

// main.dart
void main() => runApp(
  ChangeNotifierProvider(
    create: (_) => CounterModel(),
    child: const MyApp(),
  ),
);

// Kullanım
Consumer<CounterModel>(builder: (context, model, child) => Text('\\${model.count}'))
```

## Örnek 4 — Provider ile buton kontrolü

```dart
ElevatedButton(
  onPressed: () => context.read<CounterModel>().increment(),
  child: Text('Arttır'),
)
```

## Örnek 5 — Basit InheritedWidget (konsept)

```dart
class MyInherited extends InheritedWidget {
  final int data;
  const MyInherited({required this.data, required super.child});

  static MyInherited of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<MyInherited>()!;

  @override
  bool updateShouldNotify(covariant MyInherited oldWidget) => oldWidget.data != data;
}
```

---

Notlar:
- `Provider` küçük ve orta ölçekli uygulamalar için hızlı çözümdür.
- Daha ileri düzeyde Riverpod, Bloc, MobX gibi çözümler incelenebilir.
