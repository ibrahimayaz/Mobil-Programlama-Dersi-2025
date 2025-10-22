# 📚 Hafta 3: Listeler (List), Map, Set ve Döngüler

Bu hafta:
- Liste (List) nedir, neden kullanırız?
- Eleman ekleme, silme, güncelleme
- Uzunluk (length), indeks erişimi
- Döngüler: `for`, `for-in`, `while`
- Basit algoritmalar: toplam, ortalama, en büyük / en küçük bulma, filtreleme

Önceki haftalarda: değişkenler + operatörler + koşullar → Şimdi birden fazla veriyi düzenli tutmayı öğreniyoruz.

---
## 🧱 Liste (List) Nedir?
Birden fazla değeri tek bir değişkende saklamamızı sağlayan yapıdır.
```dart
var sayilar = [10, 20, 30, 40];
var isimler = ["Ali", "Ayşe", "Mehmet"];
```
| İşlem | Açıklama | Örnek |
|-------|---------|-------|
| Eleman alma | İndeks 0’dan başlar | `isimler[0]` → "Ali" |
| Uzunluk | Eleman sayısı | `isimler.length` |
| Ekleme (sona) | `.add()` | `isimler.add("Zeynep");` |
| Araya ekleme | `.insert(i, deger)` | `isimler.insert(1, "Deniz");` |
| Silme (değer) | `.remove("Ali")` | İlk eşleşeni siler |
| İndeksle silme | `.removeAt(2)` | 3. elemanı siler |
| Tümünü silme | `.clear()` | Hepsini temizler |

---
## 🔁 Döngüler
Aynı işlemi tekrar tekrar yazmamak için kullanılır.
### 1) Klasik for
```dart
for (var i = 0; i < sayilar.length; i++) {
  print(sayilar[i]);
}
```
### 2) for-in
```dart
for (var isim in isimler) {
  print(isim);
}
```
### 3) while
```dart
var i = 0;
while (i < sayilar.length) {
  print(sayilar[i]);
  i++;
}
```
---
## 🔎 Temel Liste İşlemleri Amaçları
| Amaç | Örnek Fikir |
|------|-------------|
| Toplam | Notların toplamını bulma |
| Ortalama | Sınav ortalaması |
| En büyük / en küçük | Sayısal veride analiz |
| Filtreleme | Çift sayıları ayırma |
| Arama | İsim listesinde kişi var mı? |

---
## ✅ 5 Örnek Program
### 1) Listeye Eleman Ekleme ve Yazdırma
```dart
void main() {
  var sehirler = ["Ankara", "İstanbul", "İzmir"];
  sehirler.add("Bursa");
  sehirler.insert(1, "Eskişehir");
  print("Şehirler: $sehirler");
  print("Toplam şehir sayısı: ${sehirler.length}");
}
```
### 2) Sayıların Toplamı ve Ortalaması
```dart
void main() {
  var notlar = [70, 80, 90, 60];
  var toplam = 0;
  for (var n in notlar) {
    toplam += n;
  }
  var ortalama = toplam / notlar.length;
  print("Notlar: $notlar");
  print("Toplam: $toplam");
  print("Ortalama: $ortalama");
}
```
### 3) En Büyük ve En Küçük Sayı
```dart
void main() {
  var sayilar = [12, 5, 27, 3, 18];
  var enBuyuk = sayilar[0];
  var enKucuk = sayilar[0];
  for (var s in sayilar) {
    if (s > enBuyuk) enBuyuk = s;
    if (s < enKucuk) enKucuk = s;
  }
  print("Sayılar: $sayilar");
  print("En büyük: $enBuyuk");
  print("En küçük: $enKucuk");
}
```
### 4) Çift Sayıları Filtreleme
```dart
void main() {
  var sayilar = [3, 4, 7, 10, 12, 15, 18];
  var ciftler = <int>[];
  for (var s in sayilar) {
    if (s % 2 == 0) ciftler.add(s);
  }
  print("Tüm sayılar: $sayilar");
  print("Çift sayılar: $ciftler");
}
```
### 5) İsim Arama
```dart
void main() {
  var isimler = ["Ali", "Ayşe", "Zeynep", "Mert"];
  var aranan = "Ayşe";
  var bulundu = false;
  for (var isim in isimler) {
    if (isim == aranan) {
      bulundu = true;
      break;
    }
  }
  if (bulundu) {
    print("$aranan listede var.");
  } else {
    print("$aranan listede yok.");
  }
}
```
---
## ⚠️ Sık Yapılan Hatalar
| Hata | Sorun | Doğru |
|------|-------|-------|
| `liste[5]` (boy 5 iken) | İndeks dışı | `liste.length - 1` max |
| Döngüde `i++` unutma | Sonsuz döngü riski | `i++` ekle |
| Boş listeyi yanlış okuma | Mantık hatası | `var l = []; l.add(10);` |
| `print(l[l.length])` | Son eleman dışı | `l[l.length - 1]` |
---

