# 📚 Hafta 5 - 7 Toplu Ders Notu (Tek Belge)

Bu belge Hafta 05 (Döngü Pekiştirme & String), Hafta 06 (Set & Map) ve Hafta 07 (Genel Tekrar + 25 Soru & Cevap) içeriklerini tek dosyada toplar.

---
## 🗂 İçindekiler
1. Hafta 5: Döngü Pekiştirme, İç İçe Döngü, switch, String İşlemleri
2. Hafta 6: Set ve Map (Koleksiyonlar)
3. Hafta 7: Genel Tekrar ve 25 Soru & Cevap
4. Önerilen Alıştırmalar ve Ödev Özetleri

---
# 🔵 Hafta 5: Döngü Pekiştirme, İç İçe Döngüler, switch, String İşlemleri

### 🎯 Hedefler
- for ve while tekrar mantığı
- İç içe (nested) döngü temel örnekleri
- switch-case kullanımı
- String temel fonksiyonları: length, toUpperCase, toLowerCase, substring, contains, split
- Basit desen üretme (yıldız / tablo)

### 🔁 Döngü Türleri
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

### 🔁 İç İçe Döngü Örneği
3 satır, her satırda 4 yıldız:
```dart
for (var satir = 0; satir < 3; satir++) {
  var s = '';
  for (var sutun = 0; sutun < 4; sutun++) {
    s += '*';
  }
  print(s);
}
```

### 🔀 switch-case
```dart
var gun = 3;
switch (gun) {
  case 1: print('Pazartesi'); break;
  case 2: print('Salı'); break;
  case 3: print('Çarşamba'); break;
  default: print('Bilinmeyen');
}
```

### 🔤 String İşlemleri
```dart
var m = 'Merhaba Dünya';
print(m.length);          // Uzunluk
print(m.toUpperCase());   // BÜYÜK
print(m.toLowerCase());   // küçük
print(m.substring(0,7));  // Merhaba
print(m.contains('Dünya'));// true
print(m.split(' '));      // ['Merhaba','Dünya']
```

### ✅ Örnekler
1) 1–10 Toplam:
```dart
var toplam = 0;
for (var i = 1; i <= 10; i++) toplam += i;
print('Toplam: $toplam');
```
2) 1–5 Çarpım Tablosu (okunabilir, optimize):
```dart
for (var i = 1; i <= 5; i++) {
  for (var j = 1; j <= 5; j++) {
    print('$i x $j = ${i * j}');
  }
}
```
3) Üçgen Deseni:
```dart
for (var i = 1; i <= 5; i++) {
  print('*' * i);
}
```
4) Sesli Harf Sayısı:
```dart
var metin = 'Merhaba Arkadaşlar';
var sesli = 'aeıioöuüAEIİOÖUÜ';
var sayac = 0;
for (var ch in metin.split('')) {
  if (sesli.contains(ch)) sayac++;
}
print('Sesli harf: $sayac');
```
5) Harf Frekansı (Hafta 5 seviyesi – Map yok, sadece sayım):
```dart
var kelime = 'kavak';
var kSay = 0, aSay = 0, vSay = 0; // basit yaklaşım
for (var h in kelime.split('')) {
  if (h == 'k') kSay++;
  else if (h == 'a') aSay++;
  else if (h == 'v') vSay++;
}
print('k:$kSay a:$aSay v:$vSay');
```

### ⚠️ Sık Hatalar
| Hata | Sorun | Çözüm |
|------|-------|-------|
| while içinde artış yok | Sonsuz döngü | Sayaç artır |
| switch break unutma | İstenmeyen akış | break ekle |
| substring aralık taşması | Hata | Sınırları kontrol et |
| İç içe döngüde sayaç karıştırma | Yanlış çıktı | Farklı değişken isimleri |

---
# 🟣 Hafta 7: Genel Tekrar ve 25 Soru & Cevap

### Yaklaşım Adımları
1. Problemi yeniden ifade et
2. Girdi / Çıktı netleştir
3. Adımları listede düşün
4. Kodu yaz ve test et

## ✅ 25 Soru ve Cevap
(Not: Kodlar optimize, gereksiz değişken yok.)

