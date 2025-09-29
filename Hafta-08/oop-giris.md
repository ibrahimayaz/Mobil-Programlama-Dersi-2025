# Hafta 08 – OOP Kısa Özet (İlk 4 Madde)

Bu dosya yalnızca ilk dört OOP giriş konusuna (Neden OOP, Sınıf Temeli, Constructor Türleri, Getter/Setter & Kapsülleme) odaklanır; derin kavramlar (mixin, inheritance detayları, sealed vs) bu aşamada dahil edilmemiştir.

---
## 1. Neden OOP?
- Veri + davranışı aynı yapıda toplar (cohesion artışı)
- Kod tekrarını azaltır (reuse)
- Değişikliklerin etkisini sınırlar (bakım kolaylığı)
- Modülerlik ve test edilebilirlik sağlar

Karşılaştırma:
```dart
// Prosedürel tarz
double indirimliFiyat(double fiyat, double oran) => fiyat - fiyat * oran;

void main() {
  print(indirimliFiyat(100, 0.10));
  print(indirimliFiyat(250, 0.15));
}
```
```dart
// Nesne yönelimli tarz
class Urun {
  final String ad;
  final double fiyat;
  const Urun(this.ad, this.fiyat);
  double indirimli(double oran) => fiyat * (1 - oran);
  @override
  String toString() => '$ad ₺$fiyat';
}
void main() {
  const u1 = Urun('Kalem', 100);
  const u2 = Urun('Çanta', 250);
  print(u1.indirimli(0.10)); // 90.0
  print(u2.indirimli(0.15)); // 212.5
}
```

---
## 2. Sınıf (Class) Temeli
Temel veri + davranış + kapsülleme örneği:
```dart
class Kullanici {
  final int id;        // Değişmez kimlik
  String ad;           // Güncellenebilir alan
  int _puan = 0;       // Kapsüllenen iç durum

  Kullanici(this.id, this.ad);

  void puanEkle(int d) { if (d > 0) _puan += d; }
  int get puan => _puan;

  @override
  String toString() => 'Kullanici(id:$id, ad:$ad, puan:$_puan)';
}

void main() {
  final k = Kullanici(1, 'Ayşe')
    ..puanEkle(10)
    ..puanEkle(5);
  print(k); // Kullanici(id:1, ad:Ayşe, puan:15)
}
```

Hesaplanmış özelliklerle örnek:
```dart
class Dikdortgen {
  final double genislik;
  final double yukseklik;
  const Dikdortgen(this.genislik, this.yukseklik);
  double get alan => genislik * yukseklik;
  double get cevre => 2 * (genislik + yukseklik);
}
```

Sayaç örneği:
```dart
class Sayac {
  int _deger = 0;
  void art() => _deger++;
  void artN(int n) { if (n > 0) _deger += n; }
  int get deger => _deger;
}
```

---
## 3. Constructor Türleri (Default, Named, Factory, Initializer List)
Özet:
- Default: Ana kurucu
- Named: Alternatif anlamlı kurulum
- Factory: Önbellek / karar / aynı nesneyi döndürme
- Initializer list: final alanları hesaplayarak başlatma

Tek dosyada derli örnek:
```dart
import 'dart:math';

class Nokta {
  final double x, y;
  final double uzaklik; // Orijine uzaklık

  // Default
  Nokta(this.x, this.y) : uzaklik = sqrt(x * x + y * y);

  // Named (orijin)
  Nokta.orijin() : this(0, 0);

  // Factory: polar koordinattan kartesyene
  factory Nokta.polar(double r, double aciRadyan) {
    final x = r * cos(aciRadyan);
    final y = r * sin(aciRadyan);
    return Nokta(x, y);
  }

  @override
  String toString() => 'Nokta(x:${x.toStringAsFixed(2)}, y:${y.toStringAsFixed(2)}, r:${uzaklik.toStringAsFixed(2)})';
}

class KullaniciCache {
  final int id; final String ad;
  static final _havuz = <int, KullaniciCache>{};
  factory KullaniciCache(int id, String ad) =>
      _havuz.putIfAbsent(id, () => KullaniciCache._(id, ad));
  KullaniciCache._(this.id, this.ad);
  @override
  String toString() => 'Kullanici#$id($ad)';
}
```

---
## 4. Getter / Setter / Kapsülleme
Amaç: İç durum bütünlüğünü korumak + doğrulama eklemek.

Sıcaklık dönüşümü:
```dart
class Sicaklik {
  double _c; // Celsius
  Sicaklik.celsius(this._c);
  Sicaklik.fahrenheit(double f) : _c = (f - 32) * 5 / 9;

  double get celsius => _c;
  double get fahrenheit => _c * 9 / 5 + 32;

  set celsius(double v) { if (v > -273.15) _c = v; }
  set fahrenheit(double f) {
    final c = (f - 32) * 5 / 9;
    if (c > -273.15) _c = c;
  }

  @override
  String toString() => '${_c.toStringAsFixed(2)}°C / ${fahrenheit.toStringAsFixed(2)}°F';
}
```

Depo (salt okunur liste):
```dart
class Depo {
  final List<String> _urunler = [];
  List<String> get urunler => List.unmodifiable(_urunler);
  void ekle(String u) { if (u.trim().isNotEmpty) _urunler.add(u); }
}
```

Puan tablosu:
```dart
class PuanTablosu {
  int _skor = 0;
  int get skor => _skor;
  void ekle(int p) { if (p > 0) _skor += p; }
  bool azalt(int p) {
    if (p > 0 && _skor - p >= 0) { _skor -= p; return true; }
    return false;
  }
}
```

---
## Mini Alıştırmalar
1. `Zamanlayici`: `baslat()` sonrası geçen süre (Duration) döndüren getter.
2. `Stok`: ürün ekle/çıkar, toplamAdet getter.
3. `Mesafe`: kilometre <-> metre dönüşümü (iki yönlü getter/setter).
4. `NotDefteri`: `_notlar` listesi, arama fonksiyonu + sadece okunabilir getter.

---
Bu dosya Flutter aşamasına geçmeden önce minimum ama sağlam OOP temelini amaçlar.