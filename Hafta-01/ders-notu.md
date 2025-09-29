# Dart Temelleri

Dart, Google tarafından geliştirilen bir programlama dilidir. Özellikle mobil uygulamalar geliştirmek için kullanılır. Dart dilinin öğrenilmesi, mobil programlama dünyasına adım atmak için harika bir başlangıçtır.

## Değişkenler (Variables)

Değişkenler, programda veri saklamak için kullanılan isimlendirilmiş alanlardır. Dart'ta değişkenler `var`, `final` veya `const` anahtar kelimeleri ile tanımlanabilir.

### `var` ile Değişken Tanımlama
`var` anahtar kelimesi, değişkenin türünü otomatik olarak belirler. Örneğin:
```dart
var isim = 'Ahmet'; // String türünde bir değişken
var yas = 16; // int türünde bir değişken
```

### `final` ile Değişken Tanımlama
`final` anahtar kelimesi ile tanımlanan değişkenler, bir kez atandıktan sonra değiştirilemez.
```dart
final dogumYili = 2007; // Değiştirilemez
```

### `const` ile Değişken Tanımlama
`const` anahtar kelimesi ile tanımlanan değişkenler, derleme zamanında sabit olan değerlerdir.
```dart
const pi = 3.14; // Sabit bir değer
```

## Veri Türleri (Data Types)

Dart, farklı veri türlerini destekler. En yaygın olanları şunlardır:
- **String**: Metin verileri. Örnek: `var ad = 'Ali';`
- **int**: Tam sayılar. Örnek: `var sayi = 10;`
- **double**: Ondalık sayılar. Örnek: `var pi = 3.14;`
- **bool**: Mantıksal değerler (true veya false). Örnek: `var dogruMu = true;`

## Örnekler (Examples)

### Değişken Kullanımı
```dart
void main() {
  var isim = 'Elif';
  var yas = 17;
  print('Benim adım $isim ve yaşım $yas.');
}
```
Bu kod, "Benim adım Elif ve yaşım 17." mesajını konsola yazdırır.

### Basit Hesaplama
```dart
void main() {
  var a = 5;
  var b = 10;
  var toplam = a + b;
  print('Toplam: $toplam');
}
```
Bu kod, iki sayının toplamını hesaplar ve "Toplam: 15" mesajını gösterir.

## Sonuç
Dart dilinin temellerini öğrenmek, mobil uygulama geliştirme yolculuğunun ilk adımıdır. Değişkenler ve veri türleri ile başlayarak daha karmaşık konulara geçebilirsiniz.