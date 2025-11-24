# 📚 Hafta 4: Fonksiyonlara Giriş ve Basit Sınıf (OOP Başlangıcı)

Bu hafta konuları:
- Fonksiyon nedir?
- Parametre ve dönüş değeri (return)
- Neden fonksiyon kullanırız?
- Basit sınıf (class), yapıcı (constructor) ve metot
- İleri konular (kalıtım vb.) BU HAFTA YOK

---
## 🔧 Fonksiyon Nedir?
Belirli bir işi yapan tekrar kullanılabilir kod bloğu.
```dart
void selamla() {
  print("Merhaba");
}
```
Parametreli:
```dart
void yazIsim(String ad) {
  print("Merhaba $ad");
}
```
Değer döndüren:
```dart
int topla(int a, int b) {
  return a + b;
}
```
Kısa (ok) gösterimi:
```dart
int carp(int a, int b) => a * b;
```
---
## 🎯 Neden Fonksiyon?
| Sorun | Çözüm |
|-------|-------|
| Aynı kodu tekrar yazma | Fonksiyonlaştır |
| Okunabilirlik azalır | Mantıksal parçalara böl |
| Hata takibi zor | Küçük bloklar yönetilebilir |
---
## 🧪 Parametre ve Return Örnekleri
```dart
void yazMerhaba() {
  print("Merhaba!");
}
void selamla(String ad) {
  print("Selam $ad");
}
int ikiKat(int x) {
  return x * 2;
}
double ortalama(int a, int b, int c) {
  return (a + b + c) / 3;
}
```
---
## 📦 Basit Sınıf (Class)
İlgili verileri ve işlemleri bir arada tutar.
```dart
class Ogrenci {
  String ad;
  int yas;
  int not1;
  int not2;
  Ogrenci(this.ad, this.yas, this.not1, this.not2);
  double ortalama() {
    return (not1 + not2) / 2;
  }
  void ozet() {
    print("Öğrenci: $ad | Yaş: $yas | Ortalama: ${ortalama()}");
  }
}
void main() {
  var ogr = Ogrenci("Mehmet", 16, 80, 90);
  ogr.ozet();
}
```
---
## ✅ 5 Örnek Program
### 1) Parametresiz Fonksiyon
```dart
void selam() {
  print("Merhaba Dünya!");
}
void main() {
  selam();
}
```
### 2) Parametreli Fonksiyon
```dart
void yazMesaj(String ad, int yas) {
  print("Ad: $ad | Yaş: $yas");
}
void main() {
  yazMesaj("Zeynep", 16);
  yazMesaj("Ali", 17);
}
```
### 3) Toplama (return)
```dart
int topla(int a, int b) {
  return a + b;
}
void main() {
  var sonuc = topla(12, 8);
  print("Toplam: $sonuc");
}
```
### 4) Ortalama Hesaplama
```dart
double ortalama(int a, int b, int c) {
  return (a + b + c) / 3;
}
void main() {
  var ort = ortalama(70, 80, 90);
  print("Ortalama: $ort");
}
```
### 5) Basit Sınıf Kullanımı
```dart
class Ogrenci {
  String ad;
  int yas;
  int not1;
  int not2;
  Ogrenci(this.ad, this.yas, this.not1, this.not2);
  double ortalama() {
    return (not1 + not2) / 2;
  }
  void ozet() {
    print("Öğrenci: $ad | Yaş: $yas | Ortalama: ${ortalama()}");
  }
}
void main() {
  var ogr = Ogrenci("Mehmet", 16, 80, 90);
  ogr.ozet();
}
```
---
## ⚠️ Sık Hatalar
| Hata | Sorun | Doğrusu |
|------|-------|---------|
| `return` unutma | Fonksiyon sonuç üretmez | `return deger;` |
| Yanlış tür döndürme | Derleme hatası | Tür uyumlu olmalı |
| Sınıf adı küçük harf | Standart dışı | Büyük harfle başla: `Ogrenci` |
| Constructor’da alan atamamak | Varsayılan null | `Ogrenci(this.ad, ...)` |
---
## 🧪 Mini Alıştırmalar
1. `merhaba()` → “Merhaba!”
2. `kare(int x)` → kare döndür.
3. `buyuk(int a, int b)` → büyük olanı döndür.
4. 3 sayının ortalamasını döndür.
5. İsim + yaş parametreli `bilgiYaz(ad, yas)`.
6. Celsius → Fahrenheit çevir (`F = C * 1.8 + 32`).
7. Not ortalaması >= 50 ise `true` döndür.
8. Metnin uzunluğunu döndüren fonksiyon.
9. Tek/çift bilgisini `String` döndüren fonksiyon.
10. `Kitap` sınıfı: ad + sayfa + `ozet()` metodu.
---
## 🏁 Ödevler (Özet)
1. `hesaplaIndirim(fiyat, yuzde)` → indirimli fiyat.
2. `ortalamaNot(List<int> notlar)` → ortalama.
3. `class Ders { ad, saat }` + yazdıran metot.
4. `class Dikdortgen { en,boy }` → `alan()`, `cevre()`. 
5. Öğrenci sınıfına `gecmeDurumu()` (ortalama >= 50 → GEÇTİ) metodu.
---
## 🧠 Terimler
| Terim | Anlam | Örnek |
|-------|-------|-------|
| Fonksiyon | Kod bloğu | `int f(){}` |
| Parametre | Girdi | `(int x)` |
| Return | Çıktı döndürür | `return x;` |
| Class | Şablon | `class Ogrenci {}` |
| Nesne | Sınıftan üretilmiş | `var o = Ogrenci(...);` |
| Metot | Sınıf içi fonksiyon | `ortalama()` |