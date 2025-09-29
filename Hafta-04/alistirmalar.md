# Hafta 4 Alıştırmalar

1. `selam()` → “Hoş geldin”.
2. `ikiKat(int x)` → 2 * x döndür.
3. `ucgenCevre(a,b,c)` → toplamını döndür.
4. `puanYorum(p)` → 85+ Çok İyi / 70+ İyi / 50+ Geçti / altı Kaldı.
5. `ciftMi(int x)` → bool döndür.
6. `class Araba { marka, hiz }` + yaz metodu: “Marka: X | Hız: Y”.
7. `fahrenheit(double c)` → dönüşüm formülü: `c * 1.8 + 32`.
8. `enBuyuk(a,b,c)` → en büyük olanı döndür.
9. `kelimeUzunluk(String k)` → harf sayısı.
10. `class Oyuncu { ad, skor }` → `arttir()` skoru 10 artır.

İpucu:
```dart
int enBuyuk(int a, int b, int c) {
  var en = a;
  if (b > en) en = b;
  if (c > en) en = c;
  return en;
}
```