## 🧪 Mini Alıştırmalar
1. 5 şehirden oluşan liste: ilk ve son elemanı yaz.
2. 1–10 arası sayı listesi oluştur, toplamını yaz.
3. Not listesinden `[45,67,80,90]` → 50’den küçükleri `dusukNotlar` listesine aktar.
4. Bir isim kaç kere geçmiş say.
5. `[2,4,6,8]` elemanlarını 2 ile çarpıp yeni liste oluştur.
6. Listedeki en büyük 2 sayıyı bul.
7. Sayıların karelerini alan liste üret.
8. Uzunluğu 5’ten büyük isimleri filtrele.
9. Liste boşsa “Boş liste” değilse eleman sayısını yaz.
10. Tek sayı adedini hesapla.

---

# 🟢 Set ve Map

### 🎯 Hedefler
- Set: benzersiz veri
- Map: anahtar-değer saklama
- Frekans (sıklık) sayımı

### 🟢 Set Temel
```dart
var kume = <int>{1,2,2,3}; // {1,2,3}
kume.add(4);
kume.remove(2);
print(kume.contains(3));
print(kume); // {1,3,4}
```

### 🟡 Map Temel
```dart
var ogr = {'ad':'Ali','yas':16,'sehir':'Ankara'};
print(ogr['ad']);
ogr['yas'] = 17;
ogr['okul'] = 'Lise';
print(ogr);
```

### Map Üzerinde Dolaşma
```dart
var notlar = {'Ali':80,'Ayşe':90,'Mehmet':70};
for (var k in notlar.keys) {
  print('$k -> ${notlar[k]}');
}
```

### ✅ Örnekler
1) Benzersiz İsimler:
```dart
var isimler = <String>{'Ali','Ayşe','Ali','Mehmet'};
print(isimler); // tekrarlar silinir
```
2) Set Eleman Kontrol:
```dart
var harfler = <String>{};
harfler..add('a')..add('b');
print(harfler.contains('a'));
```
3) Öğrenci Map:
```dart
var ogrenci = {'ad':'Zeynep','yas':17,'sinif':'11A'};
print('Ad: ${ogrenci['ad']} Yaş: ${ogrenci['yas']}');
```
4) Harf Frekansı (optimize):
```dart
var metin = 'merhaba';
var frekans = <String,int>{};
for (var h in metin.split('')) {
  frekans[h] = (frekans[h] ?? 0) + 1;
}
print(frekans);
```
5) Ders Not Ortalaması:
```dart
var dersNot = {'Mat':80,'Türkçe':90,'Fizik':70};
var toplam = 0;
for (var v in dersNot.values) toplam += v;
print('Ortalama: ${toplam / dersNot.length}');
```

### ⚠️ Sık Hatalar
| Hata | Açıklama | Çözüm |
|------|----------|-------|
| Set indekslenmeye çalışmak | Set sırasız | for-in ile dolaş |
| Map olmayan key -> null | Hata sanılabilir | (map[key] ?? varsayılan) kullan |
| Aynı key üstüne yazma bilinmiyor | Veri kaybı | Önce var mı kontrol et |

### 🧪 Mini Alıştırmalar
1. Cümledeki kelimeleri Set ile benzersizleştir
2. İsim → yaş Map’inde 18+ olanları yazdır
3. Sayı listesinde tekrar edenleri Set ile temizle
4. Kelimedeki sesli harf sıklığı (Map)
5. 80 üstü notları filtrele
---
## 🏁 Ödevler (Özet)
1. Öğrenci not analizi: ortalama, max, min, 50 altı sayısı.
2. Ürün fiyat listesi: toplam, 100 üzeri ayrı liste.
3. Sayı listesi: max - min farkı.
4. Sıcaklık listesi: soğuk / normal / sıcak sayısı.
5. İsim listesinde aranan kişinin ilk index’i veya "YOK".
---
## 🧠 Terimler
| Terim | Anlam | Örnek |
|-------|-------|-------|
| List | Çoklu veri | `[1,2,3]` |
| İndeks | Eleman sırası | `liste[0]` |
| length | Eleman sayısı | `liste.length` |
| for | Döngü | `for(...) {}` |
| while | Koşullu döngü | `while(i<5){}` |
| break | Döngüyü sonlandırır | `break;` |