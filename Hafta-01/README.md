# 📚 Hafta 1: Dart'a Giriş (Tamamen Temel Seviyede)

Bu hafta hiçbir şekilde ileri seviye konulara (sınıflar, listeler, kullanıcıdan veri alma, fonksiyon yazma vb.) girmiyoruz. Sadece: 
- Program nedir?
- Dart nasıl çalışır?
- Değişken nedir?
- Temel veri türleri nelerdir?
- Ekrana nasıl yazı yazarız?
- Basit 4 örnek uygulama (sade, anlaşılır)

---
## 🎯 Hedef
Hafta sonunda: Değişken tanımlayıp, onlara değer atayıp, `print()` ile ekrana bilgi verebilmeyi öğreneceksiniz.

---
## 💡 Programlama Nedir?
Bilgisayara adım adım yapması gereken işleri anlatmaktır. Dart dilini kullanarak bilgisayara "şunu yaz", "bunu hesapla" gibi komutlar veriyoruz.

---
## 🧠 Dart Nedir?
Google tarafından geliştirilmiş bir programlama dilidir. Flutter ile birlikte mobil uygulama (Android / iOS) geliştirmekte kullanacağız. Bu hafta sadece temel sözdizimini (syntax) tanıyoruz.

---
## 💾 Değişken (Variable) Nedir?
Bir bilgiyi saklamak için kullandığımız isimlendirilmiş kutudur.

Örnek düşün: Masanda etiketlenmiş kutular var.
- Kutunun adı: `ogrenciAdi`
- İçindeki şey: "Ayşe"

Dart'ta:
```dart
var ogrenciAdi = "Ayşe";  // ogrenciAdi kutusuna "Ayşe" yazısını koyduk
```

### Neden Değişken Kullanırız?
- Aynı bilgiyi tekrar tekrar yazmak yerine bir isimle kullanırız.
- Sonradan değiştirebiliriz (var kullandıysak).

---
## 🔤 Temel Veri Türleri
| Tür | Amaç | Örnek |
|-----|------|-------|
| int | Tam sayılar | `int yas = 16;` |
| double | Ondalıklı sayılar | `double sicaklik = 23.5;` |
| String | Metin (yazı) | `String ad = "Ali";` |
| bool | Doğru / Yanlış | `bool gectiMi = true;` |

Bu hafta sadece bu 4 tür yeterli.

---
## 🆚 `var`, `final`, `const` Farkı
| Anahtar Kelime | Değiştirilebilir mi? | Ne Zaman Kullanılır? |
|----------------|----------------------|----------------------|
| var | Evet | Normal değişken |
| final | Hayır (bir kez atanır) | Sonradan değişmeyecek değer |
| const | Hayır (derleme anında sabit) | Matematiksel sabit gibi |

Bu hafta ağırlıkla `var` kullanacağız. `final` ve `const` sadece gösterildi.

---
## 🖨️ Ekrana Yazı Yazdırma
Kullanılan komut: `print()`
```dart
print("Merhaba Dünya");
print(5 + 3);
print("Toplam: " + (5 + 3).toString());
```

---
## ⚠️ SIK HATA ÖRNEKLERİ
| Hatalı | Doğru | Açıklama |
|--------|-------|----------|
| `var isim = Ali;` | `var isim = "Ali";` | Metinler tırnak içinde olmalı |
| `print("Yaş: " + 15);` | `print("Yaş: " + 15.toString());` | Sayıyı String'e çevirmen gerek |
| `var yas = 16` | `var yas = 16;` | Satır sonuna `;` koymayı unutma |

---
## ✅ 4 Adet Temel Örnek
Aşağıdaki örneklerin her biri ayrı çalıştırılabilir küçük programlardır.

### 1) Kişisel Tanıtım
```dart
void main() {
  var ad = "Zeynep";
  var yas = 16;
  var sehir = "Ankara";
  print("Benim adım " + ad);
  print("Yaşım: " + yas.toString());
  print("Yaşadığım şehir: " + sehir);
}
```
Ne Öğretiyor? -> Değişken tanımlama + print kullanımı

### 2) Basit Toplama - Çıkarma
```dart
void main() {
  var sayi1 = 12;
  var sayi2 = 8;
  var toplam = sayi1 + sayi2;
  var fark = sayi1 - sayi2;
  print("Birinci sayı: " + sayi1.toString());
  print("İkinci sayı: " + sayi2.toString());
  print("Toplam: " + toplam.toString());
  print("Fark: " + fark.toString());
}
```
Ne Öğretiyor? -> Aritmetik işlemler + değişkenler

### 3) Not Ortalaması Hesaplama (Basit)
```dart
void main() {
  var matematik = 80;
  var turkce = 90;
  var fizik = 70;
  var ortalama = (matematik + turkce + fizik) / 3;  // double sonuç
  print("Not Ortalaması: " + ortalama.toString());
}
```
Ne Öğretiyor? -> Ondalıklı sonuç + bölme işlemi

### 4) Sıcaklık Dönüşümü (Celsius -> Fahrenheit)
Formül: F = C * 1.8 + 32
```dart
void main() {
  var celsius = 25; // Derece cinsinden
  var fahrenheit = celsius * 1.8 + 32;
  print("Sıcaklık: " + celsius.toString() + "°C");
  print("Fahrenheit Karşılığı: " + fahrenheit.toString());
}
```
Ne Öğretiyor? -> Matematiksel ifade + formül uygulama

---
## 🔍 Alıştırmalar (Yapmanız ÖNERİLİR)
1. Kendi adın, soyadın, okulun ve hedef mesleğin olan bir program yaz.
2. 3 sınav notu girip ortalamasını bulan program yaz (örnekten esinlenebilirsin).
3. 2 sayının çarpımı ve bölümünü hesaplayan program yaz.
4. Bir öğrencinin ad, yaş, okul numarası ve geçme durumunu (true/false) yazdır.
5. Dereceyi Fahrenheit'e çeviren programı bu kez farklı bir sayı ile tekrar yaz.

---
## 🧠 Bu Hafta Öğrendiğimiz Komut ve Terimler
| Terim | Açıklama | Örnek |
|-------|----------|-------|
| `var` | Değişken tanımlar | `var yas = 15;` |
| `int` | Tam sayı türü | `int sayac = 0;` |
| `double` | Ondalıklı sayı | `double oran = 2.5;` |
| `String` | Metin türü | `String ad = "Ali";` |
| `bool` | Doğru/Yanlış | `bool aktif = true;` |
| `print()` | Ekrana yazı yazar | `print("Merhaba");` |
| `main()` | Program başlangıç noktası | `void main() { }` |
| `;` | Satır sonu | `var x = 5;` |
| `+ - * /` | Aritmetik işlemler | `a + b` |

---
## 🚀 Gelecek Hafta (Hafta 2)
Operatörleri daha derin inceleyeceğiz (%, karşılaştırma ==, >, <) ve koşul yapısına (if / else) giriş yapacağız.

Hazırsan bir sonraki haftaya geçebiliriz. Devam edelim mi? ✅
