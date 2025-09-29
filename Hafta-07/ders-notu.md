# 📘 Hafta 07: Genel Tekrar ve Uygulamalı Soru Çözümü

## 🎯 Kapsam
Bu hafta önceki konuları pekiştiriyoruz:
- Değişkenler, tipler (var, final, const)
- Koşullar (if / else, ternary)
- Döngüler (for, while, for-in, forEach)
- Fonksiyonlar (parametre, geri dönüş)
- List, Set, Map temel işlemler
- Basit algoritmalar (frekans, filtre, arama, ortalama)
- Kod optimizasyonu (gereksiz değişkenleri azaltma, null güvenli yazım)

---

## 🧱 Temel Yapılar

### Değişken Tanımları
```dart
final pi = 3.14;     // runtime sabit
const versiyon = 1;  // derleme zamanı sabiti
var ad = "Ali";      // tip çıkarımı
int yas = 18;
```

### Koşullar
```dart
var not = 75;
var durum = not >= 50 ? "Geçti" : "Kaldı";
```

### Döngüler
```dart
for (var i = 0; i < 5; i++) {
  print(i);
}

for (final h in "dart".split("")) {
  print(h);
}
```

### Fonksiyon
```dart
int kare(int x) => x * x;
```

---

## 📦 Koleksiyonlar

### List
```dart
final sayilar = [1, 2, 3, 4];
sayilar.add(5);
sayilar.remove(2);
```

### Set
```dart
final benzersiz = <int>{1, 2, 2, 3};
print(benzersiz); // {1, 2, 3}
```

### Map
```dart
final ogr = {"ad": "Ayşe", "yas": 17};
ogr["yas"] = 18;
```

---

## 🔍 Sık Kullanılan Paternler

### Frekans Sayımı
```dart
Map<String, int> frekans(String kelime) {
  final m = <String, int>{};
  for (final h in kelime.split("")) {
    m[h] = (m[h] ?? 0) + 1;
  }
  return m;
}
```

### Filtre (Map comprehension)
```dart
final notlar = {"Ali": 50, "Ayşe": 85, "Deniz": 92};
final yuksek = {
  for (final e in notlar.entries)
    if (e.value >= 80) e.key: e.value
};
```

### Ortalama
```dart
double ortalama(Iterable<int> sayilar) =>
    sayilar.isEmpty ? 0 : sayilar.reduce((a, b) => a + b) / sayilar.length;
```

### En Büyük
```dart
int? enBuyuk(Iterable<int> sayilar) {
  int? m;
  for (final s in sayilar) {
    if (m == null || s > m) m = s;
  }
  return m;
}
```

---

## ⚙️ Optimizasyon İpuçları
| Durum | Kötü | İyi |
|-------|------|-----|
| Gereksiz sayaç | toplam = toplam + 1 | ++toplam |
| Null kontrolü | if (x == null) x = 0 | x ??= 0 |
| Frekans | if (m[k]==null)... | m[k] = (m[k] ?? 0) + 1 |
| Liste toplamı | döngü + sayaç | reduce / fold |
| Filtre + ekleme | if(...) map[key]=v | for-comprehension |

---

## ✅ Hata Tuzakları
| Hata | Açıklama | Çözüm |
|------|----------|-------|
| Boş listede reduce | Hata atar | isEmpty kontrolü |
| Map olmayan key | null döner | ?? varsayılan ver |
| Set indeksleme | Desteklenmez | for-in kullan |
| const yanlış kullanımı | runtime veri const | final kullan |
| Tekrarlı key | Üzerine yazar | Bilinçli güncelle |

---

## 🧪 Mini Alıştırma Fikirleri
1. 1–50 arası çift sayıların toplamı
2. Bir kelimenin palindrome olup olmadığı
3. Not listesinde 70+ kaç adet
4. En uzun kelimeyi bul
5. Harf frekansı en büyük olanı yaz

---

## 🏁 Bu Haftanın Amacı
- Patern tanıma becerisi
- Kod sadeleştirme
- Soru çözüm hızını artırma

Hazırsan 25 soru–cevap dosyasına geç: sorular-ve-cevaplar.md
