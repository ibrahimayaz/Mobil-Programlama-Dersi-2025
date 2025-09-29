# Hafta 6 Alıştırmalar

1. Cümle: "Dart dilini seviyorum" → kelimeleri Set ile benzersiz göster.
2. Yaşlar: `{'Ali':16,'Ayşe':19,'Mert':21}` → 18+ isimleri yaz.
3. Liste: `[1,2,2,3,5,5,7]` → Set ile tekrarsız yaz.
4. "kavak" kelimesinin harf frekansını Map ile çıkar.
5. Notlar: `{'Mat':95,'Fiz':60,'Bio':72,'Tür':88}` → 80+ dersleri yaz.
6. Bir cümledeki farklı kelime sayısını bul.
7. `{'A':3,'B':5,'C':1}` içinden en büyük değere sahip key’i yaz.
8. Ürün fiyatları: `{'Kalem':12,'Defter':25,'Silgi':5}` → toplam fiyat.
9. İki setin birleşimini yaz (ör: `{1,2,3}` ve `{3,4,5}`).
10. İki setin kesişimini yaz (ör: `{1,2,3}` ve `{2,3,4}`).

İpucu (frekans):
```dart
var f = <String,int>{};
for (var ch in kelime.split('')) {
  f[ch] = (f[ch] ?? 0) + 1;
}
```