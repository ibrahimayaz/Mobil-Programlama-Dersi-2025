# Sınıf (Class) Yapısına Giriş

Bu not, sınıf (class) kavramını en temelden açıklamak için hazırlanmıştır. Örnekler Dart dilinde verilmiştir; amaç sınıf yapısını, alanları (fields), yapıcıları (constructors), metotları (methods) ve basit miras (inheritance) kullanımlarını adım adım göstermek.

## Neden sınıf kullanırız?

- Gerçek dünya nesnelerini (insan, araba, öğrenci vb.) program içinde modellemek için.

- İlgili veri ve davranışları aynı yapıda (mantıksal birimde) toplamak için.


## Temel kavramlar

- Alan (field): Sınıfın tuttuğu veri, sınıf değişkeni.

- Yapıcı (constructor): Sınıf örneği (instance) oluştururken çağrılan özel metot.

- Metot (method): Sınıfa ait davranışlar (fonksiyonlar).

- Örnek (instance): Sınıftan oluşturulmuş nesne.

### Yapıcı Metod Nedir?

Yapıcı metod (constructor), bir sınıftan yeni bir nesne oluşturulurken otomatik olarak çalışan özel bir fonksiyondur. Yapıcı metodun temel amacı, nesne ilk oluşturulduğunda gerekli alanları başlatmak (initialize etmek) ve ilk ayarları yapmaktır. Dart'ta yapıcı metod, sınıf adıyla aynı isme sahip olur ve parametre alabilir.

Örnek:

```dart
class Insan {
  String isim;
  int yas;

  // Yapıcı metod
  Insan(this.isim, this.yas);
}

var ali = Insan('Ali', 25); // ali nesnesi oluşturulurken yapıcı metod çalışır
```

Yapıcı metod sayesinde, nesne oluşturulurken gerekli veriler doğrudan atanabilir ve nesne kullanıma hazır hale gelir.

---

## Basit bir sınıf örneği

```dart
class Insan {
  String isim; // field
  int yas;     // field

  // Yapıcı (constructor)
  Insan(this.isim, this.yas);

  // Metot
  void selamla() {
    print('Merhaba, benim adım $isim ve $yas yaşındayım.');
  }
}

void main() {
  var ali = Insan('Ali', 25); // örnek (instance)
  ali.selamla();
}
```


Ne oluyor?

- `Insan` sınıfı iki alan tutuyor: `isim` ve `yas`.

- `Insan(this.isim, this.yas);` kısa biçimli yapıcıdır; parametreleri doğrudan alanlara atar.

- `selamla()` metodu örneğin davranışını gösterir.

### Nesne örneği nedir?

Bir sınıftan oluşturulan her bir varlığa "nesne örneği" (instance) denir. Örneğin, `var ali = Insan('Ali', 25);` satırı ile `Insan` sınıfından bir nesne (örnek) oluşturmuş oluruz. Bu nesne, sınıfın tanımladığı tüm özelliklere ve metotlara sahiptir.

### Dart'ta neden `new` kullanmıyoruz?

Eskiden Dart'ta nesne oluştururken `new` anahtar kelimesi kullanılırdı: `var ali = new Insan('Ali', 25);`. Ancak Dart 2 ile birlikte, daha sade ve modern bir yazım için `new` opsiyonel hale getirildi. Artık doğrudan `Insan('Ali', 25)` şeklinde nesne oluşturmak yeterlidir. Bu, kodun daha okunabilir ve kısa olmasını sağlar. Yani Dart'ta `new` yazmasak da derleyici otomatik olarak nesne oluşturur.

---

## Alanlara varsayılan değer verme ve isteğe bağlı parametreler

```dart
class Nokta {
  double x;
  double y;

  // İsteğe bağlı (opsiyonel) ve varsayılan değerli parametreli yapıcı
  Nokta({this.x = 0.0, this.y = 0.0});

  void yazdir() {
    print('Nokta(x: $x, y: $y)');
  }
}

void main() {
  var origin = Nokta();//Dikkat !!!
  origin.yazdir(); // Nokta(x: 0.0, y: 0.0)

  var p = Nokta(x: 3.5, y: 2.0);
  p.yazdir();
}
```

Bu örnekte yapıcıda adlandırılmış ve varsayılan değerli parametreler kullanıldı.

---

## Özel (private) alanlar ve getter/setter

Dart'ta `_` ile başlayan isimler dosya-sınırında(dart kitaplığında) gizli (private) kabul edilir.

```dart
class BankaHesabi {
  double _bakiye = 0.0; // gizli alan

  // Para yatırma
  void yatir(double miktar) {
    if (miktar > 0) _bakiye += miktar;
  }

  // Para çekme
  bool cek(double miktar) {
    if (miktar <= _bakiye) {
      _bakiye -= miktar;
      return true;
    }
    return false;
  }

  // Getter
  double get bakiye => _bakiye;
}

void main() {
  var h = BankaHesabi();
  h.yatir(100);
  if (h.cek(30)) print('Çekildi. Kalan: ${h.bakiye}');
}
```

