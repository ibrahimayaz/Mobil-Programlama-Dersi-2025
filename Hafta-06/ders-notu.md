# 📚 Hafta 6: Set ve Map (Koleksiyonlara Giriş)

## 🎯 Hedefler
- Set: Benzersiz (unique) elemanlar
- Map: Anahtar → Değer eşlemesi
- Temel işlemler: ekleme, silme, arama, dolaşma
- Basit frekans (sıklık) sayımı

---
## 🟢 Set Nedir?
Tekrarlayan değerleri otomatik eler, sırasız bir koleksiyondur.
```dart
void main() {
  var sayilar = <int>{1, 2, 2, 3};
  print(sayilar);        // {1, 2, 3}
  sayilar.add(4);
  sayilar.remove(2);
  print(sayilar.contains(3)); // true
  print(sayilar);
}
```
Temel işlemler:
- add(value)
- remove(value)
- contains(value)
- length

---
## 🟡 Map Nedir?
Key → Value eşlemesi. Key benzersizdir.
```dart
void main() {
  var ogrenci = {
    "ad": "Ali",
    "yas": 16,
    "sehir": "Ankara"
  };
  print(ogrenci["ad"]);
  ogrenci["yas"] = 17;        // Güncelleme
  ogrenci["okul"] = "Lise";   // Yeni ekleme
  print(ogrenci);
}
```
Önemli özellikler:
- keys
- values
- containsKey(key)
- remove(key)

---
## 🔄 Map Üzerinde Dolaşma
```dart
void main() {
  var notlar = {"Ali": 80, "Ayşe": 90, "Mehmet": 70};
  for (var k in notlar.keys) {
    print("$k -> ${notlar[k]}"); //Ali -> 80
  }
}
```
---
## 🔠 Harf Frekansı (Frekans Tablosu)
```dart
void main() {
  var kelime = "merhaba";
  var frekans = <String, int>{};
  for (var h in kelime.split("")) {
    frekans[h] = (frekans[h] ?? 0) + 1;
  }
  print(frekans); // {m:1, e:1, r:1, h:1, a:2, b:1}
}
```
---
## ✅ 5 Örnek Program
### 1) Benzersiz İsimler
```dart
void main() {
  var isimler = <String>{"Ali", "Ayşe", "Ali", "Mehmet", "Ayşe"};
  print(isimler); // {Ali, Ayşe, Mehmet}
}
```
### 2) Set Eleman Kontrolü
```dart
void main() {
  var harfler = <String>{"a", "b", "c"};
  print(harfler.contains("b") ? "Var" : "Yok");
}
```
### 3) Öğrenci Map’i
```dart
void main() {
    var ogr = {"ad": "Zeynep", "yas": 17, "sinif": "11A"};
    print("Ad: ${ogr["ad"]} - Yaş: ${ogr["yas"]}");
}
```
### 4) Ders Not Ortalaması
```dart
void main() {
  var dersNot = {"Mat": 80, "Türkçe": 90, "Fizik": 70};
  var toplam = 0;
  for (var v in dersNot.values) toplam += v;
  print("Ortalama: ${toplam / dersNot.length}");
}
```
### 5) 80 Üstü Notları Filtreleme
```dart
void main() {
  ornek4();
}

void ornek4() {
  var notlar = {"Ali": 50, "Ayşe": 85, "Deniz": 92, "Mert": 40};
  var yuksek = <String, int>{};
  for (var n in notlar.keys) {
    int not = notlar[n]!;
    if (not >= 80) {
      yuksek[n] = not;
    }
  }
  print(yuksek); // {Ayşe: 85, Deniz: 92}
}

```
---
## ⚠️ Sık Hatalar
| Hata | Sorun | Doğru Yaklaşım |
|------|-------|----------------|
| Set’i indekslemeye çalışmak | Çalışmaz | for-in ile dön |
| Map’te olmayan key’e erişim | null dönebilir | (map[key] ?? varsayılan) |
| Aynı key eklediğinde eski veri kayboluyor | Üzerine yazar | Güncelleme olduğunun farkında ol |
| Frekans sayımında null + 1 hatası | null + 1 çalışmaz | (map[k] ?? 0) + 1 |

---
## 🧪 Mini Alıştırmalar
1. Bir cümledeki kelimeleri Set ile benzersiz listele.
2. İsim→yaş map: 18+ olanları yaz.
3. Sayı listesi `[1,2,2,3,5,5,7]` → Set ile temizle.
4. “kavak” kelimesinin harf frekansı (Map).
5. Ders→not map’inde 80+ dersleri yaz.

---
## 🏁 Ödev Önerileri
1. Ürün fiyatları: toplam + 50 üstü ürün listesi.
2. Harf frekansı + toplam farklı harf sayısı.
3. Öğrenci→not: ortalama, en yüksek, en düşük, 70+ kaç kişi.
4. Etiket listesi (List) → Set ile benzersiz etiket sayısı.
5. En çok tekrar eden harfi bul (frekans max).

---
## 🧠 Terimler
| Terim | Açıklama | Örnek |
|-------|----------|-------|
| Set | Benzersiz koleksiyon | {'a','b'} |
| Map | Anahtar→Değer | {'ad':'Ali'} |
| keys | Key listesi | map.keys |
| values | Değer listesi | map.values |
| Frekans | Tekrar sayısı | a:2, b:1 |