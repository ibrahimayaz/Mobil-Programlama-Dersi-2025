# Hafta 07 – 25 Soru ve Cevap (Dart)

Her çözüm kısa, optimize ve açıklamalıdır.

## 1) 1–10 arasındaki sayıların toplamı
```dart
void main() {
  var toplam = 0;
  for (var i = 1; i <= 10; i++) {
    toplam += i;
  }
  print(toplam);
}
```

## 2) Bir kelimenin tersini yaz
```dart
void main() {
  const kelime = "merhaba";
  final ters = kelime.split("").reversed.join();
  print(ters);
}
```

## 3) Palindrome kontrolü
```dart
bool palindrome(String s) => s == s.split("").reversed.join();
void main() => print(palindrome("kavak"));
```

## 4) List’teki en büyük sayı
```dart
int? enBuyuk(List<int> l) {
  int? m;
  for (final n in l) {
    if (m == null || n > m) m = n;
  }
  return m;
}
void main() => print(enBuyuk([3, 9, 1, 7]));
```

## 5) Ortalama hesapla
```dart
double ort(List<int> l) =>
    l.isEmpty ? 0 : l.reduce((a, b) => a + b) / l.length;
void main() => print(ort([10, 20, 30]));
```

## 6) Tek sayıları filtrele
```dart
void main() {
  final sayilar = [1, 2, 3, 4, 5, 6];
  final tekler = [for (final s in sayilar) if (s.isOdd) s];
  print(tekler);
}
```

## 7) Harf frekansı
```dart
Map<String, int> frekans(String k) {
  final f = <String, int>{};
  for (final h in k.split("")) {
    f[h] = (f[h] ?? 0) + 1;
  }
  return f;
}
void main() => print(frekans("kavak"));
```

## 8) Set ile tekrarları temizle
```dart
void main() {
  final liste = [1, 2, 2, 3, 3, 4];
  final tekrarsiz = {...liste};
  print(tekrarsiz);
}
```

## 9) İki setin kesişimi
```dart
void main() {
  final a = {1, 2, 3};
  final b = {2, 3, 4};
  print(a.intersection(b));
}
```

## 10) En uzun kelime
```dart
String? enUzun(List<String> kelimeler) {
  String? e;
  for (final k in kelimeler) {
    if (e == null || k.length > e.length) e = k;
  }
  return e;
}
void main() => print(enUzun(["dart", "flutter", "mobil"]));
```

## 11) Sayı asal mı?
```dart
bool asal(int n) {
  if (n < 2) return false;
  for (var i = 2; i * i <= n; i++) {
    if (n % i == 0) return false;
  }
  return true;
}
void main() => print(asal(29));
```

## 12) Listedeki çift sayı adedi
```dart
int ciftAdet(List<int> l) {
  var c = 0;
  for (final n in l) if (n.isEven) c++;
  return c;
}
void main() => print(ciftAdet([1, 2, 4, 7, 8]));
```

## 13) Map’te en yüksek değerli key
```dart
String? enYuksek(Map<String, int> m) {
  String? isim;
  int? max;
  m.forEach((k, v) {
    if (max == null || v > max!) {
      max = v;
      isim = k;
    }
  });
  return isim;
}
void main() => print(enYuksek({"Ali": 80, "Ayşe": 95, "Deniz": 90}));
```

## 14) Fibonacci (n terim)
```dart
List<int> fib(int n) {
  if (n <= 0) return [];
  if (n == 1) return [0];
  final l = [0, 1];
  while (l.length < n) {
    l.add(l[l.length - 1] + l[l.length - 2]);
  }
  return l;
}
void main() => print(fib(7));
```

## 15) Tekrar eden elemanları bul
```dart
Set<int> tekrarEdenler(List<int> l) {
  final gorulen = <int>{};
  final tekrar = <int>{};
  for (final n in l) {
    if (!gorulen.add(n)) tekrar.add(n);
  }
  return tekrar;
}
void main() => print(tekrarEdenler([1,2,3,2,4,1,5]));
```

## 16) String’deki sesli harf sayısı
```dart
int sesliSay(String s) {
  const sesliler = "aeıioöuüAEIİOÖUÜ";
  var c = 0;
  for (final ch in s.split("")) {
    if (sesliler.contains(ch)) c++;
  }
  return c;
}
void main() => print(sesliSay("Merhaba Dünya"));
```

## 17) Tüm karakterler benzersiz mi?
```dart
bool benzersiz(String s) {
  final g = <String>{};
  for (final ch in s.split("")) {
    if (!g.add(ch)) return false;
  }
  return true;
}
void main() => print(benzersiz("dart"));
```

## 18) Listeyi ters çevir (manuel)
```dart
List<T> ters<T>(List<T> l) {
  final r = <T>[];
  for (var i = l.length - 1; i >= 0; i--) {
    r.add(l[i]);
  }
  return r;
}
void main() => print(ters([1,2,3]));
```

## 19) Belirli değerden büyükleri say
```dart
int buyukAdet(List<int> l, int limit) {
  var c = 0;
  for (final n in l) if (n > limit) c++;
  return c;
}
void main() => print(buyukAdet([10,50,60,30], 40));
```

## 20) Index–değer çiftleri
```dart
void main() {
  final l = ["a","b","c"];
  for (var i = 0; i < l.length; i++) {
    print("$i -> ${l[i]}");
  }
}
```

## 21) Map değerlerinin ortalaması
```dart
double mapOrtalama(Map<String, int> m) {
  if (m.isEmpty) return 0;
  var t = 0;
  for (final v in m.values) t += v;
  return t / m.length;
}
void main() => print(mapOrtalama({"Mat":80,"Fiz":70,"Tür":90}));
```

## 22) En sık geçen harf
```dart
String? enSik(String s) {
  final f = <String,int>{};
  for (final ch in s.split("")) {
    f[ch] = (f[ch] ?? 0) + 1;
  }
  String? harf;
  int? max;
  f.forEach((k,v){
    if (max == null || v > max!) {
      max = v;
      harf = k;
    }
  });
  return harf;
}
void main() => print(enSik("programlama"));
```

## 23) İlk tekrar eden eleman
```dart
int? ilkTekrar(List<int> l) {
  final g = <int>{};
  for (final n in l) {
    if (!g.add(n)) return n;
  }
  return null;
}
void main() => print(ilkTekrar([3,1,4,2,5,4,6]));
```

## 24) Minimum uzunluk şartını sağlayan kelimeler
```dart
List<String> uzunKel(List<String> l, int min) =>
  [for (final k in l) if (k.length >= min) k];
void main() => print(uzunKel(["dart","ui","kod","flutter"], 4));
```

## 25) İki listeyi birleştir
```dart
List<T> birlestir<T>(List<T> a, List<T> b) => [...a, ...b];
void main() => print(birlestir([1,2],[3,4]));
```

## Notlar
- Fonksiyonlar yan etki üretmez.
- Set tabanlı tekrar analizleri O(n).
- Null güvenliği sağlandı.
- Gereksiz kopyalardan kaçınıldı.
