# Dart Temelleri

## 1. Dart Nedir?
Dart, Google tarafından geliştirilen bir programlama dilidir ve genellikle mobil uygulama geliştirme için kullanılır. Flutter framework'u ile birlikte Dart, kullanıcı arayüzleri oluşturmak için mükemmel bir araçtır.

## 2. Değişkenler (Variables)
Değişkenler, programlarımızda veri saklamak için kullandığımız isimlendirilmiş alanlardır. Dart'ta değişkenler, `var`, `final` ve `const` anahtar kelimeleri ile tanımlanabilir.

### 2.1 Var
`var` anahtar kelimesi ile tanımlanan değişken, atandığı değere göre türü belirlenir.
```dart
var isim = "Ahmet"; // String türünde
var yas = 18; // int türünde
```

### 2.2 Final
`final` ile tanımlanan bir değişken, yalnızca bir kez atanabilir ve sonrasında değiştirilemez.
```dart
final pi = 3.14; // pi değişkeni bir daha değiştirilemez
```

### 2.3 Const
`const` ile tanımlanan değişken, derleme zamanında sabit bir değer alır ve değiştirilemez.
```dart
const sabitSayi = 10; // sabitSayi değişkeni değiştirilemez
```

## 3. Veri Türleri (Data Types)
Dart, birçok yerleşik veri türüne sahiptir:

- **int**: Tam sayılar için kullanılır. Örnek: `int sayi = 10;`
- **double**: Ondalık sayılar için kullanılır. Örnek: `double pi = 3.14;`
- **String**: Metin verileri için kullanılır. Örnek: `String ad = "Ali";`
- **bool**: Boolean değerler (true/false) için kullanılır. Örnek: `bool dogruMu = true;`

## 4. Örnek Kullanım
Aşağıda, Dart'ta değişkenlerin nasıl kullanılacağını gösteren basit bir örnek bulunmaktadır:

```dart
void main() {
  var ad = "Merve";
  var yas = 16;
  print("Adım: " + ad);
  print("Yaşım: " + yas.toString());
}
```

Bu kod, kullanıcıya adını ve yaşını yazdıracaktır.