### 1) İki sayının toplamı
```dart
void main(){var a=12,b=8;print('Toplam: ${a+b}');}
```
### 2) Üç sınav ortalaması
```dart
void main(){var n1=70,n2=80,n3=90;print('Ortalama: ${(n1+n2+n3)/3}');}
```
### 3) Tek / Çift
```dart
void main(){var s=17;print(s%2==0?'ÇİFT':'TEK');}
```
### 4) Not kategorisi
```dart
void main(){var not=73;if(not>=85)print('Çok İyi');else if(not>=70)print('İyi');else if(not>=50)print('Geçti');else print('Kaldı');}
```
### 5) 1–50 toplam
```dart
void main(){var t=0;for(var i=1;i<=50;i++)t+=i;print(t);}
```
### 6) Listedeki en büyük
```dart
void main(){var l=[5,12,3,27,9];var en=l[0];for(var x in l){if(x>en)en=x;}print(en);}
```
### 7) Çiftleri ayrılma
```dart
void main(){var l=[3,4,7,10,12,15];var c=<int>[];for(var x in l){if(x%2==0)c.add(x);}print(c);}
```
### 8) Liste ortalaması
```dart
void main(){var n=[70,80,90,60];var t=0;for(var x in n)t+=x;print(t/n.length);}
```
### 9) Sesli harf sayısı
```dart
void main(){var m='Merhaba Dünya';var s='aeıioöuüAEIİOÖUÜ';var c=0;for(var ch in m.split('')){if(s.contains(ch))c++;}print(c);}
```
### 10) String ters çevir
```dart
void main(){var m='Dart';var t='';for(var i=m.length-1;i>=0;i--)t+=m[i];print(t);}
```
### 11) switch gün adı
```dart
void main(){var g=2;switch(g){case 1:print('Pazartesi');break;case 2:print('Salı');break;case 3:print('Çarşamba');break;default:print('Geçersiz');}}
```
### 12) 3x3 kare
```dart
void main(){for(var i=0;i<3;i++){var s='';for(var j=0;j<3;j++)s+='#';print(s);}}
```
### 13) Fonksiyon kare
```dart
int kare(int x)=>x*x;void main(){print(kare(7));}
```
### 14) Üç sayının ortalaması fonksiyon
```dart
double ort(int a,int b,int c)=>(a+b+c)/3;void main(){print(ort(10,20,30));}
```
### 15) Tek/çift String fonksiyon
```dart
String tc(int s)=>s%2==0?'Çift':'Tek';void main(){print(tc(14));}
```
### 16) Sınıf ortalama
```dart
class Ogr{String ad;int n1,n2;Ogr(this.ad,this.n1,this.n2);double ort()=> (n1+n2)/2;}void main(){print(Ogr('Ali',80,90).ort());}
```
### 17) Map not ortalaması
```dart
void main(){var m={'Mat':80,'Tür':90,'Fiz':70};var t=0;for(var v in m.values)t+=v;print(t/m.length);}
```
### 18) Harf frekansı Map
```dart
void main(){var k='kavak';var f=<String,int>{};for(var h in k.split('')){f[h]=(f[h]??0)+1;}print(f);}
```
### 19) Benzersiz rakamlar Set
```dart
void main(){var l=[1,2,2,3,3,4];print({...l});}
```
### 20) Set contains
```dart
void main(){var k={'elma','armut','muz'};print(k.contains('muz')?'Var':'Yok');}
```
### 21) Çiftleri fonksiyonla al
```dart
List<int> cift(List<int> l){var r=<int>[];for(var x in l){if(x%2==0)r.add(x);}return r;}void main(){print(cift([1,2,3,4,5,6]));}
```
### 22) Map filtre eşiğe göre
```dart
Map<String,int> filt(Map<String,int> m,int e){var r=<String,int>{};m.forEach((k,v){if(v>=e)r[k]=v;});return r;}void main(){print(filt({'Ali':50,'Ayşe':85,'Deniz':92},80));}
```
### 23) Geçme durumu sınıf
```dart
class O{String ad;int a,b,c;O(this.ad,this.a,this.b,this.c);double ort()=> (a+b+c)/3;bool gecti()=>ort()>=50;}void main(){print(O('Mert',40,70,60).gecti()?'Geçti':'Kaldı');}
```
### 24) Kelime sayısı
```dart
void main(){var c='Bugün hava çok güzel';print(c.split(' ').length);}
```
### 25) İki liste + Map seçme
```dart
Map<String,int> sec(List<String> ad,List<int> not){var r=<String,int>{};for(var i=0;i<ad.length;i++){if(not[i]>=70)r[ad[i]]=not[i];}return r;}void main(){print(sec(['Ali','Ayşe','Deniz','Mert'],[65,88,72,40]));}
```

---
# 🧪 Önerilen Alıştırmalar (Özet)
- Hafta 5: Çift sayı toplamı, boşluk sayımı, küçük çarpım tabloları
- Hafta 6: Map filtreleme, Set ile temizleme, frekans analizi
- Hafta 7: Karışık mini projeler (öğrenci listesi analiz, metin işleme)

# 🏁 Ödev Önerileri
1. Metin istatistik aracı (kelime, harf, sesli)
2. Sınıf listesi ortalama hesap + geçme sayısı
3. Ürün fiyatlarında vergi ve indirim hesaplama (Map)
4. Kullanıcı giriş simülasyonu (liste + koşul)
5. Mini rapor üretici (Set ile benzersiz, Map ile sayım)

---
# 🧠 Terimler Hızlı Tablo
| Kavram | Açıklama | Örnek |
|--------|----------|-------|
| var | Esnek tür | var x=5; |
| List | Sıralı koleksiyon | [1,2,3] |
| Set | Benzersiz | {'a','b'} |
| Map | Anahtar→Değer | {'ad':'Ali'} |
| if/else | Karar | if(x>0)... |
| switch | Çoklu eşitlik | switch(x){...} |
| for | Sayaçlı döngü | for(i=0;...) |
| while | Koşullu döngü | while(kosul) |
| Function | Tekrar kullanım | int f()=>1; |
| Class | Şablon | class O{} |

---
Hazırsan ayrı soru bankası veya test formatı da hazırlanabilir. İstersen bu belgeye ekleme yapabiliriz.
