# 📚 Hafta 2: Operatörler ve Koşullar (Temel Seviye)

Bu hafta; sayılarla işlem yapmayı, değerleri karşılaştırmayı ve koşullara göre farklı çıktılar üretmeyi öğreniyoruz. Henüz fonksiyon, döngü, liste yok. Sadece karar mekanizması.

---
## 🎯 Hedefler
- Aritmetik operatörler: `+  -  *  /  %`
- Karşılaştırma operatörleri: `==  !=  >  <  >=  <=`
- Mantıksal operatörler: `&&  ||  !`
- `if`, `else if`, `else` kullanımı
- Temel karar yapısı kurma

---
## ➗ Aritmetik Operatörler
| Operatör | Anlam      | Örnek   | Sonuç  |
|----------|------------|---------|--------|
| +        | Toplama    | 3 + 5   | 8      |
| -        | Çıkarma    | 10 - 4  | 6      |
| *        | Çarpma     | 6 * 2   | 12     |
| /        | Bölme      | 7 / 2   | 3.5    |
| %        | Mod (kalan)| 10 % 3  | 1      |

Mod (%) özellikle bir sayının çift mi tek mi olduğunu anlamak için kullanılır:
```dart
var sayi = 14;
print(sayi % 2); // 0 -> çift, 1 -> tek
```

---
## 🔍 Karşılaştırma Operatörleri
| Operatör | Anlam             | Örnek  | Sonuç  |
|----------|-------------------|--------|--------|
| ==       | Eşit mi           | 5 == 5 | true   |
| !=       | Eşit değil mi     | 5 != 3 | true   |
| >        | Büyük mü          | 8 > 4  | true   |
| <        | Küçük mü          | 2 < 7  | true   |
| >=       | Büyük veya eşit   | 5 >= 5 | true   |
| <=       | Küçük veya eşit   | 4 <= 6 | true   |

Çıktılar `bool` türündedir: `true` veya `false`.

---
## 🧠 Mantıksal Operatörler
| Operatör | Anlam | Örnek           | Sonuç  |
|----------|-------|-----------------|--------|
| &&       | VE    | true && false   | false  |
| ||       | VEYA  | true || false   | true   |
| !        | DEĞİL | !true           | false  |

Kısa özet:
- `&&` → Her iki şart da doğru olmalı.
- `||` → En az biri doğru yeter.
- `!` → Tersine çevirir (`!true` → false).

---
## 🏗️ Koşul Yapısı
```dart
if (kosul) {
  // kosul true ise çalışır
} else if (baskaKosul) {
  // ikinci durum
} else {
  // hiçbiri değilse
}
```

---
## ✅ 5 Örnek Program
### 1) Çift / Tek
```dart
void main() {
  var sayi = 17;
  if (sayi % 2 == 0) {
    print("Sayı çift");
  } else {
    print("Sayı tek");
  }
}
```
### 2) Not Durumu
```dart
void main() {
  var not = 73;
  if (not >= 85) {
    print("Puan: $not -> Çok İyi");
  } else if (not >= 70) {
    print("Puan: $not -> İyi");
  } else if (not >= 50) {
    print("Puan: $not -> Geçti");
  } else {
    print("Puan: $not -> Kaldı");
  }
}
```
### 3) Sıcaklık Yorumu
```dart
void main() {
  var sicaklik = 9;
  if (sicaklik >= 25) {
    print("Hava sıcak");
  } else if (sicaklik >= 15) {
    print("Hava ılık");
  } else if (sicaklik >= 5) {
    print("Hava serin");
  } else {
    print("Hava soğuk");
  }
}
```
### 4) Basit Giriş
```dart
void main() {
  var kayitliKullanici = "admin";
  var kayitliSifre = "1234";
  var girilenKullanici = "admin";
  var girilenSifre = "1234";
  if (girilenKullanici == kayitliKullanici && girilenSifre == kayitliSifre) {
    print("Giriş başarılı");
  } else {
    print("Bilgiler hatalı");
  }
}
```
### 5) Sporcu Kabul
```dart
void main() {
  var yas = 16;
  var kilo = 74;
  if (yas >= 15 && kilo < 80) {
    print("Sporcu kabul edildi");
  } else {
    print("Şartlar uygun değil");
  }
}
```

---
## ⚠️ Sık Hatalar
| Hatalı | Sorun | Doğru |
|--------|-------|-------|
| `if (sayi = 5)` | `=` atama yapar | `if (sayi == 5)` |
| `if (not > 50);` | `;` bloğu keser | `if (not > 50) { ... }` |
| `print("Sonuç:" + 5)` | 5 sayı → String değil | `print("Sonuç: " + 5.toString())` |
| `else if(not>70)` | Okunabilirlik düşük | `else if (not > 70)` |

---
## 🧪 Mini Alıştırmalar
1. Bir sayının 3 ve 5’e aynı anda bölünebilir olup olmadığını yaz.
2. Yaş 18+ ise “Yetişkin” değilse “Reşit Değil”.
3. 3 not ortalamasına göre: 90+ Mükemmel, 70+ İyi, 50+ Geçti, altı Kaldı.
4. İki sayıdan büyük olanı yaz.
5. Derece: <0 “DONMA RİSKİ”, >30 “SICAK”, değilse “NORMAL”.
6. Sayı negatif / pozitif / sıfır.
7. Saat (0–23) → 5–11 Sabah, 12–16 Öğlen, 17–20 Akşam, diğer Gece.
8. Kilo ve boy ile (kilo/(boy*boy)) basit hesapla: 25 üstü “Yüksek” aksi “Normal”.
9. Üç sayıdan en büyüğü.
10. Not >=50 VE devamsızlık <10 ise “GEÇTİ” aksi “KALDI”.

---
## 🏁 Ödev (4 Uygulama)
1. Yaş 18+ → “Ehliyet alabilir”, değilse “Beklemeli”.
2. Üç ders notu ortalaması: 85+ “TEBRİKLER”, 50–84 “NORMAL”, <50 “DESTEK GEREKİYOR”.
3. Sayı çift / tek + ayrıca >10 ise sonuna “(10'dan büyük)” ekle.
4. Ürün fiyatı + indirim yüzdesi → indirimli fiyat hesapla.

---
## 🧠 Terimler
| Terim | Açıklama | Örnek |
|-------|----------|-------|
| Operatör | İşlem işareti | `+`, `%` |
| Koşul | Doğru/Yanlış ifade | `yas >= 18` |
| Karşılaştırma | İki değeri kıyaslar | `a == b` |
| Mantıksal | Koşulları birleştirir | `x > 5 && y < 10` |
| Blok | `{ }` içindeki kısım | `if { }` |

---
## 🔜 Gelecek Hafta (Hafta 3)
Pekiştirme + sonraki adım için hazırlık.