Getter sayesinde `_bakiye` doğrudan dışarıdan değiştirilemez, ancak okunabilir.

---


## İsimlendirilmiş (Named) Yapıcı Metodlar

### Neden ihtiyaç var?

Bir sınıfta birden fazla farklı şekilde nesne oluşturmak isteyebiliriz. Örneğin, bazı durumlarda tüm alanları dışarıdan almak, bazı durumlarda ise varsayılan veya özel bir başlangıç değeriyle nesne oluşturmak gerekebilir. İşte bu gibi durumlarda "isimli yapıcı metod" (named constructor) kullanılır.

İsimli yapıcılar, sınıfın farklı başlatma senaryoları için ayrı ayrı tanımlanabilir. Böylece kod daha okunabilir ve esnek olur.

### Örnek:

```dart
class Kare {
  double kenar;

  Kare(this.kenar); // Ana yapıcı

  // İsimli yapıcı: kareyi sıfırdan başlatır
  Kare.bos() : kenar = 0.0;

  // İsimli yapıcı: kareyi bir kenar uzunluğuna göre başlatır
  Kare.birBirim() : kenar = 1.0;

  double alan() => kenar * kenar;
}

void main() {
  var k1 = Kare(4);
  print(k1.alan()); // 16

  var k2 = Kare.bos();
  print(k2.alan()); // 0

  var k3 = Kare.birBirim();
  print(k3.alan()); // 1
}
```

### Kısaca:
- İsimli yapıcılar, bir sınıftan farklı şekillerde nesne oluşturmak için kullanılır.
- Kodun okunabilirliğini ve esnekliğini artırır.
- Özellikle varsayılan, boş veya özel başlatma senaryoları için idealdir.

---


## Miras (Inheritance) — Teorik ve Kodlu Açıklama

### Teorik Bilgi

**Kalıtım (Inheritance)**, bir sınıfın başka bir sınıftan özellikleri ve metotları devralmasını sağlar. Böylece kod tekrarını azaltır, ortak davranışları üst sınıfta tanımlayarak alt sınıflarda kullanabiliriz. Dart'ta kalıtım için `extends` anahtar kelimesi kullanılır.

Örneğin, `Hayvan` adlı bir üst sınıfımız ve ondan türeyen `Kedi` adlı bir alt sınıfımız olabilir. Alt sınıf, üst sınıfın tüm alan ve metotlarına erişebilir, isterse bazılarını değiştirebilir.

**@override** ise, alt sınıfta üst sınıftan gelen bir metodu veya özelliği yeniden tanımladığımızı (özelleştirdiğimizi) Dart derleyicisine bildirir. Bu sayede, alt sınıfın davranışı üst sınıftan farklı olabilir. `@override` kullanmak, kodun okunabilirliğini ve bakımını artırır; derleyiciye daima hangi metotların üst sınıftan geldiğini gösterir.

### Kod Örneği

```dart
class Hayvan {
  String isim;
  Hayvan(this.isim);

  void sesCikar() {
    print('$isim ses çıkarıyor.');
  }
}

class Kedi extends Hayvan {
  Kedi(String isim) : super(isim);

  @override // Üst sınıftaki sesCikar metodunu özelleştiriyoruz
  void sesCikar() {
    print('$isim miyavlıyor.');
  }
}

void main() {
  var k = Kedi('Minnak');
  k.sesCikar(); // Minnak miyavlıyor.
}
```

Yukarıdaki örnekte:
- `Kedi` sınıfı, `Hayvan` sınıfından kalıtım alır (`extends Hayvan`).
- `Kedi` sınıfı, `Hayvan`'daki `sesCikar` metodunu `@override` ile yeniden tanımlar.
- Böylece, `Kedi` nesnesi için `sesCikar` çağrıldığında, alt sınıftaki özel davranış çalışır.

**Kalıtım**, nesne tabanlı programlamada kodun tekrarını azaltır ve mantıksal hiyerarşi kurmamızı sağlar. **@override** ise, alt sınıfta üst sınıftan gelen metotları özelleştirirken kodun doğru ve anlaşılır olmasını sağlar.

---

## Statik üyeler (static)

```dart
class Matematik {
  static const double PI = 3.14159;

  static double alanDaire(double yaricap) => PI * yaricap * yaricap;
}

void main() {
  print(Matematik.alanDaire(3));
}
```

Statik üyeler doğrudan sınıf üzerinden çağrılır, örnek oluşturulmasına gerek yoktur.

---

## Küçük bir özet ve tavsiyeler

- Sınıflar veri ve davranışı bir arada tutar.

- Önce hangi veriye (alanlara) ihtiyacınız olduğunu, sonra hangi davranışların (metotlar) gerekli olduğunu düşünün.

- Yapıcılar nesne oluşturmayı kolaylaştırır; named constructor'lar farklı başlatma yolları sunar.

- Alanları doğrudan dışarı açmamak (gizleme) ve gerektikçe getter/setter kullanmak iyi bir pratiktir.

Eğer isterseniz, bu dosyaya daha fazla örnek (arabirimler, karışık miras, mixinler, abstract class) ekleyebilirim.
