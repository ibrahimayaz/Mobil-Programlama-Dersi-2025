# Dart Örnekleri ve Açıklamaları

## 1) Öğrenci Bilgi Sistemi
Bu örnek, bir öğrenci bilgi sisteminin nasıl oluşturulacağını gösterir. Aşağıda basit bir uygulama bulunuyor:

```dart
class Student {
  String name;
  int age;
  String id;

  Student(this.name, this.age, this.id);
}

void main() {
  var student = Student('Ali', 20, 'S001');
  print('Öğrenci Adı: ${student.name}, Yaş: ${student.age}, ID: ${student.id}');
}
```

### Açıklama:
Bu kodda, bir `Student` sınıfı tanımlıyoruz. `name`, `age` ve `id` özelliklerini içeren bir yapıcı fonksiyon ile birlikte. `main` fonksiyonu içerisinde bir öğrenci nesnesi oluşturup bilgilerini yazdırıyoruz.

### Yaygın Hatalar:
- Sınıf adının baş harfinin büyük olmasına dikkat edin.
- Değişken isimlerini anlamlı koyun.

## 2) Kişisel Bilgi Formu
Kullanıcıdan kişisel bilgileri almak için basit bir form oluşturuyoruz:

```dart
import 'dart:io';

void main() {
  print('Adınızı girin: ');
  String name = stdin.readLineSync()!;
  print('Yaşınızı girin: ');
  int age = int.parse(stdin.readLineSync()!);

  print('Ad: $name, Yaş: $age');
}
```

### Açıklama:
Bu örnekte kullanıcıdan ad ve yaş bilgilerini alıyoruz. `stdin.readLineSync()` metodu ile kullanıcıdan veri alıyoruz ve veriyi yazdırıyoruz.

### Yaygın Hatalar:
- Kullanıcıdan alınan bilgilerin boş olup olmadığını kontrol edin.
- `int.parse()` kullanırken hata yakalamayı unutmayın.

## 3) Basit Hesap Makinesi
Bu örnek, toplama ve çıkarma işlemlerini gerçekleştiren basit bir hesap makinesidir:

```dart
import 'dart:io';

void main() {
  print('Birinci sayıyı girin: ');
  double num1 = double.parse(stdin.readLineSync()!);
  print('İkinci sayıyı girin: ');
  double num2 = double.parse(stdin.readLineSync()!);

  print('Toplam: ${num1 + num2}');
  print('Fark: ${num1 - num2}');
}
```

### Açıklama:
İki sayı alıp toplama ve çıkarma işlemleri yapıyoruz. `double.parse()` ile alınan string değerlerini double tipine çeviriyoruz.

### Yaygın Hatalar:
- Kullanıcının geçerli bir sayı girmediği durumları kontrol edin.
- İşlem sonucu ondalıklı sayıları doğru formatta gösterin.

## 4) Okul Bilgi Sistemi
Bir okulun bilgi sistemini temsil eden basit bir uygulama:

```dart
class School {
  String name;
  List<Student> students;

  School(this.name, this.students);

  void displayStudents() {
    for (var student in students) {
      print('Öğrenci: ${student.name}');
    }
  }
}

void main() {
  var students = [Student('Ali', 20, 'S001'), Student('Ayşe', 21, 'S002')];
  var school = School('ABC Okulu', students);
  school.displayStudents();
}
```

### Açıklama:
`School` sınıfında bir liste ile öğrencileri tutuyoruz ve `displayStudents` metodu ile öğrencilerin adlarını yazdırıyoruz.

### Yaygın Hatalar:
- Listelerin doğru bir şekilde oluşturulmasına dikkat edin.
- Fonksiyonları anlamlı adlarla adlandırın.

## Kelime Dağarcığı
| Terim                | Anlam                     |
|----------------------|--------------------------|
| Sınıf                | Class                    |
| Değişken             | Variable                 |
| Metod                | Method                   |
| Liste                | List                     |

## Ödev
1. Yukarıdaki örnekleri kullanarak kendi projelerinizi oluşturun.
2. Her projede en az 2 özellik ekleyin.
3. Kodlarınızı yorumlarla açıklayın.