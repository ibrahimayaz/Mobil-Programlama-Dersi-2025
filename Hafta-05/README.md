# 📚 Hafta 5: Döngü Pekiştirme, İç İçe Döngüler, switch ve String İşlemleri

Bu hafta döngüleri pekiştiriyor, iç içe (nested) döngüleri tanıyor, switch-case yapısını ve temel String işlemlerini öğreniyoruz.

## 🎯 Hedefler
- for ve while tekrar mantığı
- İç içe döngü (temel desenler)
- switch-case kullanımı
- String işlemleri: length, toUpperCase, toLowerCase, substring, contains, split

## 🔁 Temel Döngüler
```dart
for (var i = 0; i < 5; i++) {
  print(i);
}

var j = 0;
while (j < 5) {
  print(j);
  j++;
}
```

## 🔁 İç İçe Döngü Örneği
```dart
for (var satir = 0; satir < 3; satir++) {
  var line = '';
  for (var sutun = 0; sutun < 4; sutun++) {
    line += '*';
  }
  print(line);
}
```

## 🔀 switch-case
```dart
var gun = 3;
switch (gun) {
  case 1: print('Pazartesi'); break;
  case 2: print('Salı'); break;
  case 3: print('Çarşamba'); break;
  default: print('Bilinmeyen');
}
```

## 🔤 String İşlemleri
```dart
var m = 'Merhaba Dünya';
print(m.length);
print(m.toUpperCase());
print(m.toLowerCase());
print(m.substring(0,7));
print(m.contains('Dünya'));
print(m.split(' '));
```

## ✅ Örnekler
### 1) 1–10 Toplam
```dart
void main(){var toplam=0;for(var i=1;i<=10;i++){toplam+=i;}print('Toplam: $toplam');}
```
### 2) 1–5 Çarpım Tablosu
```dart
void main(){for(var i=1;i<=5;i++){for(var j=1;j<=5;j++){print('$i x $j = ${i*j}');}}}
```
### 3) Üçgen Deseni
```dart
void main(){for(var i=1;i<=5;i++){print('*'*i);}}
```
### 4) Sesli Harf Sayısı
```dart
void main(){var metin='Merhaba Arkadaşlar';var sesli='aeıioöuüAEIİOÖUÜ';var sayac=0;for(var ch in metin.split('')){if(sesli.contains(ch))sayac++;}print('Sesli: $sayac');}
```
### 5) Harf Frekansı (Basit)
```dart
void main(){var kelime='kavak';var k=0,a=0,v=0;for(var h in kelime.split('')){if(h=='k')k++;else if(h=='a')a++;else if(h=='v')v++;}print('k:$k a:$a v:$v');}
```

## ⚠️ Sık Hatalar
| Hata | Sorun | Çözüm |
|------|-------|-------|
| while sayaç yok | Sonsuz döngü | Sayaç artır |
| switch break yok | İstenmeyen akış | break ekle |
| substring sınır aşımı | Hata | Uzunluk kontrolü |
| İç içe sayaç karışması | Yanlış çıktı | Farklı değişken isimleri |

## 🧪 Alıştırmalar
1. 1–100 arası çift sayıların toplamı
2. 1–50 arası 3 ve 5 ile bölünenler
3. Verilen metindeki boşluk sayısı
4. 4 satır: "n - satır" formatı
5. 1–3 çarpım tablosunu tek satırda yaz (örn: 1x1=1 ...)

## 🏁 Ödev Önerileri
- Küçük desen üretici
- Metin analiz (sesli / boşluk)
- Mini menü (switch) tabanlı program
- Çoklu giriş (liste ile) ve özetleyici

---