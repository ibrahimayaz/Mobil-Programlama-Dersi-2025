# Hafta 2 Alıştırmalar
Aşağıdaki alıştırmalar temel seviyededir. Çözümleri hemen yazma; önce düşün, sonra uygula.

## 1) 3 ve 5'e Bölünebilme
Bir `sayi` değişkeni tanımla. Hem 3 hem 5 ile tam bölünebiliyorsa “EVET” yaz, değilse “HAYIR”. İpucu: `%` kullan.

## 2) Yaş Sorgusu
`yas` değişkeni: 18+ ise “Yetişkin” değilse “Reşit Değil”.

## 3) Ortalama Not Yorumlama
Üç not tanımla. Ortalama 90+ “Mükemmel”, 70+ “İyi”, 50+ “Geçti”, altı “Kaldı”.

## 4) Büyük Olanı Bul
İki sayıdan büyük olanı yazdır. Eşitse “EŞİT”.

## 5) Hava Durumu
`sicaklik`: <0 “DONMA”, 0–14 “SERİN”, 15–24 “NORMAL”, 25+ “SICAK”.

## 6) İşaret Kontrolü
Bir sayı negatif / pozitif / sıfır mı?

## 7) Saat Dilimi
`saat` (0–23). 5–11 Sabah, 12–16 Öğlen, 17–20 Akşam, diğer Gece.

## 8) Basit BMI
`kilo` ve `boy` (metre). Hesap: kilo/(boy*boy). 25+ “Yüksek” aksi “Normal”. (Ondalık hatası için sorun etme.)

## 9) En Büyük Üçlü
Üç sayıdan en büyüğünü yaz. İpucu: if zinciri.

## 10) Devamsızlık + Not
`not` >=50 VE `devamsizlik` <10 ise “GEÇTİ” değilse “KALDI”.

---
## İpucu Örnekleri
Koşul zinciri:
```dart
if (ortalama >= 90) {
  print("Mükemmel");
} else if (ortalama >= 70) {
  print("İyi");
} else if (ortalama >= 50) {
  print("Geçti");
} else {
  print("Kaldı");
}
```
Mantık birleştirme:
```dart
if (not >= 50 && devamsizlik < 10) {
  print("GEÇTİ");
}
```
---
Başaramazsan moral bozma: Tekrar dene, mantığı küçük parçalara ayır.